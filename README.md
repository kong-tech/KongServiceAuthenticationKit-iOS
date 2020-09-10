# KongServiceAuthenticationKit

- 웹뷰를 이용한 로그인 서비스 제공
- 인증 관련 기능 제공

# KongServiceManager

- 콩서비스의 사용자 관련 기능들을 사용할 수 있습니다.

### 초기화

```swift
let kongServiceManager = KongServiceManager()
```

### 토큰 초기화

```swift
kongServiceManager.set(token:"{Token}")
```

- 발급된 개인의 토큰으로 초기화 하거나,  KongServiceLoginController를 통해 받은 토큰으로 초기화가 가능합니다.

### 사용자 정보 가져오기

```swift
kongServiceManager.getMe(onComplete: @escaping (Result<GetMeResponse, ERROR>) -> Void)
```

- 토큰을 초기화 한 후에 사용이 가능합니다.
- 토큰 기반으로 사용자의 정보를 가져올 수 있습니다.

# KongServiceLoginController

- 웹뷰를 이용한 콩서비스 로그인을 제공합니다.

### 초기화

```swift
let kongServiceLoginController = KongServiceLoginController(seviceType: {serviceType})
kongServiceLoginController.delegate = self
kongServiceLoginController.presentationContextProvider = self
kongServiceLoginController.performRequests()
```

- 서비스 타입을 지정해야 사용이 가능합니다.
- kongServiceLoginController를 프로퍼티로 선언 후 사용해야 합니다.
- 메소드 블록 안에서 사용 시 KongServiceLoginController가 메모리 해제가 됩니다.
- delegate
    - 로그인 결과에 대한 delegate입니다.
- presentationContextProvider
    - 웹뷰를 화면에 presentation 하기 위해서 사용합니다.
- performRequest
    - 로그인뷰를 Present 합니다.

### 로그인하기

```swift
extension ViewController:KongServiceLoginControllerDelegate{
    func kongServiceLoginController(_ controller: KongServiceLoginController, didLoginSuccess accessToken: String) {
        accessTokenTextView.text  = accessToken
    }
    
    func kongServiceLoginControllerLoginCanceled(_ controller: KongServiceLoginController) {
        print("취소됨.")
    }
}
```

- 로그인이 성공할 경우 kongServiceLoginController(:didLoginSuccess:)가 실행됩니다.
    - accessToken을 받을 수 있습니다.
- 로그인을 취소하는 경우 kongServiceLoginControllerLoginCanceled(:)가 실행됩니다.

### 사용 방법

```swift
class ViewController: UIViewController {

    @IBOutlet weak var accessTokenTextView: UITextView!
    
    var kongServiceManager:KongServiceManager!
    var kongServiceLoginController:KongServiceLoginController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kongServiceManager = KongServiceManager()
        
    }
    
    @IBAction func showLoginView(_ sender: UIButton) {
        kongServiceLoginController = KongServiceLoginController(serviceType: .kongEco)
        kongServiceLoginController.delegate = self
        kongServiceLoginController.presentationContextProvider = self
        kongServiceLoginController.performRequests()
    }
    
}

extension ViewController:KongServiceLoginControllerDelegate{
    func kongServiceLoginController(_ controller: KongServiceLoginController, didLoginSuccess accessToken: String) {
        accessTokenTextView.text  = accessToken
        kongServiceManager.set(token: accessToken)
    }
    
    func kongServiceLoginControllerLoginCanceled(_ controller: KongServiceLoginController) {
        
    }
    
    
}

extension ViewController:KongServiceLoginControllerPresentationContextProviding{
    func presentationAnchor(for controller: KongServiceLoginController) -> KongServiceLoginPresentationAnchor {
        return self.view.window!
    }
}
```
