package com.fundly.project.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fundly.project.exception.ProjectAddFailureException;
import com.fundly.project.exception.ProjectNofFoundException;
import com.fundly.project.service.ProjectService;
import com.persistence.dto.*;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.MediaType;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@Slf4j
@ExtendWith(MockitoExtension.class)
class ProjectEditorControllerTest {
    @Mock
    ProjectService service;
    @InjectMocks
    ProjectEditorController projectEditorController;
    MockMvc mockMvc;
    ObjectMapper objectMapper;
    private ProjectInfoUpdateRequest request;
    private ProjectInfoUpdateResponse response;
    private String pj_id;
    private byte[] requestJson;
    private String user_id;
    private String editingProject;

    @BeforeEach
    void setUp() throws JsonProcessingException {
        mockMvc = MockMvcBuilders.standaloneSetup(projectEditorController).build();
        objectMapper = new ObjectMapper();

        pj_id = "01";
        user_id = "mulgom";
        request = ProjectInfoUpdateRequest.builder().pj_id(pj_id).build();
        response = ProjectInfoUpdateResponse.builder().pj_id(pj_id).build();
        requestJson = objectMapper.writeValueAsBytes(request);
        editingProject = "editingProject";
    }

    @Test
    void contextLoad() {
    }

    @Test
    @DisplayName("getStart() 비로그인 유저가 프로젝트 에디터에 진입하면 지금 시작하기 버튼이 로그인창으로 이동시킨다.")
    void unLoginedUser_start_editing() throws Exception {
//        로그인 하지 않은 유저가 프로젝트 에디터 시작페이지에 들어오면 로그인 페이지로 이동시킨다.

        mockMvc.perform(get("/editor/start"))
                .andExpect(status().isOk())
                .andExpect(model().attributeDoesNotExist(editingProject))
                .andExpect(forwardedUrl("user/login"))
                .andDo(print());

        verify(service, never()).getEditingProjectId(any());
    }

    @Test
    @DisplayName("getStart() 작성중인 프로젝트가 존재하는 유저가 프로젝트 에디터 시작페이지를 요청한다.")
    void get_start_page() throws Exception {
//        eferje

        given(service.getEditingProjectId(user_id)).willReturn(pj_id);

        mockMvc.perform(get("/editor/start").sessionAttr("user_email", user_id))
                .andExpect(status().isOk())
                .andExpect(model().attributeExists("pj_id"))
                .andExpect(forwardedUrl("project/start"))
                .andDo(print());

        verify(service).getEditingProjectId(user_id);
    }

    @Test
    @DisplayName("getStart() 프로젝트 올리기 페이지에 작성중인 프로젝트가 존재하지 않는다.")
    void get_start_with_project() throws Exception {
        ProjectStarter pjStarter = ProjectStarter.builder().build();
        given(service.getEditingProjectId(user_id)).willThrow(ProjectNofFoundException.class);

        mockMvc.perform(get("/editor/start").sessionAttr("user_email", user_id))
                .andExpect(status().isOk())
                .andExpect(model().attributeDoesNotExist("pj_id"))
                .andExpect(forwardedUrl("project/start"))
                .andDo(print());

        verify(service).getEditingProjectId(user_id);
    }
    @Test
    @DisplayName("getInfo(pj_id) 프로젝트 아이디가 공백일때")
    void getInfoInputEmpty() throws Exception {
        mockMvc.perform(get("/editor/info").param("pj_id", ""))
                .andExpect(status().isOk())
                .andExpect(forwardedUrl("project/clientError"))
                .andExpect(model().attributeExists("errorMsg"))
                .andDo(print());
    }

    @Test
    @DisplayName("getInfo(pj_id) 프로젝트 아이디가 null")
    void getInfoInputNull() throws Exception {
        mockMvc.perform(get("/editor/info"))
                .andExpect(status().isOk())
                .andExpect(forwardedUrl("project/clientError"))
                .andExpect(model().attributeExists("errorMsg"))
                .andDo(print());
    }

