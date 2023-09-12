# MYGGUMI

### 디렉토리 구조
- 기본적으로 View 디렉토리안에 화면 기능 단위로 구분해서 작성하였습니다.
- Observable은 사실상 ViewModel의 기능과 같은 기능을 하고 있습니다.
  - 화면 이동 플로우가 간단하지 않기 때문에 이동 관리는 NavigationStack과 Observable을 싱글톤으로 구현하여 이동하고 뒤로 가는 방식으로 구현하였습니다.
- 화면 내의 상태가 다양한 경우 주로 enum을 통해 관리하였습니다. 뷰가 커지는 문제가 있지만 화면이 많아서 헷갈리기보다는 해당 뷰 안에서 보여주는 방식으로 구현하였습니다.
  
<img width="471" alt="스크린샷 2023-09-12 오후 4 47 12" src="https://github.com/moonkey48/MYGGUMI/assets/105622985/169ccf83-0e3d-42e4-9acf-d78b740a8d19">

