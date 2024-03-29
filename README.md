# 게시판 만들기

## :: 프로젝트 소개

- 루비온레일즈 프레임워크를 이용해 만들어진 게시판 API 입니다.

## :: Languages and Tools

- [Ruby](https://www.ruby-lang.org/ko/)
- [Ruby on rails](https://rubyonrails.org/)

## :: 구현 기능

- [x] 글은 제목, 내용, 작성자, 생성일, 최종 수정일로 구성이 된다.
- [x] 사용자는 글을 작성할 수 있다.
- 사용자는 글 목록을 조회할 수 있다.
  - [x] 글 목록은 기본적으로 생성일 내림차순으로 정렬이 된다.
  - [x] 사용자는 작성자의 이름으로 글 목록을 검색할 수 있다.
    - [x] 검색어와 작성자 이름이 완전히 일치하는 글 목록만 조회된다.(완전일치검색)
    - [x] 예: '취준이'로 검색하면 작성자가 '취준이'인 글 목록이 검색 되어야 한다.
          (작성자가 '취준이2'라면 필터링에서 제외)
  - [x] 사용자는 글 제목으로 글 목록을 검색할 수 있다.
    - [x] 검색어가 글 제목에 포함되는 글 목록이 조회 된다.(부분일치검색)
    - [x] 예: '취준이'로 검색하면 글 제목이 '취준이 모집합니다'인 글 목록이 검색되어야 한다.
  - [x] 사용자는 생성일, 최종 수정일 기준으로 정렬을 할 수 있다.
  - [x] 글 목록 조회 시에는 댓글이 포함되지 않는다.
- [x] 사용자는 글을 상세 조회할 수 있다.
  - [x] 글을 상세 조회할 시에 댓글 목록도 함께 조회가 된다.
- [x] 사용자는 글을 수정할 수 있다.
  - [x] 모든 사용자가 모든 글을 수정할 수 있다.(본인이 작성했는지 여부를 확인할 필요가 없다.)
- [x] 사용자는 글을 삭제할 수 있다.
  - [x] 모든 사용자가 모든 글을 삭제할 수 있다.(본인이 작성했는지 여부를 확인할 필요가 없다.)
- [x] 댓글은 내용, 작성자, 생성일, 최종수정일로 구성이 된다.
- [x] 사용자는 글에 댓글을 작성할 수 있다.
- [x] 사용자는 댓글을 수정할 수 있다.
  - [x] 모든 사용자가 모든 댓글을 수정할 수 있다.(본인이 작성했는지 여부를 확인할 필요가 없다.)
- [x] 사용자는 댓글을 삭제할 수 있다.
  - [x] 모든 사용자가 모든 댓글을 삭제할 수 있다.(본인이 작성했는지 여부를 확인할 필요가 없다.)

## :: 확인 방법

- Run `rails s` code.
