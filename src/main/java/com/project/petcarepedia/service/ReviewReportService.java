package com.project.petcarepedia.service;

import com.project.petcarepedia.dto.PageDto;
import com.project.petcarepedia.dto.ReviewReportDto;
import com.project.petcarepedia.repository.ReviewReportMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewReportService {
    @Autowired
    private ReviewReportMapper reviewReportMapper;

    public int reviewReport(ReviewReportDto reviewReportDto) {
        return reviewReportMapper.report(reviewReportDto);
    }

    public int reviewReportCheck(ReviewReportDto reviewReportDto) {
        return reviewReportMapper.check(reviewReportDto);
    }

    public int reviewDelete(String rrid){return  reviewReportMapper.delete(rrid);}

    public List<ReviewReportDto> RRlist(PageDto pageDto){return reviewReportMapper.RRlist(pageDto);}

    public ReviewReportDto content(String rrid){return  reviewReportMapper.content(rrid);}
}
