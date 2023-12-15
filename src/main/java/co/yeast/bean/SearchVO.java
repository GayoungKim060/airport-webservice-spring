package co.yeast.bean;

import lombok.Data;

@Data
public class SearchVO {
    private String searchType;
    // airline, gate ...
    private String keyword;
    private String remark;

}
