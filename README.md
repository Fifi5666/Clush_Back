# Clush_Back

1️⃣ 앱 설명


    - 간단한 할 일(To-Do) 관리 앱입니다. 사용자는 할 일을 추가, 수정, 삭제하고, 완료 상태로 변경할 수 있습니다.
    또한 할 일 목록을 조회하고, 특정 no의 할 일을 조회할 수 있습니다.

    - 기능

    1. 할 일 목록 조회: 모든 할 일의 목록을 조회합니다.

    2. 특정 할 일 조회: no로 특정 할 일을 조회합니다.

    3. 할 일 추가: 새로운 할 일을 추가합니다.
    
    4. 할 일 수정: 기존 할 일을 수정하거나,
    모든 할 일의 상태(status)를 완료로 수정합니다.

    5. 할 일 삭제: no로 특정 할 일을 삭제하거나, 전체 할 일을 삭제합니다.


2️⃣ 실행 방법


    1. 해당 프로젝트를 GitHub에서 clone 합니다.

    2. todo 프로젝트에서 SQL 폴더 안의 DDL.sql 파일을 차례대로 실행합니다.

        데이터베이스(스키마) 생성 ➡ 테이블 생성 ➡ 우선순위 컬럼 추가
        ➡ 예시 자료 넣기(필요에 따라서)

    3. application.properties 파일에서 연결 정보를 본인의 데이터베이스에 맞춰 수정합니다.

    spring.datasource.username=<사용자 계정>
    spring.datasource.password=<사용자 패스워드>
    
    4. 서버를 실행합니다. 제가 사용한 vscode의 경우 스프링부트 대시보드에서 서버를 실행하거나 ./gradlew bootRun
    다른 IDE나 도구를 사용하는 경우, IDE의 실행 버튼을 클릭하거나 터미널에서 해당 명령어를 입력하여 서버를 실행할 수 있습니다.

    5. Swagger 로 Test

    http://localhost:8080/swagger-ui/index.html

    여기서 localhost:8080에는 돌아가고 있는 IP와 포트 번호를 넣고 접속

    전체 완료 : Request body에 { "no" : -1 } 입력
    전체 삭제 : 파라미터 no 에 -1 입력

    <주의 사항> priority 에는 "LOW", "MEDIUM", "HIGH" 만 작성 가능합니다.


3️⃣ 주요 컴포넌트

    - Spring Boot

    Spring 애플리케이션을 개발할 수 있도록 도와주는 프레임워크입니다.
    자동 구성 기능과 내장 서버 지원을 통해 신속한 애플리케이션 개발과 배포가 가능합니다.
    Spring Boot는 내장 서버를 지원하여 개발과 배포가 용이하고, RESTful API 개발에 적합합니다.

    - MyBatis

    SQL을 직접 작성하여 데이터베이스와 상호작용할 수 있도록 지원하는 데이터 매핑 프레임워크입니다.
    SQL 문을 직접 작성하여 효율적인 데이터 조회 및 조작이 가능합니다.

    - Swagger

    API 명세를 정의하고, 테스트를 통해 API를 직접 확인할 수 있습니다.
    이를 통해 개발과 테스트가 용이해집니다.

    - MySQL

    MySQL은 관계형 데이터베이스 관리 시스템입니다.
    데이터 저장 및 관리를 효율적으로 수행할 수 있습니다.

4️⃣ API

    1. GET
    URL : /todos
    모든 할 일 목록 조회

    2. GET
    URL : /todos/{no}
    특정 no를 가진 할 일 조회
    parameters는 no: 조회할 할 일의 no

    3. POST
    URL : /todos
    새로운 할 일을 생성합니다.
    {
        "name": "할 일 이름"
        "status" : 할 일의 상태 0(하기 전) 또는, 1(완료) status를 쓰지 않아도 0으로 기본값이 설정되어 있습니다.
        "dueDate" : "할 일의 마감일 (날짜, YYYY-MM-DD 형식)"
        "priority" : "LOW, MEDIUM, HIGH 중 하나 작성"
    }

    4. PUT
    URL : /todos
    특정 할 일을 수정. 모든 할 일을 완료로 설정할 수도 있습니다.
    {
        "no" : 업데이트할 할 일의 no
        "name" : "수정할 할 일 이름"
        "status" : 0(하기 전) 또는, 1(완료)
        "dueDate": "할 일의 마감일 (날짜, YYYY-MM-DD 형식)"
        "priority" : "LOW, MEDIUM, HIGH 중 하나 작성"
    }
    전체 수정의 경우,
    {
        "no" : -1
    }
    
    5. DELETE
    URL : /todos/{no}
    설명: 특정 no를 가진 할 일을 삭제합니다.
    parameters는 no: 삭제할 할 일의 no 또는 -1 (전체 삭제)

