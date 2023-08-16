package com.project.petcarepedia.service;

import com.project.petcarepedia.dto.PageDto;
import com.project.petcarepedia.dto.ReviewDto;
import com.project.petcarepedia.repository.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewService {
    @Autowired
    ReviewMapper reviewMapper;

    public List<ReviewDto> RM_select(String hid) {
        return reviewMapper.RM_select(hid);
    }
    public List<ReviewDto> RM_select2(String hid) {
        return reviewMapper.RM_select2(hid);
    }
    public List<ReviewDto> RM_select3(String hid) {
        return reviewMapper.RM_select3(hid);
    }
    public List<ReviewDto> RM_select4(String hid) {
        return reviewMapper.RM_select4(hid);
    }
    public List<ReviewDto> list() {
        return reviewMapper.list();
    }
    public List<ReviewDto> listPage(PageDto pageDto) {
        return reviewMapper.listPage(pageDto);
    }
    public List<ReviewDto> searchListPage(PageDto pageDto) {
        return reviewMapper.searchListPage(pageDto);
    }
    public ReviewDto content(String rid) {
        return reviewMapper.content(rid);
    }
    public ReviewDto enter_content(String rid) {
        return reviewMapper.enter_content(rid);
    }
    public int insert(ReviewDto reviewDto) {
        return reviewMapper.insert(reviewDto);
    }
    public int update(ReviewDto reviewDto) {
        return reviewMapper.update(reviewDto);
    }
    public int delete(String rid) {
        return reviewMapper.delete(rid);
    }
    public List<ReviewDto> bestList(PageDto pageDto) {
        return reviewMapper.bestList(pageDto);
    }
    public int count() {
        return reviewMapper.count();
    }

    public List<ReviewDto> Mylist(PageDto pageDto) {
        return reviewMapper.Mylist(pageDto);
    }

    public List<ReviewDto> MRlist(PageDto pageDto) {
        return reviewMapper.MRlist(pageDto);
    }

    public List<ReviewDto> MRRlist(PageDto pageDto) {
        return reviewMapper.MRRlist(pageDto);
    }

    public ReviewDto bookingReveiw(String bid) {
        return reviewMapper.bookingReveiw(bid);
    }

    public int bookingReveiwCount(String bid) {
        return reviewMapper.bookingReveiwCount(bid);
    }
}
