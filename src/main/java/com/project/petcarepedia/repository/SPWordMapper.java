package com.project.petcarepedia.repository;

import com.project.petcarepedia.dto.SPWordDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SPWordMapper {
    int insert(String word);
    List<SPWordDto> select();
}
