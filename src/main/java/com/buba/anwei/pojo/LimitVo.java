package com.buba.anwei.pojo;

import lombok.Data;

import java.util.List;

/**
 * @author 23815
 * @create 2019-03-27 9:50
 * @desc 分业
 **/
@Data
public class LimitVo {
    private Integer id;
    private Integer limit;//每页显示数量
    private Integer offset;//页码
    private String sort;
    private String order;
    private int total;
    private List rows;

}
