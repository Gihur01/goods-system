package com.macro.mall.controller;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.dto.*;
import com.macro.mall.model.*;
import com.macro.mall.service.OmsOrderService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiOperation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 订单管理Controller
 */
@Controller
@Api(tags = "OmsOrderController")
@Tag(name = "OmsOrderController", description = "订单管理")
@RequestMapping("/order")
public class OmsOrderController {
    @Autowired
    private OmsOrderService orderService;

    @ApiOperation("查询订单oms_order")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<CommonPage<OmsOrder>> list(OmsOrderQueryParam queryParam,
                                                   @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                                                   @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        List<OmsOrder> orderList = orderService.list(queryParam, pageSize, pageNum);
        return CommonResult.success(CommonPage.restPage(orderList));
    }

    @ApiOperation("查询订单商品oms_order_item")
    @RequestMapping(value = "/listItem", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<CommonPage<OmsOrderItem>> listItem(OmsOrderItemQueryParam queryParam,
                                                            @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                                                            @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        List<OmsOrderItem> orderList = orderService.listItem(queryParam, pageSize, pageNum);
        return CommonResult.success(CommonPage.restPage(orderList));
    }

    @ApiOperation("查询包裹单")
    @RequestMapping(value = "/listParcel", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<CommonPage<OmsOrderParcel>> listParcel(OmsOrderParcelQueryParam queryParam,
                                                               @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                                                               @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        List<OmsOrderParcel> orderList = orderService.listParcel(queryParam, pageSize, pageNum);
        return CommonResult.success(CommonPage.restPage(orderList));
    }

    @ApiOperation("批量获取包裹编号")
    @RequestMapping(value = "/update/parcel", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult getParcelSn(@RequestParam("parcelId") List<Long> ids) {
        int count = orderService.getParcelSn(ids);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @ApiOperation("打印包裹面单")
    @RequestMapping(value = "/printLabel", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<byte[]> printShippingLabels(@RequestBody List<String> parcelSn) {
        byte[] pdfBytes = orderService.getPrintedLabels(parcelSn);

        if (pdfBytes == null || pdfBytes.length == 0) {
            return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
        }

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_PDF);
        headers.setContentDisposition(ContentDisposition.attachment()
                .filename("shipping-labels.pdf")
                .build());

        return new ResponseEntity<>(pdfBytes, headers, HttpStatus.OK);
    }

    @ApiOperation("批量备货")
    @RequestMapping(value = "/update/stockup", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult<List<OmsOrderItemSimple>> stockup(@RequestBody List<Long> parcelIds) {
        List<OmsOrderItemSimple> count = orderService.stockup(parcelIds);
        return CommonResult.success(count);
    }

    @ApiOperation("备货完成")
    @RequestMapping(value = "/update/completePacking", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult completePacking(@RequestBody List<Long> parcelIds) {
        int count = orderService.completePacking(parcelIds);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @ApiOperation("包裹揽收")
    @RequestMapping(value = "/update/collectParcel", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult collectParcel(@RequestBody List<Long> parcelIds) {
        int count = orderService.collectParcel(parcelIds);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @ApiOperation("批量发货")
    @RequestMapping(value = "/update/delivery", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult delivery(@RequestBody List<OmsOrderDeliveryParam> deliveryParamList) {
        int count = orderService.delivery(deliveryParamList);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @ApiOperation("批量关闭订单")
    @RequestMapping(value = "/update/close", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult close(@RequestParam("ids") List<Long> ids, @RequestParam String note) {
        int count = orderService.close(ids, note);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @ApiOperation("批量删除订单")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult delete(@RequestParam("ids") List<Long> ids) {
        int count = orderService.delete(ids);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @ApiOperation("获取订单详情：订单信息、商品信息、操作记录")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<OmsOrderDetail> detail(@PathVariable Long id) {
        OmsOrderDetail orderDetailResult = orderService.detail(id);
        return CommonResult.success(orderDetailResult);
    }

    @ApiOperation("用户取消订单")
    @RequestMapping(value = "/cancelUserOrder", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult cancelUserOrder(@RequestParam String orderSn) {
        try {
            // 校验订单是否可以取消
            boolean canCancel = orderService.canCancelOrder(orderSn);
            if (!canCancel) {
                return CommonResult.failed("该订单不能被取消");
            }

            // 执行取消操作
            int count = orderService.cancelOrder(orderSn);
            if (count > 0) {
                return CommonResult.success("订单已成功取消");
            }
            return CommonResult.failed("取消订单失败");
        } catch (Exception e) {
            return CommonResult.failed("系统异常：" + e.getMessage());
        }
    }

    @ApiOperation("用户确认收货")
    @RequestMapping(value = "/confirmReceiveOrder", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult confirmReceiveOrder(@RequestParam String orderSn) {
        try {
            // 校验订单是否可以确认收货
            boolean canConfirm = orderService.canConfirmReceive(orderSn);
            if (!canConfirm) {
                return CommonResult.failed("该订单不能确认收货");
            }

            // 执行确认收货操作
            int count = orderService.confirmReceiveOrder(orderSn);
            if (count > 0) {
                return CommonResult.success("订单已确认收货");
            }
            return CommonResult.failed("确认收货失败");
        } catch (Exception e) {
            return CommonResult.failed("系统异常：" + e.getMessage());
        }
    }

    @ApiOperation("修改收货人信息")
    @RequestMapping(value = "/update/receiverInfo", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult updateReceiverInfo(@RequestBody OmsReceiverInfoParam receiverInfoParam) {
        int count = orderService.updateReceiverInfo(receiverInfoParam);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @ApiOperation("修改订单费用信息")
    @RequestMapping(value = "/update/moneyInfo", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult updateReceiverInfo(@RequestBody OmsMoneyInfoParam moneyInfoParam) {
        int count = orderService.updateMoneyInfo(moneyInfoParam);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @ApiOperation("备注订单")
    @RequestMapping(value = "/update/note", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult updateNote(@RequestParam("id") Long id,
                                   @RequestParam("note") String note,
                                   @RequestParam("status") Integer status) {
        int count = orderService.updateNote(id, note, status);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }
}
