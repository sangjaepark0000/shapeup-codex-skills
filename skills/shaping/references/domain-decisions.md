# Domain Decisions

shaping 중 durable language 또는 되돌리기 어려운 decision이 생길 때 사용한다.

이 문서는 Shape Up shaping을 별도 documentation session으로 만들지 않으면서, `grill-with-docs`의 유용한 discipline만 빌린다.

## Terminology

term이 product shape에 중요해지면:

- canonical term 하나를 선호한다.
- overloaded term을 명시한다.
- user-facing language와 implementation name을 구분한다.
- future project가 이어받아야 하는 durable product terminology는 `shapeup/product-memory.md`에 기록한다.

repo에 이미 `CONTEXT.md`가 있으면, current project 밖에서도 의미 있는 domain term에 한해서만 갱신한다. implementation trivia를 추가하지 않는다.

## ADR Candidates

다음이 모두 참일 때만 ADR을 제안한다.

- 되돌리기 어렵다.
- context 없이는 놀랍다.
- 실제 trade-off가 있었다.

조건 중 하나라도 빠지면 decision을 package 또는 product memory에 남긴다.

## 과하게 문서화하지 않기

- 하나의 package가 term을 썼다는 이유만으로 `CONTEXT.md`를 만들지 않는다.
- 평범한 scope cut에 ADR을 만들지 않는다.
- package 내용을 product memory에 중복하지 않는다.
