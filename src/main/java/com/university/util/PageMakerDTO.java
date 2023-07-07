package com.university.util;

import lombok.Data;

@Data
public class PageMakerDTO {
   //시작, 끝 페이지
   private int pageStart, pageEnd;
   
   //이전, 다음 페이지 존재 유무
   private boolean prev, next;
   
   //전체 게시물 수
   private int total;
   
   //현재 페이지, 페이지 당 표시될 게시물 수
   private Criteria cri;

   public PageMakerDTO(Criteria cri, int total) {
      super();
      this.cri = cri;
      this.total = total;
      
      //마지막 페이지 (인터페이스 내)
      this.pageEnd = (int)(Math.ceil(cri.getPageNum()/10.0))*10; //Round=반올림, ceil=소수점 올림
      
      //시작 페이지
      this.pageStart = this.pageEnd - 9;
      
      //전체의 마지막 페이지
      int realEnd = (int)(Math.ceil(total*1.0/cri.getAmount()));
      
      //시작 페이지(startPage) 값이 1보다 큰 경우 true
      this.prev = this.pageStart > 1;
      
      //마지막 페이지(endPage) 값이 1보다 큰 경우 true
      this.next = this.pageEnd < realEnd;
      
      //전체 마지막 페이지(realEnd)가 화면에 보이는 마지막 페이지(endPage)보다 작은 경우
      //보이는 페이지(endPage) 값 조정
      if(realEnd < this.pageEnd) {
         this.pageEnd = realEnd;
      }
      
   }
   
}