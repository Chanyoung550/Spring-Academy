package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
//	@Test
	public void testGetList() {
		mapper.getList().forEach(board -> log.info(board));
	}
	
//	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("newbie");
		mapper.insert(board);
		log.info(board);
	}
	
//	@Test
	public void testInsertSelectKey() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("newbie");
		mapper.insertSelectKey(board);
		log.info(board);
	}
	
//	@Test
	public void testRead() {
		// 존재하는 게시물 번호로 테스트
		BoardVO board = mapper.read(1);
		log.info(board);
	}

//	@Test
	public void testDelete() {
		// 존재하는 게시물 번호로 테스트
		int result = mapper.delete(3);
		log.info("게시물 삭제 : " + result);
	}

//	@Test
	public void testUpdate() {
		// 존재하는 게시물 번호로 테스트
		BoardVO board = new BoardVO();
		board.setBno(10);
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용 수정");
		board.setWriter("newbie");
		int count = mapper.update(board);
		log.info("Update Count : " + count);
	}
	
//	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		List<BoardVO> list = mapper.getListWithPaging(cri);
		list.forEach(board -> log.info(board));
	}
	
//	@Test
	public void testPaging2() {
		Criteria cri = new Criteria(3, 10);
		List<BoardVO> list = mapper.getListWithPaging(cri);
		list.forEach(board -> log.info(board));
	}
	
	@Test
	public void testSearch() {
	    Criteria cri = new Criteria();
	    cri.setKeyword("새글");
	    cri.setType("TCW");

	    List<BoardVO> list = mapper.getListWithPaging(cri);
	    list.forEach(board -> log.info(board));
	}

}