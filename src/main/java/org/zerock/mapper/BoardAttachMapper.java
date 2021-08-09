package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardAttachVO;

public interface BoardAttachMapper {
	public void insert(BoardAttachVO vo);
	
	public int delete(String uuid);
	
	public List<BoardAttachVO> findByBno(Integer bno);
	
	public void deleteAll(Integer bno);
	
	public List<BoardAttachVO> getOldFiles();
}