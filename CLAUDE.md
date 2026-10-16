# Project
SwiftUI를 처음 학습하는 iOS 세미나 프로젝트입니다.

## Tech
- Swift
- SwiftUI
- iOS 17+

## Rules
- 기존 코드를 먼저 확인한 뒤 수정합니다.
- 요청하지 않은 파일과 코드는 임의로 변경하지 않습니다.
- 최소 지원 버전을 확인하고 Deprecated API를 사용하지 않습니다.
- 불필요하게 복잡한 구조나 외부 라이브러리를 추가하지 않습니다.
- 직접 작성한 학습 코드는 유지하고, AI 비교 실습은 별도 View에서 진행합니다.

## Learning

현재 다음 내용을 학습하고 있습니다.

- 기본 View, Stack, Spacer, padding, frame과 Modifier
- TextField, SecureField, @State와 @Binding
- NavigationStack, NavigationLink와 화면 간 데이터 전달
- View 분리와 연산 프로퍼티
- 구조체, 배열, Identifiable과 ForEach
- Optional, UserDefaults와 Keychain

- 아직 배우지 않은 개념이 필요하면 먼저 왜 필요한지 설명해주세요.
- 개념을 질문하면 관련 코드와 작은 비교 예제로 설명해주세요.
- 힌트를 요청하면 정답 전체를 먼저 제시하지 말아주세요.

## AI Usage
- 코드를 작성하거나 수정하면 무엇을 변경했는지와 이유를 설명해주세요.
- 실행하거나 검증하지 않은 내용은 구분해서 알려주세요.
- 결과는 직접 실행하고 확인하며 학습합니다.

## UI 구현 지침

### 요구사항 확인
- 구현 전에 제공된 Figma 또는 요구사항을 확인한다.
- 화면을 UI 구역으로 나누고 각 구역의 표시 데이터와 사용자 동작을 정리한다.
- 요구사항이 불명확하면 질문하고 임의로 기능을 추가하지 않는다.

### View 네이밍
- View 타입은 역할을 설명하는 이름에 `View`를 붙인다.
  - 예: `InstagramFeedView`, `PostCardView`, `LikeButtonView`
- UI를 구성하는 연산 프로퍼티는 소문자로 시작한다.
  - 예: `profileHeader`, `actionIcons`

### 컴포넌트 분리
- 반복해서 사용하거나 독립적인 역할이 있는 UI는 별도 View 타입으로 분리한다.
- 현재 View 안에서만 사용하는 작은 UI 구역은 `private` 연산 프로퍼티로 정리한다.
- 단순한 Text나 Image 하나까지 무조건 분리하지 않는다.

### 데이터 전달
- 표시만 할 데이터는 일반 `let` 프로퍼티로 받는다.
- View가 소유하고 변경할 상태는 `@State private`으로 선언한다.
- 자식이 부모의 상태를 읽고 수정해야 하면 `@Binding`으로 연결한다.
- 부모에게 전달받는 값을 무조건 `@State`로 선언하지 않는다.

### Navigation
- 하나의 화면 이동 흐름은 루트의 `NavigationStack`에서 관리한다.
- 같은 이동 흐름의 목적지 View에 `NavigationStack`을 중복으로 만들지 않는다.
- 단순한 화면 이동은 목적지 View를 지정하는 `NavigationLink`를 사용한다.
- 코드로 이동 시점을 제어해야 할 때 상태 기반 이동을 사용한다.

### 구현 확인
- 화면 구성과 동작이 요구사항에 맞는지 실행해서 확인한다.
- 반복되는 게시물의 상태가 서로 독립적으로 변경되는지 확인한다.
- 변경한 내용과 확인 결과를 설명한다. 실행하지 못한 항목은 명시한다.