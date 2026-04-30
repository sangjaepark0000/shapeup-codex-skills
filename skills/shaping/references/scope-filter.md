# Scope Filter

candidate가 extra feature를 끌어들이기 시작할 때 사용한다.

## Default

`No`에서 시작한다. feature는 first bet이 appetite 안에서 작동하는 데 필수일 때만 package에 남긴다. 제외된 feature가 distinct future bet으로 돌아올 수 있을 때만 `Parking Lot`을 사용한다.

## Say No When

- first success scene에 등장하지 않는다.
- 없어도 desired outcome이 여전히 작동한다.
- 새 core object, user role, permission model, privacy rule, operational flow를 만든다.
- appetite를 키운다.
- package sentence를 서로 다른 두 change로 쪼갠다.
- 이유가 대부분 "while we are here", "easy enough", "needed later"다.

## Say Yes When

- 없으면 package를 validate할 수 없다.
- core user action을 가능하게 한다.
- current appetite 안에 완전히 들어간다.
- 새 product decision을 열지 않으면서 structural risk를 줄인다.

## Output

decision을 shape 또는 package에 기록한다.

```md
## Not Doing

- [Feature]: [reason] 때문에 제외. [condition]일 때만 다시 본다.
```

revisit condition이 current project를 넘어 의미가 있으면 `candidate-lifecycle.md`를 사용해 repo-level `shapeup/parking-lot.md`와 reconcile한다.
