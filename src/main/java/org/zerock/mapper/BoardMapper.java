package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
//import org.apache.ibatis.annotations.Select;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {
//	@Select("select * from tbl_board where bno > 0 order by bno desc")
	public List<BoardVO> getList();
	public void insert(BoardVO board);
	public void insertSelectKey(BoardVO board);
	public BoardVO read(Integer bno);
	public int delete(Integer bno);
	public int update(BoardVO board);
	public List<BoardVO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
	public void updateReplyCnt(@Param("bno") Integer bno, @Param("amount") int amount);
}