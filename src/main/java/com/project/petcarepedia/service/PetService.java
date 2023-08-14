package com.project.petcarepedia.service;

import com.project.petcarepedia.dto.MemberDto;
import com.project.petcarepedia.dto.PageDto;
import com.project.petcarepedia.dto.PetDto;
import com.project.petcarepedia.dto.SessionDto;
import com.project.petcarepedia.repository.MemberMapper;
import com.project.petcarepedia.repository.PetMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PetService {
    @Autowired
    PetMapper petMapper;

    public List<PetDto> list(String mid) {return petMapper.list(mid);}
    public PetDto content(String pid) {return petMapper.content(pid);}
    public int insert(PetDto petDto) {return petMapper.insert(petDto);}
    public int update(PetDto petDto) {return petMapper.update(petDto);}
    public int delete(String pid) {return petMapper.delete(pid);}
}
