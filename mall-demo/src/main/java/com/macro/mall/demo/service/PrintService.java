package com.macro.mall.demo.service;

import com.macro.mall.demo.model.request.PrintAddressRequest;
import com.macro.mall.demo.model.request.PrintInvoiceRequest;
import com.macro.mall.demo.model.request.PrintSupportedRequest;

public interface PrintService {
    String printAddressLabel(PrintAddressRequest request) throws Exception;
    String getSupportedPapers(PrintSupportedRequest request) throws Exception;
    String printInvoice(PrintInvoiceRequest request) throws Exception;
}
