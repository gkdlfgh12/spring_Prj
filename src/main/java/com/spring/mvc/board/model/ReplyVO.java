package com.spring.mvc.board.model;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ReplyVO {

	private int rno, no;
	private String content, writer; 
	private int replyPage;
	
	private Timestamp writeDate;

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getReplyPage() {
		return replyPage;
	}

	public void setReplyPage(int replyPage) {
		this.replyPage = replyPage;
	}

	public Timestamp getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", no=" + no + ", content=" + content + ", writer=" + writer + ", replyPage="
				+ replyPage + ", writeDate=" + writeDate + "]";
	}
	
	
	
}
