package com.project.petcarepedia.repository;

import com.project.petcarepedia.dto.PageDto;
import com.project.petcarepedia.dto.ReviewReportDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReviewReportMapper {
    int report(ReviewReportDto reviewReportDto); /* insert */
    int check(ReviewReportDto reviewReportDto); /* id 체크 */
    int delete(String rrid); /* 신고 리뷰 삭제 */
    List<ReviewReportDto> RRlist(PageDto pageDto);
    ReviewReportDto content(String rrid);
}
