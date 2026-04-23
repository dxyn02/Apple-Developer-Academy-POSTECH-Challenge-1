import SwiftUI

struct Spot: Identifiable {
    let id = UUID()
    let region: String
    let theme: String
    let name: String
    let imageName: [String]
    let description: String
}

let allSpots: [Spot] = [
    // MARK: - 1. 효자·지곡
    Spot(region: "효자·지곡", theme: "밤 산책", name: "영일대 호수", imageName: ["영일대 호수"], description: "포스텍 영일대 호수 한 바퀴 크게 돌기"),
    Spot(region: "효자·지곡", theme: "밤 산책", name: "불의 정원", imageName: ["불의 정원"], description: "철길숲 불의 정원 가스불 보며 걷기"),
    Spot(region: "효자·지곡", theme: "밤 산책", name: "포스텍", imageName: ["포스텍 대운동장"], description: "포스텍 대운동장 트랙 걷기"),
    Spot(region: "효자·지곡", theme: "밤 산책", name: "형산강", imageName: ["형산강 체육공원"], description: "형산강 체육공원 강변 따라 야간 러닝하기"),
    
    Spot(region: "효자·지곡", theme: "카페", name: "터틀 네스트", imageName: ["터틀 네스트"], description: "터틀 네스트 카페에서 책 읽기"),
    Spot(region: "효자·지곡", theme: "카페", name: "핸즈커피", imageName: ["효자 핸즈커피"], description: "핸즈커피 카페 2층 창가 자리 앉아서 형산강 뷰 보기"),
    Spot(region: "효자·지곡", theme: "카페", name: "두낫디스터브", imageName: ["두낫디스터브"], description: "분좋카 두낫디스터브에서 빵 먹기"),
    Spot(region: "효자·지곡", theme: "카페", name: "소디스에스프레소바", imageName: ["효자 소디스"], description: "소디스에스프레소바 음료 테이크아웃 해서 지곡 회관 앞 벤치에서 마시기"),
    
    Spot(region: "효자·지곡", theme: "야식·한 잔", name: "가마치 통닭", imageName: ["효자 가마치 통닭"], description: "가마치 통닭에서 닭강정 포장하기"),
    Spot(region: "효자·지곡", theme: "야식·한 잔", name: "탄광맥주", imageName: ["효자 탄광맥주"], description: "탄광맥주에서 수제맥주 마시기"),
    Spot(region: "효자·지곡", theme: "야식·한 잔", name: "편의점", imageName: ["효자 편의점"], description: "철길숲 걷다가 편의점 캔맥주 + 소시지 조합 때리기"),
    Spot(region: "효자·지곡", theme: "야식·한 잔", name: "국밥", imageName: ["효자 국밥"], description: "따뜻한 국밥 한 그릇 배달 시켜먹기"),
    
    Spot(region: "효자·지곡", theme: "멍때리기", name: "78타워", imageName: ["78타워"], description: "78타워 꼭대기에서 캠퍼스 야경 내려다보기"),
    Spot(region: "효자·지곡", theme: "멍때리기", name: "노벨동산", imageName: ["노벨동산"], description: "포스텍 노벨동산 벤치에 누워 여름 밤하늘 별 찾기"),
    Spot(region: "효자·지곡", theme: "멍때리기", name: "폭풍의 언덕", imageName: ["폭풍의 언덕"], description: "포스텍 폭풍의 언덕에서 시원한 밤바람 맞기"),
    Spot(region: "효자·지곡", theme: "멍때리기", name: "형산강", imageName: ["형산강 다리"], description: "형산강 다리 위에서 화려한 조명 보며 물멍하기"),
    
    // MARK: - 2. 영일대
    Spot(region: "영일대", theme: "밤 산책", name: "해상누각", imageName: ["영일대 해상누각"], description: "화려한 조명의 영일대 해상누각 안까지 걸어 들어가기"),
    Spot(region: "영일대", theme: "밤 산책", name: "버스킹 존", imageName: ["영일대 버스킹 존"], description: "영일대 버스킹 존 모래사장 맨발로 걸어보기"),
    Spot(region: "영일대", theme: "밤 산책", name: "장미원", imageName: ["영일대 장미원"], description: "사람 없는 장미원 쪽 해안 산책로 끝까지 걷기"),
    Spot(region: "영일대", theme: "밤 산책", name: "방파제", imageName: ["영일대 방파제"], description: "포항여객선터미널 방파제 근처 등대까지 걷기"),
    
    Spot(region: "영일대", theme: "카페", name: "오브레멘", imageName: ["영일대 오브레멘"], description: "오브레멘 회전목마 앞에서 인생샷 남기기"),
    Spot(region: "영일대", theme: "카페", name: "헤이안", imageName: ["헤이안"], description: "헤이안 루프탑에서 끈적한 바닷바람 맞기"),
    Spot(region: "영일대", theme: "카페", name: "샌디레이크", imageName: ["영일대 샌디레이크"], description: "샌디레이크에서 터키식 모래 커피 마셔보기"),
    Spot(region: "영일대", theme: "카페", name: "팜테이블", imageName: ["영일대 팜테이블"], description: "팜테이블 2층에서 야간 작업하기"),
    
    Spot(region: "영일대", theme: "야식·한 잔", name: "조개구이", imageName: ["영일대 조개구이"], description: "오션 뷰 보며 조개구이에 사이다 한 잔"),
    Spot(region: "영일대", theme: "야식·한 잔", name: "맥도날드", imageName: ["영일대 맥도날드"], description: "맥도날드 세트 포장해서 모래사장에서 먹기"),
    Spot(region: "영일대", theme: "야식·한 잔", name: "이자카야", imageName: ["영일대 이자카야"], description: "영일대 골목 이자카야에서 하이볼 마시기"),
    Spot(region: "영일대", theme: "야식·한 잔", name: "편의점", imageName: ["영일대 편의점"], description: "편의점에서 컵라면 끓여서 야외 테이블에 앉아 먹기"),
    
    Spot(region: "영일대", theme: "멍때리기", name: "돗자리", imageName: ["영일대 모래사장"], description: "돗자리 깔고 모래사장 한가운데 눕기"),
    Spot(region: "영일대", theme: "멍때리기", name: "영일교", imageName: ["영일교"], description: "영일교 위 난간에 기대어 파도 소리만 듣기"),
    Spot(region: "영일대", theme: "멍때리기", name: "스페이스워크", imageName: ["스페이스워크"], description: "스페이스워크 야간 조명 멀리서 구경하기"),
    Spot(region: "영일대", theme: "멍때리기", name: "방파제", imageName: ["영일대 방파제"], description: "포항여객선터미널 방파제에 걸터 앉기"),
    
    // MARK: - 3. 송도
    Spot(region: "송도", theme: "밤 산책", name: "도시숲", imageName: ["송도솔밭도시숲"], description: "바다 옆 소나무 숲길 사이를 걷는 서늘한 밤 산책"),
    Spot(region: "송도", theme: "밤 산책", name: "해안로", imageName: ["송도해수욕장 해안로"], description: "직선으로 뻗은 해안선을 따라 포스코 야경을 보며 걷기"),
    Spot(region: "송도", theme: "밤 산책", name: "평화의 여신상", imageName: ["평화의여신상"], description: "송도의 상징인 여신상 앞 빈티지한 가로등 아래 산책"),
    Spot(region: "송도", theme: "밤 산책", name: "송도교", imageName: ["송도교"], description: "운하와 바다가 만나는 다리 위에서 즐기는 야경"),
    
    Spot(region: "송도", theme: "카페", name: "파스쿠찌", imageName: ["파스쿠찌 포항송도비치점"], description: "루프탑에서 포스코 야경 파노라마를 볼 수 있는 곳"),
    Spot(region: "송도", theme: "카페", name: "아라비카 로스터스", imageName: ["아라비카커피로스터스 송도점"], description: "해안가에서 진한 커피 향과 함께 밤바다 즐기기"),
    Spot(region: "송도", theme: "카페", name: "그리브", imageName: ["그리브카페"], description: "무지개 케이크와 함께 쉬어가는 해변가 대형 카페"),
    Spot(region: "송도", theme: "카페", name: "카페거리", imageName: ["송도 카페거리"], description: "바닷바람을 맞을 수 있는 테라스 석에 앉기"),
    
    Spot(region: "송도", theme: "야식·한 잔", name: "토스트", imageName: ["송도해수욕장 토스트"], description: "송도 밤바다의 전설, 설탕 뿌린 옛날 토스트와 커피"),
    Spot(region: "송도", theme: "야식·한 잔", name: "조개구이", imageName: ["송도해수욕장 조개구이"], description: "파도 소리를 반찬 삼아 야외 테이블에서 즐기는 조개구이"),
    Spot(region: "송도", theme: "야식·한 잔", name: "회센터", imageName: ["송도활어회센터"], description: "화려한 앞모습 뒤에 숨겨진 현지인들의 숨은 맛집들"),
    Spot(region: "송도", theme: "야식·한 잔", name: "치킨", imageName: ["송도교 치킨"], description: "운하 바람을 맞으며 야외에서 즐기는 치맥 타임"),
    
    Spot(region: "송도", theme: "멍때리기", name: "포스코", imageName: ["송도해수욕장"], description: "정면으로 보이는 용광로 불빛을 보며 불멍 대신 '쇠멍'"),
    Spot(region: "송도", theme: "멍때리기", name: "등대", imageName: ["송도방파제 빨간등대"], description: "가장 끝자락에서 조용히 파도 소리에만 집중하는 시간"),
    Spot(region: "송도", theme: "멍때리기", name: "전망대", imageName: ["송도 워터폴리"], description: "높은 곳에서 바람 맞으며 밤바다 전체를 조망하기"),
    Spot(region: "송도", theme: "멍때리기", name: "형산강", imageName: ["형산강 하구"], description: "강물과 바닷물이 만나는 고요한 경계선에서 쉬어가기"),
    
    // MARK: - 4. 환호·여남
    Spot(region: "환호·여남", theme: "밤 산책", name: "스페이스워크", imageName: ["스페이스워크"], description: "우주를 걷는 기분의 화려한 조명 사이로 산책하기"),
    Spot(region: "환호·여남", theme: "밤 산책", name: "환호공원", imageName: ["환호공원"], description: "밤이면 더 고요해지는 공원 숲길을 따라 걷는 길"),
    Spot(region: "환호·여남", theme: "밤 산책", name: "해안 산책로", imageName: ["여남동 해안산책로"], description: "영일대 끝자락에서 여남까지 이어지는 한적한 바닷길"),
    Spot(region: "환호·여남", theme: "밤 산책", name: "방파제길", imageName: ["환호방파제"], description: "작은 어촌 마을의 정취가 느껴지는 짧고 조용한 길"),
    
    Spot(region: "환호·여남", theme: "카페", name: "어레인지먼트", imageName: ["어레인지먼트"], description: "압도적인 층고와 통창으로 밤바다를 감상하는 공간"),
    Spot(region: "환호·여남", theme: "카페", name: "145", imageName: ["카페 145"], description: "고급스러운 인테리어와 조용한 음악이 흐르는 여남의 아지트"),
    Spot(region: "환호·여남", theme: "카페", name: "개인카페", imageName: ["여남동 카페"], description: "사람들의 발길이 적은 여남 안쪽의 숨겨진 감성 카페"),
    Spot(region: "환호·여남", theme: "카페", name: "편의점", imageName: ["환호공원 편의점"], description: "창가 좌석에서 커피 한 잔 마시며 가성비 오션뷰 즐기기"),
    
    Spot(region: "환호·여남", theme: "야식·한 잔", name: "포차", imageName: ["여남 횟집"], description: "갓 잡은 해산물과 함께 즐기는 로컬 바이브의 술자리"),
    Spot(region: "환호·여남", theme: "야식·한 잔", name: "방파제", imageName: ["여남방파제"], description: "차박 성지 근처에서 즐기는 소소한 간식 타임"),
    Spot(region: "환호·여남", theme: "야식·한 잔", name: "치킨", imageName: ["환호공원 치킨"], description: "산책 후 공원 입구에서 즐기는 바삭한 야식"),
    Spot(region: "환호·여남", theme: "야식·한 잔", name: "이자카야", imageName: ["여남동 이자카야"], description: "조용한 마을 분위기와 잘 어울리는 작은 일식 선술집"),
    
    Spot(region: "환호·여남", theme: "멍때리기", name: "스페이스워크", imageName: ["스페이스워크"], description: "거대한 철제 구조물의 조명이 바뀌는 것을 보며 멍때리기"),
    Spot(region: "환호·여남", theme: "멍때리기", name: "여남 방파제", imageName: ["여남방파제"], description: "낚시꾼들의 전등 불빛만 보이는 고요한 바다 감상"),
    Spot(region: "환호·여남", theme: "멍때리기", name: "환호공원", imageName: ["환호공원 전망대"], description: "영일대 전체 라인이 한눈에 들어오는 최고의 야경 스팟"),
    Spot(region: "환호·여남", theme: "멍때리기", name: "루프탑", imageName: ["여남 루프탑 카페"], description: "높은 곳에서 내려다보는 여남항의 잔잔한 물결"),
    
    // MARK: - 5. 죽도·동빈내항
    Spot(region: "죽도·동빈내항", theme: "밤 산책", name: "운하길", imageName: ["동빈내항"], description: "유럽 운하가 부럽지 않은 잘 닦인 수변 산책로 걷기"),
    Spot(region: "죽도·동빈내항", theme: "밤 산책", name: "포항운하관", imageName: ["포항운하관"], description: "화려한 LED 조명이 바닥을 수놓는 운하의 시작점"),
    Spot(region: "죽도·동빈내항", theme: "밤 산책", name: "죽도시장", imageName: ["죽도시장"], description: "장사가 끝난 뒤 한적하고 묘한 분위기의 시장 골목 탐방"),
    Spot(region: "죽도·동빈내항", theme: "밤 산책", name: "해도교", imageName: ["해도교"], description: "운하를 가로지르는 여러 다리를 건너며 즐기는 산책"),
    
    Spot(region: "죽도·동빈내항", theme: "카페", name: "햅 카페", imageName: ["햅 카페"], description: "감성적이고 조용한 커피 맛집"),
    Spot(region: "죽도·동빈내항", theme: "카페", name: "몰리커피랩", imageName: ["몰리커피랩"], description: "정박한 배들을 바라보며 여유를 즐기는 항구 쪽 카페"),
    Spot(region: "죽도·동빈내항", theme: "카페", name: "전망대카페", imageName: ["전망대카페"], description: "360도 회전하는 전망대에서 운하와 바다를 바라보며 마시는 커피"),
    Spot(region: "죽도·동빈내항", theme: "카페", name: "온,도씨", imageName: ["온,도씨"], description: "제철과일을 이용한 이색 라떼 맛집"),
    
    Spot(region: "죽도·동빈내항", theme: "야식·한 잔", name: "야시장", imageName: ["죽도시장 야시장"], description: "다양한 길거리 음식과 활기가 넘치는 야간 미식 여행"),
    Spot(region: "죽도·동빈내항", theme: "야식·한 잔", name: "포차", imageName: ["죽도어시장"], description: "시장 상인들의 활기와 신선한 해산물이 가득한 포차"),
    Spot(region: "죽도·동빈내항", theme: "야식·한 잔", name: "펍", imageName: ["인스턴트"], description: "깔끔한 분위기의 펍"),
    Spot(region: "죽도·동빈내항", theme: "야식·한 잔", name: "분식거리", imageName: ["퐝할매떡볶이"], description: "늦은 밤 출출함을 달래주는 떡볶이와 튀김의 유혹"),
    
    Spot(region: "죽도·동빈내항", theme: "멍때리기", name: "전망대", imageName: ["포항운하관"], description: "운하와 바다가 만나는 지점을 멍하니 내려다보기"),
    Spot(region: "죽도·동빈내항", theme: "멍때리기", name: "해오름대교", imageName: ["해오름대교"], description: "커다란 다리 아래에서 울리는 파도 소리에 집중하기"),
    Spot(region: "죽도·동빈내항", theme: "멍때리기", name: "운하 분수", imageName: ["포항운하 분수"], description: "조명과 함께 춤추는 물줄기를 보며 잡념 없애기"),
    Spot(region: "죽도·동빈내항", theme: "멍때리기", name: "칠성천", imageName: ["칠성천"], description: "도심 속 작은 물길 옆에서 조용히 밤공기 마시기"),
    
    // MARK: - 6. 호미곶·구룡포
        Spot(region: "호미곶·구룡포", theme: "멍때리기", name: "상생의 손", imageName: ["상생의 손"], description: "철썩이는 파도를 장노출로 담아내며 조용히 멍때리기"),
        Spot(region: "호미곶·구룡포", theme: "멍때리기", name: "장길리 보릿돌교", imageName: ["장길리 보릿돌교"], description: "바다를 향해 길게 뻗은 해상 교량 끝에서 밤바다 감상하기"),
        Spot(region: "호미곶·구룡포", theme: "멍때리기", name: "까멜리아 계단", imageName: ["까멜리아 계단"], description: "드라마 주인공처럼 계단에 앉아 항구의 불빛 내려다보기"),
        Spot(region: "호미곶·구룡포", theme: "멍때리기", name: "구룡포 해수욕장", imageName: ["구룡포 해수욕장"], description: "인적 드문 밤 해변에 앉아 일정한 파도 소리에 집중하기"),

        Spot(region: "호미곶·구룡포", theme: "밤 산책", name: "아라광장", imageName: ["아라광장"], description: "정박한 어선들의 조명을 따라 걷는 구룡포항 산책"),
        Spot(region: "호미곶·구룡포", theme: "밤 산책", name: "호미반도 둘레길", imageName: ["호미반도 둘레길"], description: "달빛이 부서지는 기암괴석 해안선을 따라 걷는 밤 산책"),
        Spot(region: "호미곶·구룡포", theme: "밤 산책", name: "구룡포 공원", imageName: ["구룡포 공원"], description: "계단을 따라 올라가 구룡포 앞바다의 탁 트인 야경 즐기기"),
        Spot(region: "호미곶·구룡포", theme: "밤 산책", name: "일본인가옥거리", imageName: ["일본인가옥거리"], description: "따뜻한 가로등 불빛이 켜진 이국적인 골목길 걷기"),

        Spot(region: "호미곶·구룡포", theme: "카페", name: "어스피스", imageName: ["어스피스"], description: "통창 너머 칠흑 같은 바다를 보며 즐기는 커피 한 잔"),
        Spot(region: "호미곶·구룡포", theme: "카페", name: "네스트 코퍼레이션", imageName: ["네스트 코퍼레이션"], description: "루프탑 빈백에 누워 쏟아지는 별을 보며 마시는 따뜻한 차"),
        Spot(region: "호미곶·구룡포", theme: "카페", name: "카페 파도", imageName: ["카페 파도"], description: "파도 소리를 가장 가까이서 들을 수 있는 테라스 좌석"),
        Spot(region: "호미곶·구룡포", theme: "카페", name: "빌스4339", imageName: ["빌스4339"], description: "웅장한 갤러리 같은 공간에서 여유로운 심야 시간 보내기"),

        Spot(region: "호미곶·구룡포", theme: "야식·한 잔", name: "구룡포 대게거리", imageName: ["구룡포 대게거리"], description: "김이 모락모락 나는 거리를 걸으며 즐기는 해산물 야식"),
        Spot(region: "호미곶·구룡포", theme: "야식·한 잔", name: "모리국수", imageName: ["모리국수"], description: "얼큰하고 걸쭉한 구룡포 향토 음식 모리국수 한 그릇"),
        Spot(region: "호미곶·구룡포", theme: "야식·한 잔", name: "구룡포항 포장마차", imageName: ["포장마차"], description: "항구의 짠내를 안주 삼아 기울이는 소주 한 잔"),
        Spot(region: "호미곶·구룡포", theme: "야식·한 잔", name: "월녀의 해물포차", imageName: ["월녀의 해물포차"], description: "파도 소리가 브금이 되는 해안가 포차에서 따끈한 우동")
]
