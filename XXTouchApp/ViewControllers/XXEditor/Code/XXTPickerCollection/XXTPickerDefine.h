//
//  XXTPickerDefine.h
//  XXTPickerCollection
//
//  Created by Zheng on 30/04/2017.
//  Copyright © 2017 Zheng. All rights reserved.
//

#ifndef XXTPickerDefine_h
#define XXTPickerDefine_h

#define START_IGNORE_PARTIAL _Pragma("clang diagnostic push") _Pragma("clang diagnostic ignored \"-Wpartial-availability\"")
#define END_IGNORE_PARTIAL _Pragma("clang diagnostic pop")

#define XXTP_SYSTEM_9 (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_9_0)
#define XXTP_SYSTEM_8 (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_8_0)

#endif /* XXTPickerInternalDefine_h */
