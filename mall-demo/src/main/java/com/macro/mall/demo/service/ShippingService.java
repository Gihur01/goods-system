package com.macro.mall.demo.service;

import com.macro.mall.demo.model.request.ShippingCancelRequest;
import com.macro.mall.demo.model.request.ShippingTransferRequest;

public interface ShippingService {
    String cancelShipping(ShippingCancelRequest request) throws Exception;
    String getTransferNumber(ShippingTransferRequest request) throws Exception;
}
