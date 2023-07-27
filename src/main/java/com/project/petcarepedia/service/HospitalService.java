package com.project.petcarepedia.service;

import com.project.petcarepedia.dto.HospitalDto;
import com.project.petcarepedia.dto.PageDto;
import com.project.petcarepedia.repository.HospitalMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class HospitalService {
    @Autowired
    HospitalMapper hospitalMapper;

    public List<HospitalDto> Hslist2(PageDto pageDto){return hospitalMapper.Hslist2(pageDto);}

    public List<HospitalDto> Hslist(PageDto pageDto){return hospitalMapper.Hslist(pageDto);}

    public List<HospitalDto> Hlist(PageDto pageDto){return hospitalMapper.Hlist(pageDto);}

    public List<HospitalDto> list(PageDto pageDto){return  hospitalMapper.list(pageDto);}

    public int totalRowCount(){return hospitalMapper.totalRowCount();}
    public HospitalDto selectStar(String hid){return hospitalMapper.selectStar(hid);}
    public ArrayList<HospitalDto> searchGloc(String gloc){return hospitalMapper.searchGloc(gloc);}
    public List<Object> search(String hname) {return hospitalMapper.search(hname);}
    public int delete(String hid){return hospitalMapper.delete(hid);}
    public int update(HospitalDto hospitalDto){return hospitalMapper.update(hospitalDto);}
    public HospitalDto content(String hid){return hospitalMapper.content(hid);}
    public ArrayList<HospitalDto> select(){return hospitalMapper.list2();}
    public HospitalDto selectTime(String hid){return hospitalMapper.selectTime(hid);}
    public int insert(HospitalDto hospitalDto){return hospitalMapper.insert(hospitalDto);}
    public int manager_insert(HospitalDto hospitalDto){
        return hospitalMapper.manager_insert(hospitalDto);
    }

}
