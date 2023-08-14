package com.project.petcarepedia.repository;

import com.project.petcarepedia.dto.PetDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PetMapper {
    List<PetDto> list(String mid);
    PetDto content(String pid);
    int insert(PetDto petDto);
    int update(PetDto petDto);
    int delete(String pid);
}