    @Test
    @DisplayName("getInfo(pj_id) pj_id로 조회되는 프로젝트가 없을때")
    void project_not_find() throws Exception {
//        이어서 작성하기를 눌렀는데 조회되는 프로젝트가 없는 경우.
//        프로젝트 아이디로 조회되는 프로젝트가 없다.(비정상)
        given(service.getProjectBasicInfo(any())).willThrow(ProjectNofFoundException.class);

        mockMvc.perform(get("/editor/info").param("pj_id",pj_id))
                .andExpect(status().isOk())
                .andExpect(forwardedUrl("project/clientError"))
                .andExpect(model().attributeExists("errorMsg"))
                .andDo(print());
    }
    @Test
    @DisplayName("getInfo() 유저가 편집중인 프로젝트를 가져온다.")
    void getEditingProject() throws Exception {
        ProjectBasicInfo pjInfo = ProjectBasicInfo.builder().pj_id(pj_id).build();
        given(service.getProjectBasicInfo(any())).willReturn(pjInfo);

        mockMvc.perform(get("/editor/info").param("pj_id", pj_id))
                .andExpect(status().isOk())
                .andExpect(model().attributeExists("basicInfo"))
                .andExpect(forwardedUrl("project.basicInfo"))
                .andDo(print());
    }

    @Test
    @DisplayName("editNewProject() 비로그인 유저가 지금 시작하기 버튼 클릭")
    void unLogined_new_project() throws Exception {
        mockMvc.perform(post("/editor/info"))
                .andExpect(status().isOk())
                .andExpect(forwardedUrl("project/clientError"))
                .andExpect(model().attributeExists("errorMsg"))
                .andDo(print());
    }
    @Test
    @DisplayName("editNewProject() 새로운 프로젝트 생성을 실패했다.")
    void editNewProject() throws Exception {
        ProjectAddRequest addRequest = ProjectAddRequest.builder().user_id(user_id).build();

        given(service.add(addRequest)).willThrow(ProjectAddFailureException.class);

        mockMvc.perform(post("/editor/info").sessionAttr("user_email", user_id))
                .andExpect(status().isOk())
                .andExpect(forwardedUrl("project/error"))
                .andDo(print());

    }

    @Test
    @DisplayName("editNewProject() 새로운 프로젝트 생성 성공")
    void new_project_success() throws Exception {
        ProjectAddRequest addRequest = ProjectAddRequest.builder().user_id(user_id).build();
        ProjectAddResponse addResponse = ProjectAddResponse.builder().pj_id(pj_id).sel_id(user_id).sel_name("한윤재").build();
        given(service.add(addRequest)).willReturn(addResponse);

        mockMvc.perform(post("/editor/info").sessionAttr("user_email", user_id))
                .andExpect(status().isOk())
                .andExpect(forwardedUrl("project.basicInfo"))
                .andExpect(model().attributeExists("basicInfo"))
                .andDo(print());
    }

    @Test
    @DisplayName("updateBasicInfo() 업데이트 요청에 프로젝트아이디가 없다.")
    void 업데이트요청에프로젝트아이디가없다() throws Exception {
        ProjectInfoUpdateRequest updateRequest = ProjectInfoUpdateRequest.builder().pj_id(null).build();
        byte[] json = objectMapper.writeValueAsBytes(updateRequest);
        mockMvc.perform(patch("/editor/info").contentType(MediaType.APPLICATION_JSON).content(json))
                .andExpect(status().isBadRequest())
                .andDo(print());
    }

    @Test
    @DisplayName("updateBasicInfo() 정상적으로 업데이트가 수행됐을경우")
    void 업데이트성공() throws Exception {
        ProjectInfoUpdateRequest updateRequest = ProjectInfoUpdateRequest.builder().pj_id("01").build();
        byte[] json = objectMapper.writeValueAsBytes(updateRequest);

        given(service.updatePjInfo(updateRequest)).willReturn(any());

        mockMvc.perform(patch("/editor/info").contentType(MediaType.APPLICATION_JSON).content(json))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON))
                .andExpect(content().string("true"))
                .andDo(print());
    }

    @Test
    @DisplayName("updateBasicInfo() 업데이트 대상 프로젝트를 찾지 못했다.")
    void 업데이트실패() throws Exception {
        given(service.updatePjInfo(any())).willThrow(ProjectNofFoundException.class);

        ProjectInfoUpdateRequest updateRequest = ProjectInfoUpdateRequest.builder().pj_id("01").build();
        byte[] json = objectMapper.writeValueAsBytes(updateRequest);

        mockMvc.perform(patch("/editor/info").contentType(MediaType.APPLICATION_JSON).content(json))
                .andExpect(status().is5xxServerError())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON))
                .andExpect(content().string("false"))
                .andDo(print());
    }
}
