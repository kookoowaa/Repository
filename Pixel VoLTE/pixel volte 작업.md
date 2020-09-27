안녕하세요.



Pixel 3a VoLTE(KT) 작업을 근 1년 넘게 미루어 오다 이번에 진행했네요. 그간 VoLTE 작업을 미루어 왔던 이유는 3g 통화가 썩 나쁘지 않았던 것도 있고, 순정 상태의 폰을 선호해서 (벽돌 무서움) 기기에 손대는 것이 꺼려졌던 것도 컸었던 것 같네요. 해서 빈번하게 VoLTE 글들이 올라왔지만 내용이 긴 것도 있고 쓱 훑어보고 말아왔는데, 이번에 시간이 좀 생겨 누리로님 외 다른 글들을 읽다 보니 제가 갖고 있던 오해와 편견들이 일부 있었던 것을 깨달을 수 있었네요.

**" VoLTE 작업 후에 순정 상태로 유지 가능 "**

전반적인 프로세스를 간단하게 한줄로 요약해 보자면 "핸드폰 내 설정 값들을 수정" 하는 과정이며, 그렇게 복잡한 과정은 아닌 만큼 여러 분들께서 시도해 보셔도 무방할 것 같습니다.

첫 작업이다 보니 2~3시간 정도 소요되었던 것 같은데 후기 및 기존의 내용들을 복기하고 쉽게 풀어보자는 취지에서 이 글을 남깁니다. 참고로 제 백그라운드는 현업에서 python 활용한 데이터 분석(를 하고 싶으나 실제로는 엑셀과 지내는 시간이 훨씬 많은) 업무를 하는 기술과 비기술 중간 어디 즈음에 있다보니, 프로그래밍이 생소하신 분들께 좀더 직관적으로 설명할 수 있지 않을까 싶습니다.

본문으로 들어가기 전에 본 프로세스를 정립해 주신 **누리로**님, 깃허브의 **gheron772**님께 말로 다 못할 감사를 드리며, 혹시 제가 잘못 이해/설명하고 있는 내용이 있다면 편하게 댓글 남겨주세요. 본 글의 내용이 기존 두분께서 작성하신 글을 재정리한 글인 만큼, **원작자께서 요청하신다면 가타부타 없이 즉각 폐기**토록 하겠습니다.



## 1.  전체 프로세스에 대한 이해

바로 작업 내용으로 넘어가보려 하였으나, 벽돌/무한부팅에 대한 막연한 두려움을 갖고 계실 많은 분들을 위해 최대한 직관적으로 전체 프로세스를 요약해서 설명드려보려 합니다.

사실 윈도우를 안쓴다 뿐이지 스마트폰은 충분히 컴퓨터의 역할을 하고 있습니다. 다만 그 자유도에 있어 스마트폰의 편집/통제 권한은 집에서 사용하는 데스크탑에 비해 현저히 떨어지죠. 그래서 저희는 우선 스마트폰에 대한 개발자 권한을 획득하고 컴퓨터와 연결하려 합니다. 그리고 부트로더 언락을 통해 좀더 중요한, 예를 들면 부팅 파일과 같은 영역에 손댈 수 있는 기반을 마련해야겠죠. 이 단계 까지 스마트폰은 순정 상태입니다.

그 다음은 루팅이 필요합니다. 루팅은 부트로더 언락을 통해 획득한 권한으로 Magisk를 설치하는 과정이라 볼 수 있습니다. 그리곤 Magisk를 통해 모뎀 설정을 업데이트 하는 것이죠. 따라서 이후에는 순정으로 돌아가도 전혀 VoLTE 사용에 문제가 없습니다. 물론 공식 업데이트에 모뎀관련 내용이 있다면 초기화 되겠지만, 그때는 다시 "루팅>설정 업데이트>순정화" 과정을 반복하면 될겁니다. (누군가 능력자 분께서... ㅎ)

안타깝게도 KT와 U+에서는 추가 작업이 필요했습니다. 추정하기로는 통신사의 VoLTE 서버에서 모뎀의 특정 설정값을 체크하는 것으로 보이는데, 따라서 모뎀의 설정값도 수정할 필요가 있습니다. 이 때에는 정확한 표현인지는 모르겠지만 컴퓨터로 스마트폰에 연결한다기 보다는 스마트폰의 모뎀에 파티션에 연결한다는 개념으로 이해했고, 위 과정과는 조금 다르게 진행이 되겠습니다.

