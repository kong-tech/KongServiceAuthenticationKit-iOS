//
//  KongServiceLoginViewController+Action.swift
//  KongServiceAuthenticationKit
//
//  Created by leejinhae on 2020/09/01.
//  Copyright © 2020 KONGTech. All rights reserved.
//
#if os(iOS)

import UIKit

@available(iOS 9.0, *)
extension KongServiceLoginViewController{
    
    func setupAction(){        
        closeBtn.addTarget(self, action: #selector(closeBtnAction(_:)), for: .touchUpInside)
        
    }
    
    @objc func closeBtnAction(_ btn:UIButton){
        self.dismiss(animated: true, completion: { [weak self] in
            guard let self = self else { return }
            self.delegate?.kongServiceLoginViewControllerLoginCanceled(self)
        })
    }
}
#endif
