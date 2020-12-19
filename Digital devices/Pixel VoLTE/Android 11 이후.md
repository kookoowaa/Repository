## **Android 11** 이후

### 00. 목차

> 1. Magisk Manager 설치 (Android 11 지원 가능한 Magisk 설치를 위한)
> 2. magisk_patched.img에 diag port 개방 기능을 추가
> 3. Diag port 개방 기능을 추가한 이미지로 boot 파티션 플래싱 (Magisk 설치)
> 4. Magisk Manager에서 VoLTE 모듈 설치
> 5. Diag port 개방 후 EFS Explorer로 user_agent_template 교체
> 6. Magisk 삭제

### 00. 필요한 파일

![](Files(2020-dec).PNG)

- 위와 같은 파일들이 필요하며 선택되어 있지 않은 파일 2개는 작업 중에 생성되는 파일임

- 그 중 `boot.img`([다운](https://developers.google.com/android/images#sargo))와 `MagiskManager-<버전>.apk`( [다운](https://github.com/topjohnwu/Magisk))는 최신 버전을 유지하도록 함 (필수)

- 위의 파일들이 모두 준비되면, 아래 명령어로 필요한 파일을 스마트폰으로 전송

  ```shell
  adb push boot.img volte-kr-crosshatch-v1.03-20200214.zip /sdcard/Download/
  ```

### 1. Magisk Manager 설치 (Android 11 지원 가능한 Magisk 설치를 위한 )

- Magisk 설치는 Magisk Manger 설치 > Magisk 설치 순으로 진행

- Magisk Manager 관련 업데이트 정보는 다음 [github](https://github.com/topjohnwu/Magisk)에서 확인 가능

- 현재 (20년 12월 19일 기준) Magisk Manager에서는 Magisk v20까지만 지원하며, beta에서 Magisk v21까지 지원

- Magisk v20에서는 Android 11을 지원하지 않으므로, soft brick 방지를 위해 지원 버전을 확인할 필요가 있음

- Magisk Manager는 위의 github에서 적절한 apk를 내려 받아서 설치 (혹은 apk를 기기로 옮겨서 설치)

  ```shell
  adb install -r MagiskManager-v8.0.3.apk
  ```

- Magisk Manager가 설치 되면 Magisk v21 이후 버전 설치를 위해 이미지를 생성하며, 이때 사용하는 `boot.img`는 **00. 필요한 파일**에서 전송한 파일을 선택
  (/sdcard/Download/ 디렉토리 내에 `magisk_patched.img` 파일 생성)

### 2. magisk_patched.img에 diag port 개방 기능을 추가

- Magisk Manager를 통해 생성된 부팅 이미지에 diag port 개방 기능을 추가해야, KT/LGT에서 VoLTE 사용이 가능

- `parasite.sh`는 해당 작업을 진행하는 셸 스크립트 파일이며, 이를 통해 손쉽게 개방 기능을 추가한 이미지 작업 가능

- 로컬 폴더에서 아래 명령어를 실행:

  ```shell
  # from D:\sargo-volte
  
  #파일 전송 및 권한 부여
  adb push parasite.sh /data/local/tmp/
  adb shell chmod u+x /data/local/tmp/parasite.sh
  
  #파일 실행
  adb shell /data/local/tmp/parasite.sh
  
  #파일 가져오기
  adb pull -a /sdcard/Download/magisk_patched.img & adb pull -a /sdcard/Download/magisk_patched_diag.img
  ```

### 3. Diag port 개방 기능을 추가한 이미지로 boot 파티션 플래싱 (Magisk 설치)

- 위의 명령어로 파일을 가져 왔다면, 이제 Magisk를 설치할 차례임:

  ```shell
  adb reboot bootloader
  fastboot flash boot magisk_patched_diag.img
  fastboot reboot
  
  ## 혹은 아래 명령어로 한번에 실행
  #adb reboot bootloader && fastboot flash boot magisk_patched_diag.img && fastboot reboot
  ```

- 재부팅 되면, Magisk Manager를 열어 정상적으로 Magisk까지 설치가 되었는지 확인함

### 4. Magisk Manager에서 VoLTE 모듈 설치

- 위의 설치과정이 마무리 되면, 첫번째로 할 일은 VoLTE 모듈을 설치하는 것임
- Magisk Manager에서 모듈로 들어가 **00. 필요한 파일**에서 전송해 둔 `volte-kr-crosshatch-v1.03-20200214.zip`로 모듈을 설치

### 5. Diag port 개방 후 EFS Explorer로 user_agent_template 교체

- Diag port는 su 권한으로 android 기기에 접근하여 개방할 수 있으므로 다음 명령을 수행:

  ```shell
  adb shell
  su
  setenforce 0
  setprop sys.usb.configfs 1 && setprop sys.usb.config diag,serial_cdev,rmnet_gsi,adb
  ```

- 위의 명령을 실행했을 때 adb가 종료되어 windows의 명령 프롬프트가 나오면 diag port가 개방된 것으로 볼 수 있음 (기기를 재부팅하면 diag mode에서 빠져나옴)

- Diag port가 개방되면 QPST에서 설치한 **EFS Explorer**로 모뎀 설정을 수정할 수 있음

- EFS Explorer 에서 `/google/uger_agent_template`을 **00. 필요한 파일**에 준비되어 있는 파일로 대체

___

## 아마 정상적으로 작업이 이루어 졌다면, 현 시점에서 VoLTE가 작동할 것임

___

### 6. Magisk 삭제

- Magisk를 사용해도 괜찮지만, 순정으로 돌리고 싶다면 Magisk를 삭제해야 함
- 이때 Magisk Manager에서 **완전 삭제**를 실행하면, 재부팅되고 diag mode에서도 빠져나오게 됨





### 7. 참조 문서

[Android 11을 올린 Pixel 3/XL에서 VoLTE 작업하기](https://cafe.naver.com/grnf/332847)

[[강좌\]매지스크 (카나리) 설치 방법](https://cafe.naver.com/grnf/332795)

[순정 매지스크에 diag port 개방 기능을 포함시켜 설치하기](https://cafe.naver.com/grnf/328846)