본격적으로 진행해 보겠습니다만, 상세한 내용은 [누리로님 포스팅](https://cafe.naver.com/refurbishfactory/174289)과 병행해 주세요.



## 2. 부트로더 언락

- Overview

> 한차례 기기의 **공장 초기화**가 필요 (이후 시스템 업데이트 시 매번 공장 초기화가 요구되는 것은 아님)
>
> 부트로더를 언락하게 되면, booting을 loading하는 기능에 대한 통제 권한을 넘겨 받음
>
> 부트로더 언락은 루팅과 다르며, 순정 상태로 계속 사용할 수 있음 (몇몇 예외사항 제외)

- 필요한 파일

  ```shell
  - adb.exe # SDK
  - AdbWinApi.dll # SDK
  - AdbWinUsbApi.dll # SDK
  - fastboot.exe # SDK
  ```

부트로더에 필요한 파일은 **Android SDK** 뿐입니다. 픽셀폰의 개발자 권한 획득 후 **USB 디버깅**과 **OEM 잠금 해제**는 필수 입니다. 첫번째 옵션은 SDK의 `adb.exe`로 픽셀폰과 연결하기 위해 필요하고, 두번째 옵션은 연결 이후 실제 부트로더 언락을 위해 필요한 옵션입니다. 아, 한 단계가 더 있네요. https://developer.android.com/studio/run/win-usb에서 Google USB Driver를 잡아줄 필요가 있습니다.

- 언락 과정

누리로님과 동일하게 `d:\crosshatch-volte` 디렉터리에서 작업을 수행하겠습니다.

``` shell
cd /d D:\crosshatch-volte
adb devices
# 'unauthorized' 대신 'device'가 써 있으면 USB 디버깅 상태로 연결 확인
```

`adb devices` 명령을 통해 픽셀폰과 연결상태를 확인 가능합니다. 아마 **USB 디버깅** 설정을 제대로 하셨다면 device라고 써있는게 정상입니다.

```shell
adb reboot bootloader
#부트로더 모드로 재부팅
```

`adb reboot bootloader`명령을 수행하면, 핸드폰이 재부팅 됩니다. 그리고 기존에 볼 수 없던 검은 화면에 접하게 됩니다. 도스화면 같기도하고, Bios 메뉴 같기도 한 뭐시기 화면이 어쨌든 부트로더이고, 하단에 `Device state:locked`로 되어 있는게 정상입니다. 이제 부트로더를 언락하겠습니다.

```shell
fastboot flashing unlock
#기기 언락
```

부트로더 언락 명령을 실행하면 기기의 화면이 한번 더 바뀌게 되고, 이제부터는 핸드폰으로 조작을 하시면 되겠습니다. 볼륨 버튼으로 최상단의 메뉴를 변경할 수 있고, `Unlock the bootloader`로 메뉴가 바뀐 상태에서 전원 버튼을 누르면... `Device state:unlocked`로 변경이 됩니다.

이제 부트로더가 언락되었고, 공장초기화가 되었고, 기기가 재부팅되면 다시 스마트폰을 세팅하면 됩니다.



## 3. OMD 모델명 변경

타이핑이 불필요한 과정입니다!

고객센터에 전화 걸어주시고 2가지만 상담원께 요청해 주세요.

1) VoLTE가 되는 모델명으로 OMD 모델명을 변경해주세요 (IMEI 번호 준비)

2) Wi-Fi 맥 주소 등록해 주세요 (Mac 주소 준비)

우리가 갖고 있는 픽셀폰은 통신사에서 사전에 기기 정보를 보유하고 있지 않고, 전산 상 VoLTE가 지원되지 않습니다. 1번 과정을 통해 기기 정보를 통신사에 등록하여 VoLTE를 사용할 수 있는 모델명으로 변경할 수 있습니다. 이후 통신사를 변경하더라도 기기 정보는 남기 때문에 **한번만** 시간 내서 고객센터로 문의 주세요. 2번 과정은 통신사에서 제공하는 무료 와이파이를 사용하기 위함으로 알고 있습니다.

끝



## 4. Magisk로 루팅

- 오버뷰

  > Magisk로 부팅 이미지를 수정
  >
  > 수정 후 모뎀 설정을 수정해주는 VoLTE 모듈을 설치할 수 있음
  >
  > 또한 KT/U+의 경우 magisk를 통해 추가 작업을 위한 락까지 해제

