package com.semi.project;

import org.springframework.stereotype.Component;

@Component("bvo")
public class BoardVO {
	int seq;
	String title, contents, writer, time;
	int viewcount;
	
	public BoardVO() {}
	public BoardVO(String title, String contents, String writer) {
		super();
		this.title = title;
		this.contents = contents;
		this.writer = writer;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getViewcount() {
		return viewcount;
	}
	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}
	@Override
	public String toString() {
		return "BoardVO [seq=" + seq + ", title=" + title + ", contents=" + contents + ", writer=" + writer
				+ ", viewcount=" + viewcount + "]";
	}
	
	
}
