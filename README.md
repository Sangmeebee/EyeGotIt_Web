# EyeGotIt_Web

## 작품 개요
### <당신의 눈이 되어드립니다!> 시각장애인을 위한 길 안내 어플리케이션의 관리자 웹

## 작품 기능
* 앱 사용중인 사용자 리스트 확인
```
현재 실시간으로 경로안내를 받는 사용자만 리스트로 나타남
```
* 사용자 현재위치 확인
```
관리자(장애인보호단체, 경찰등)는 사용자의 현재위치를 실시간으로 확인 가능
```
* 위험 알림을 보낸 사용자 실시간 체크
```
관리자(장애인보호단체, 경찰등)는 사용자가 위험알림을 보내게 되면 실시간으로 확인 가능
```


## 주요 적용 기술 및 구조

* 데이터베이스
```
Firebase 사용
```
* 지도
```
NaverColudPlatform의 Maps Api를 사용하여 Map 구축
```
* Spring
```
Spring MVC로 웹페이지 구축
```
* AWS
```
완성된 war파일을 AWS의 EC2에 설치된 Tomcat에 배포
```

## 기대효과

* 위험감소
```
- 사용자가 길찾기 기능 사용 중 스스로 해결하지 못할 상황 발생 시 위험알림을 전송하면 실시간 확인가능
- 관리자(복지단체나 경찰)가 경로안내를 받고 있는 사용자의 현재위치와 이동경로를 확인함으로써, 사용자의 경로이탈 방지
```

