package com.fh.taolijie.controller.restful;

import cn.fh.security.credential.Credential;
import com.fh.taolijie.component.ResponseText;
import com.fh.taolijie.constant.ErrorCode;
import com.fh.taolijie.domain.RecommendedPostModel;
import com.fh.taolijie.service.RecommendService;
import com.fh.taolijie.utils.Constants;
import com.fh.taolijie.utils.SessionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by whf on 8/22/15.
 */
@RestController
@RequestMapping("/api/u/recommend")
public class RestCommendUController {
    @Autowired
    RecommendService recoService;


    /**
     * 创建推荐信息
     * <p>{@code POST /}
     *
     * @param model
     */
    @RequestMapping(method = RequestMethod.POST, produces = Constants.Produce.JSON)
    public ResponseText add(RecommendedPostModel model,
                            HttpServletRequest req) {
        // 三个id不能同时为空
        if (null == model.getShId() && null == model.getJobId() && null == model.getResumeId()) {
            return new ResponseText(ErrorCode.INVALID_PARAMETER);
        }

        Credential credential = SessionUtils.getCredential(req);
        if (null == credential) {
            return new ResponseText(ErrorCode.NOT_LOGGED_IN);
        }

        model.setMemberId(credential.getId());
        model.setValidation(false);

        // 检查申请是否已经存在
        boolean exist = recoService.checkRecommendExist(model);
        if (exist) {
            return new ResponseText(ErrorCode.EXISTS);
        }

        Integer id = recoService.add(model);

        return new ResponseText(id);
    }
}
