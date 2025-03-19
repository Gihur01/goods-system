package com.macro.mall.demo.controller;

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.demo.dto.Verify;
import com.macro.mall.demo.service.UmsEuexService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@Api(tags = "UmsEuexController")
@Tag(name = "UmsEuexController", description = "后台用户管理")
@RequestMapping("/ums")
public class UmsEuexController {
    @Autowired
    private UmsEuexService euexService;
    @ApiOperation("K5身份验证")
    @RequestMapping(value = "/authentication", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<String> authentication(@RequestBody Verify verify) {
        boolean isValid = euexService.validateAuth(verify);
        if (!isValid) {
            return CommonResult.validateFailed("Clientid 或 Token 无效");
        }
        return CommonResult.success("hello world");
    }

}
