package com.project.petcarepedia.service;

import com.project.petcarepedia.dto.BookingDto;
import com.project.petcarepedia.dto.BookingReviewDto;
import com.project.petcarepedia.dto.PageDto;
import com.project.petcarepedia.repository.BookingMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BookingService {
    @Autowired
    private BookingMapper bookingMapper;

    public int insert(BookingDto bookingDto) {
        return bookingMapper.insert(bookingDto);
    }

    public int checkBooking(BookingDto bookingDto) {
        return bookingMapper.checkBooking(bookingDto);
    }

    public ArrayList<BookingDto> select() {
        return bookingMapper.select();
    }

    public BookingDto select2(String bid) {
        return bookingMapper.select2(bid);
    }

    public ArrayList<BookingDto> search(String mid) {
        return bookingMapper.search(mid);
    }

    public ArrayList<BookingDto> search1(String mid) {
        return bookingMapper.search1(mid);
    }

    public ArrayList<BookingDto> search2(String mid) {
        return bookingMapper.search2(mid);
    }

    public ArrayList<BookingReviewDto> search3(String mid) {
        return bookingMapper.search3(mid);
    }

    public ArrayList<BookingDto> search4(String mid) {
        return bookingMapper.search4(mid);
    }

    public ArrayList<BookingDto> search5(String mid) {
        return bookingMapper.search5(mid);
    }

    public BookingDto reviewCheck(String hid, String mid) {
        return bookingMapper.reviewCheck(hid, mid);
    }

    public ArrayList<BookingDto> selectTime() {
        return bookingMapper.selectTime();
    }

    public BookingDto selectTime2(String hid) {
        return bookingMapper.selectTime2(hid);
    }

    public int update(BookingDto bookingDto) {
        return bookingMapper.update(bookingDto);
    }

    public int delete(String bid) {
        return bookingMapper.delete(bid);
    }

    public int Bselect(String bid) {
        return bookingMapper.Bselect(bid);
    }

    /*page_mapper*/
    public List<BookingDto> Bslist(PageDto pageDto) {
        return bookingMapper.Bslist(pageDto);
    }

    public List<BookingDto> Blist(PageDto pageDto) {
        return bookingMapper.Blist(pageDto);
    }

    /*07.26*/
    public List<BookingDto> HBlist(PageDto pageDto) {return bookingMapper.HBlist(pageDto);}
    public List<BookingDto> HBlist2(PageDto pageDto) {return bookingMapper.HBlist2(pageDto);}
    public List<BookingDto> HBlist3(PageDto pageDto) {return bookingMapper.HBlist3(pageDto);}
    public List<BookingDto> HBlist4(PageDto pageDto) {return bookingMapper.HBlist4(pageDto);}
    public List<BookingDto> HBslist(PageDto pageDto){return bookingMapper.HBslist(pageDto);}

    public BookingDto nowBooking(String bid) {
        return bookingMapper.nowBooking(bid);
    }

    public List<BookingDto> bookingList(PageDto pageDto) {
        return bookingMapper.bookingList(pageDto);
    }

    public int cancel(String bid){
        return bookingMapper.cancel(bid);
    }

    public int bookingUpdate() {
        return bookingMapper.bookingUpdate();
    }

    /*관리자 - 예약 상세 페이지 추가*/
    public BookingDto content(String bid){return bookingMapper.content(bid);}

}
