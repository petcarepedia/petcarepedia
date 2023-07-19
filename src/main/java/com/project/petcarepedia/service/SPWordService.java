package com.project.petcarepedia.service;

import com.project.petcarepedia.dto.SPWordDto;
import com.project.petcarepedia.repository.SPWordMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SPWordService {
    @Autowired
    SPWordMapper spWordMapper;

    public int insert(String word) { return spWordMapper.insert(word); }
    public List<SPWordDto> select() { return spWordMapper.select(); }
}
