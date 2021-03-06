package com.fh.taolijie.controller.restful.admin;

import cn.fh.security.utils.CredentialUtils;
import com.fh.taolijie.component.ListResult;
import com.fh.taolijie.component.ResponseText;
import com.fh.taolijie.constant.ErrorCode;
import com.fh.taolijie.domain.acc.MemberModel;
import com.fh.taolijie.service.AccountService;
import com.fh.taolijie.service.UserService;
import com.fh.taolijie.utils.Constants;
import com.fh.taolijie.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.swing.text.rtf.RTFEditorKit;

/**
 * 只有管理员可调用，与账号相关操作接口
 * Created by whf on 8/22/15.
 */
@RestController
@RequestMapping("/api/manage/user")
public class RestUserAdminController {
    @Autowired
    AccountService accService;

    @Autowired
    UserService userService;


    /**
     * 根据用户名模糊查询
     * @param username
     * @return
     */
    @RequestMapping(value = "/search", method = RequestMethod.POST, produces = Constants.Produce.JSON)
    public ResponseText searchByName(@RequestParam String username,
                                     @RequestParam(defaultValue = "0") int pn,
                                     @RequestParam(defaultValue = Constants.PAGE_CAP) int ps) {

        pn = PageUtils.getFirstResult(pn, ps);
        ListResult<MemberModel> lr = accService.searchMember(username, pn, ps);

        return new ResponseText(lr);
    }


    /**
     * 查询所有用户
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET, produces = Constants.Produce.JSON)
    public ResponseText getList(@RequestParam(defaultValue = "0") int pageNumber,
                                @RequestParam(defaultValue = Constants.PAGE_CAPACITY + "") int pageSize) {

        pageNumber = PageUtils.getFirstResult(pageNumber, pageSize);

        ListResult<MemberModel> list = accService.getMemberList(pageNumber, pageSize);
        return new ResponseText(list);
    }

    /**
     * 过虑查询用户
     */
    @RequestMapping(value = "/filter", method = RequestMethod.POST, produces = Constants.Produce.JSON)
    public ResponseText filter(@RequestParam(defaultValue = "0") int pn,
                               @RequestParam(defaultValue = Constants.PAGE_CAPACITY + "") int ps,

                               // 过虑条件
                               @RequestParam(required = false, value = "un") String username,
                               @RequestParam(required = false, value = "valid") Integer valid,
                               @RequestParam(required = false, value = "role") String rolename) {

        pn = PageUtils.getFirstResult(pn, ps);

        MemberModel cmd = new MemberModel(pn, ps);
        cmd.setUsername(username);
        if (null != valid) {
            cmd.setValid(valid == 1);
        }
        cmd.setRolename(rolename);

        ListResult<MemberModel> lr = accService.findBy(cmd);

        return new ResponseText(lr);
    }

    /**
     * 根据用户名精确查询用户
     * @param username
     * @return
     */
    @RequestMapping(value = "/name", method = RequestMethod.POST, produces = Constants.Produce.JSON)
    public ResponseText getByUsername(@RequestParam String username) {

        MemberModel mem = accService.findMember(username, true);
        if (null == mem) {
            return new ResponseText(ErrorCode.NOT_FOUND);
        }

        mem.setPassword(null);
        //mem.setAppToken(null);
        mem.setResetPasswordToken(null);

        return new ResponseText(mem);
    }

    /**
     * 重置用户密码
     * @return
     */
    @RequestMapping(value = "/{id}/pwd", method = RequestMethod.PUT, produces = Constants.Produce.JSON)
    public ResponseText resetPwd(@PathVariable("id") Integer userId,
                                 @RequestParam String newPwd) {
        // 参数验证
        int LEN = newPwd.length();
        if (LEN <= 0 || LEN >= 30) {
            return new ResponseText(ErrorCode.INVALID_PARAMETER);
        }


        // 无条件更新密码
        MemberModel cmd = new MemberModel();
        cmd.setId(userId);
        cmd.setPassword(CredentialUtils.sha(newPwd));
        int rows = accService.updateMember(cmd);

        return rows > 0 ? ResponseText.getSuccessResponseText() : new ResponseText(ErrorCode.NOT_FOUND);
    }

    /**
     * 封号
     * @return
     */
    @RequestMapping(value = "/block/{id}", method = RequestMethod.PUT, produces = Constants.Produce.JSON)
    public ResponseText block(@PathVariable("id") Integer memId) {
        accService.invalidAccount(memId);

        return ResponseText.getSuccessResponseText();
    }

    /**
     * 解封
     * @param memId
     * @return
     */
    @RequestMapping(value = "/block/{id}", method = RequestMethod.DELETE, produces = Constants.Produce.JSON)
    public ResponseText unblock(@PathVariable("id") Integer memId) {
        accService.validateAccount(memId);

        return ResponseText.getSuccessResponseText();
    }
}
