package com.fh.taolijie.controller.restful;

import com.fh.taolijie.component.ListResult;
import com.fh.taolijie.component.ResponseText;
import com.fh.taolijie.domain.order.PayOrderModel;
import com.fh.taolijie.service.acc.OrderService;
import com.fh.taolijie.utils.Constants;
import com.fh.taolijie.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * Created by whf on 11/20/15.
 */
@RestController
@RequestMapping("/api/manage/order")
public class RestOrderAdminCtr {
    @Autowired
    private OrderService orderService;

    /**
     * 查询全部订单
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET, produces = Constants.Produce.JSON)
    public ResponseText list(@RequestParam(defaultValue = "0") int pn,
                             @RequestParam(defaultValue = Constants.PAGE_CAP) int ps) {

        pn = PageUtils.getFirstResult(pn, ps);
        ListResult<PayOrderModel> lr = orderService.findAll(pn, ps);

        return new ResponseText(lr);
    }

    /**
     * 根据id查询订单
     * @param orderId
     * @return
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = Constants.Produce.JSON)
    public ResponseText byId(@PathVariable("id") Integer orderId) {
        PayOrderModel order = orderService.findOrder(orderId);

        return new ResponseText(order);
    }
}
