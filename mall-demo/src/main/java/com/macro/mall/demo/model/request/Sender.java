package com.macro.mall.demo.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class Sender {
    @JsonProperty("Name")
    private String name;

    @JsonProperty("Company")
    private String company;

    @JsonProperty("Country")
    private String country;

    @JsonProperty("Addres")
    private String address;

    @JsonProperty("Mobile")
    private String mobile;

    @JsonProperty("Tel")
    private String tel;

    @JsonProperty("Post")
    private String post;

    @JsonProperty("Province")
    private String province;

    @JsonProperty("City")
    private String city;

    @JsonProperty("Town")
    private String town;

    @JsonProperty("Email")
    private String email;

    @JsonProperty("Fax")
    private String fax;
}
