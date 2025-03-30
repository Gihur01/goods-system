package com.macro.mall.demo.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class Recipient {
    @JsonProperty("Name")
    private String name;

    @JsonProperty("Company")
    private String company;

    @JsonProperty("Addres1")
    private String addres1;

    @JsonProperty("Addres2")
    private String addres2;

    @JsonProperty("HouseNum")
    private String houseNum;

    @JsonProperty("Tel")
    private String tel;

    @JsonProperty("Mobile")
    private String mobile;

    @JsonProperty("Province")
    private String province;

    @JsonProperty("City")
    private String city;

    @JsonProperty("Post")
    private String post;

    @JsonProperty("Email")
    private String email;

    @JsonProperty("Fax")
    private String fax;

    @JsonProperty("Contaxno")
    private String contaxno;
}