- 필요한 파일

  ```shell
  - adb.exe # SDK
  - AdbWinApi.dll # SDK
  - AdbWinUsbApi.dll # SDK
  - fastboot.exe # SDK
  - boot.img # 팩토리 이미지
  ```

루팅 과정에 대해 잠깐 설명드리겠습니다. 루팅 과정은 1)`Magisk manager` 설치 -> 2) Magisk manager에서 `boot.img` 파일을 넣고 패치하여 `magisk_patched.img` 파일을 생성 -> 3) 패치된 파일을 컴퓨터로 갖고 와서 SDK로 boot.img 대신 `magisk_patched.img`로 부팅하도록 변경하는 과정을 거칩니다.

여기서 SK와 KT/U+가 갈립니다. SK는 누리로님 글에 있는 그대로 [파일](https://github.com/topjohnwu/Magisk/releases/download/manager-v7.5.1/MagiskManager-v7.5.1.apk)을 내려받은 후 진행하면 됩니다. KT/U+는 스마트폰의 모뎀에 연결하기 위한 패치가 되어있는 변형된 Magisk manager를 설치해야 합니다. ghaeron772님께서 올려두신 파일 2개(`app-debug.apk`(설치파일), `build_magisk.zip`)를 내려받으면 되고 [여기](https://github.com/gheron772/Pixel3aVoLTE/tree/master/files)에서 다운받을 수 있습니다. 받은 파일은 가급적 기기의 `/sdcard/Download/` 디렉터리에 위치해 주시면 되며, SDK를 통해 push할 수는 있지만 스마트폰 브라우저(크롬)으로 내려받는 것을 추천합니다. (SK/U+의 경우 이후 과정 때문에 필히 위의 디렉터리에 파일 위치할 것) 자, 내려받은 apk 파일을 과감히 설치 합시다!

Magisk manager가 설치되면 컴퓨터로 이동하겠습니다.

```shell
cd /d D:\crosshatch-volte
adb push boot.img /sdcard/Download/ 
```

위의 명령어로 스마트폰의 다운로드 디렉터리에 `boot.img` 팩토리 파일을 전송합니다.

팩토리 이미지는 다음 [링크](https://developers.google.com/android/images#sargo)에서 내려받을 수 있습니다

전송이 끝나면 다시 스마트폰으로 넘어와서 Magisk manager를 실행합니다. 상단에 **Magisk가 설치되지 않음**이라고 쓰여 있을텐데, 우측의 '설치' 버튼을 누릅니다. 이후 '파일 선택 및 패치'를 선택하고, 컴퓨터에서 옮겨온 `boot.img` 파일을 선택합니다. 잠시 검은 화면에서 스마트폰이 열일하고, '완료!'가 뜨면 `/sdcard/Download/` 디렉터리에 `magisk_patched.img`파일이 생성됨을 알 수 있습니다.

다시 컴퓨터로 이동하겠습니다.

```shell
adb pull /sdcard/Download/magisk_patched.img 
```

위 명령어로 기기 내에서 Magisk manager가 생성한 파일을 컴퓨터로 가져올 수 있습니다.

```shell
adb reboot bootloader
fastboot flash boot magisk_patched.img
fastboot reboot
```

컴퓨터로 기기를 다시 한번 부트로더 모드로 재부팅하고, 내려받은 `magisk_patched.img` 파일로 부팅하도록 변경해 주겠습니다. 다시 재부팅 하면 루팅된 상태로 스마트폰을 사용할 수 있습니다.

마지막으로 불필요한 파일을 삭제하겠습니다. (그래야 된다고 하네요.)

```shell
del boot.img magisk_patched.img
adb shell rm /sdcard/Download/boot.img /sdcard/Download/magisk_patched.img
```

첫번째 명령어는 PC에서, 두번째는 스마트폰에서 `boot.img`와 `magisk_patched.img` 파일을 삭제하는 명령어입니다.



## 5. VoLTE 모듈 설치 (모뎀 설정 수정)

- 오버뷰

  > VoLTE 모듈은 누리로님께서 제작하여 배포하고 있음
  >
  > 다운받아 Magisk manager를 통해 설치하면 끝

- 필요한 파일

  ```shell
  - volte-kr-crosshatch-{버전}
  ```

누리로님의 Pixel3 설치글 중에 VoLTE 모듈에 대해 설명하는 부분이 있는데, 정말 다행히도 누리로님께서 직접 해당 파일을 3a/XL에서도 설치되도록 업데이트 하셨다고 말씀해 주셨습니다. (다시 한번 감사!) 따라서 그대로 따라하면 됩니다. 모듈을 다운받는 위치는 누리로님의 Github이며 [여기](https://github.com/nooriro/volte-kr-crosshatch/releases)에서 최신 파일을 내려받을 수 있습니다. (스마트폰에서 받기를 권장)

내려 받았다면 Magisk manager에서 메뉴 -> 모듈 -> 추가 버튼 + `volte-kr-crosshatch-{버전}` 선택을 통해 모듈을 설치할 수 있습니다. 재부팅 하면 SK의 경우 VoLTE가 되는 게 정상입니다.

이제 Magisk를 삭제하고 순정 상태로 스마트폰을 돌려 두어도 `/data/vendor/modem_fdr/fdr_check`의 설정이 바뀌기 전까진(업데이트 등으로) VoLTE를 계속 사용할 수 있습니다. 저 같은 경우는 스마트폰을 순정으로 돌려두었고 해당 과정은 '6. 순정으로 돌리기'에서 설명하겠습니다.



## 6.KT/U+의 경우 VoLTE 서버에서 체크하는(추정) 설정값(`user_agent_template`) 변경

- 오버뷰

  > 통신사 별 모뎀 설정 파일을 변경하여 VoLTE 사용
  >
  > 변형된 magisk manager로 diag port를 개방시킴
  >
  > QPST 에서 기기 인식
  >
  > QPST로 모뎀 설정 파일 변경


- 필요한 파일

  ```shell
  - adb.exe # SDK
  - AdbWinApi.dll # SDK
  - AdbWinUsbApi.dll # SDK
  - fastboot.exe # SDK
  
  - QPST_2.7.480 # QPST 설치 파일
  
  - google_devices-{기기 코드명}-{빌드 버전}.tgz # 유저디버그 벤더 tgz
  
  - vbmeta.img # 팩토리 이미지
  - vendor.img # 팩토리 이미지 (순정 되돌리기)
  
  - user_agent_template # gheron772 Github
  ```

Magisk에서 gheron772 님의 `Pixel_2_Diag_port.zip` 를 설치하는 것도 방법이지만, 단순히 아래 명령어를 실행하는 것 만으로도 diag port를 개방하도록 하니 둘중 편한 방법을 사용해도 됩니다. (저는 후자)

```shell
adb shell
su
# 스마트폰에서 팝업된 [허용] 버튼 클릭
setenforce 0
setprop sys.usb.configfs 1 && setprop sys.usb.config diag,serial_cdev,rmnet_gsi,adb
```

다음으로는 QPST를 설치하겠습니다. [여기]( https://qpsttool.com/category/download)에서 QPST를 다운받을 수 있으며, Driver 폴더 안의 `Qualcomm USB Deriver V1.0.exe`를 실행하여 **QPST**와 **EFS Explorer**를 설치할 수 있습니다. 아직까지는 두 프로그램에서 Pixel 모뎀에 연결하는 것이 불가능 하며, 부트로더를 통해 내려받은 유저디버그 벤더 이미지로 부팅, **NSG**란 이름의 앱을 통해 QPST 연결이 가능합니다.

유저 디버그 벤더  파일은([다운](https://developers.google.com/android/drivers)) tgz 확장자를 갖고 있는 압축파일이며, 압축을 풀면 리눅스의 sh 파일이 나옵니다. 감사하게도, 7-zip을 사용하면 sh 파일도 압축 해제가 가능하며, 쭉쭉 하위 폴더로 들어가다 보면 `vendor\google_devices\crosshatch\proprietary\vendor.img` 파일을  찾을 수 있습니다. 해당 파일은 팩토리 이미지에서 내려받은 순정 이미지와 구별하기 위해 `vendor-userdebug.img`로 저장하겠습니다. 이제 유저 디버그 벤더 이미지로 부팅해 보도록 하겠습니다.

```shell
adb reboot bootloader
fastboot flash vbmeta vbmeta.img --disable-verity
fastboot reboot-fastboot
fastboot flash vendor vendor-userdebug.img
fastboot reboot
```

위에서 Magisk로 루팅할 때와는 다르게 `fastboot flash vbmeta vbmeta.img --disable-verity`로  `dm-verity`를  해제해야 하고, 이를 위해 `vendor.img` 외 `vbmeta.img`가 필요합니다. 해제 이후엔 유저 디버그 벤더 이미지(`vendor-userdebug.img`)로 플래싱 후 다시 재부팅 해 줍니다.

이제 QPST로 설치한 EFS Explorer를 사용하기 위한 마지막 한단계로 **NSG**(Network Signal Guru) 앱이 필요합니다. 해당 앱은 [링크](https://play.google.com/store/apps/details?id=com.qtrun.QuickTest)에서 설치할 수 있습니다. 위 과정을 정상적으로 실행해 왔으면 앱 실행 시 **Driver not working or unknown error**라고 나오고, EFS Explorer에서 기기 정보가 표시되는 것을 확인 할 수 있습니다.

다 끝나 갑니다!

EFS에서 pixel 폰에 접속하면 내컴퓨터와 비슷한 인터페이스를 만나게 되고, 사전에 내려받은  `user_agent_template` 파일을 교체해주면 됩니다. 해당 파일은 google 폴더 안에 있으니 윈도우에서 끌고 와서 교체해 주면 됩니다. 이제 EFS Explorer를 종료하고 5~10초 후 `adb reboot` 명령을 실행하면, 기기가 재부팅 되고 VoLTE가 되는 것을 확인 할 수 있습니다.



## 7. 순정으로 돌리기

- 오버뷰

  > `vbmeta`, `vendor` 파티션 복원
  >
  > `boot` 파티션 복원

- 필요한 파일

  ```shell
  - adb.exe # SDK
  - AdbWinApi.dll # SDK
  - AdbWinUsbApi.dll # SDK
  - fastboot.exe # SDK
  
  - vbmeta.img # 팩토리 이미지
  - vendor.img # 팩토리 이미지
  ```

순정으로 되돌리기 위해 먼저 벤더 이미지부터 원상 복구 시키겠습니다.

```shell
adb reboot bootloader
fastboot flash vbmeta vbmeta.img
fastboot reboot-fastboot
fastboot flash vendor vendor.img
fastboot reboot
```

위의 명령어를 실행하면 `vbmeta`와 `vendor`가 팩토리 이미지(순정)로 복원된 상태로 부팅되게 됩니다. 벤더 복원 끝!

그리고 Magisk Manager 앱에 들어가서 하단의 제거 -> 완전히 제거를 클릭하면 `magisk_patched.img`로 덮어쓰였던 `boot.img`도 순정으로 복원되어 순정 상태의 (부트로더만 언락된) 픽셀폰을 사용 가능합니다. 이때 주요 설정값들은 바뀐 상태이기 때문에 순정으로 돌아가더라도 관련 설정값들을 건드리는 시스템 업데이트만 없다면 VoLTE는 유지됩니다.



어휴....

올라와 있는 내용만 제가 이해한 대로 정리 해 보았는데도 맥이 빠지는데,

이 방대한 내용을 개발하고 하나하나 설명해 주신 누리로님 외 개발자 분들께 다시 한번 감사드리며,

참조한 원작자 분들께서 혹여나 조금이라도 불편하시다면 즉각 삭제토록 하겠습니다.

(제가 잘못 이해하거나 너무 단순화해서 설명하려 한 부분이 있다면 지적 부탁드립니다.)



참조1.

[공초 하나 없이 깨끗한 픽셀 3의 VoLTE 활성화 방법](https://cafe.naver.com/refurbishfactory/174289)

[*[픽셀 3]*순정 매지스크에 diag port 개방 기능을 포함시켜 설치하기](https://cafe.naver.com/grnf/328846)

[*[픽셀 3A]* 픽셀 3a volte 패치중에 문제가 발생했습니다.ㅜㅜ](https://cafe.naver.com/grnf/328815)

[Pixel 3a VoLTE patch](https://github.com/gheron772/Pixel3aVoLTE)



참조2. **Android 11** 이후

[Android 11을 올린 Pixel 3/XL에서 VoLTE 작업하기](https://cafe.naver.com/grnf)

[[강좌\]매지스크 (카나리) 설치 방법](https://cafe.naver.com/grnf/332795)

> - 유저 디버그 벤더 파일을 플래싱 하는 방식은 더이상 불필요
> - 기기에서 `parasite.sh`를 실행하여, `magisk_patched.img`로부터 `magisk_patched_diag.img`를 생성하도록 추가작업
> - `magisk_patched_diag.img`로 플래싱하면 diag port 개방 기능이 추가





