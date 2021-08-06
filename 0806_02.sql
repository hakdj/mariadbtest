카트 조회 페이지에 출력 내용은 다음과 같다.
날짜, 사용자ID, 제품ID, 제품이름, 제품가격,수량,제품이미지이름

SELECT a.regdate, a.custid, a.itemid, i.price, a.num,
		 (i.price*a.num) as total, i.imgname
FROM cart a INNER JOIN cust c ON a.custid=c.id
				INNER JOIN item i ON a.itemid=i.id
WHERE c.id='id01'



