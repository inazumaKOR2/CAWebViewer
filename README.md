# Crazy Arcade Avatar Viewer Web

크레이지 아케이드 캐릭터, 아바타, 캐릭터데코, 슬롯, ID데코를 브라우저에서 조합해 볼 수 있는 정적 웹 뷰어입니다.

This is a static web viewer for previewing Crazy Arcade characters, avatars, character decorations, slots, and ID decorations in the browser.

## 한국어

### 특징

- 브라우저에서 크레이지 아케이드 캐릭터 미리보기
- Avatar, CharDeco, Slot, IDDeco 장착 미리보기
- 레벨 아이콘, 닉네임, 마이페이지 프레임 표시
- 좌표 조정 및 브라우저 로컬 저장
- 현재 미리보기 GIF 저장
- GitHub Pages 같은 정적 호스팅에서 실행 가능

### 중요

이 저장소에는 게임 리소스 파일을 포함하지 않습니다.

사용자는 웹페이지에서 자기 PC의 크레이지 아케이드 설치 폴더를 직접 선택합니다. 선택한 파일은 브라우저에서 로컬로만 읽히며 서버로 업로드되지 않습니다.

절대 GitHub에 올리면 안 되는 파일 예시:

- `*.idx`
- `*.idd`
- `*.ssd`
- `frame.png`
- `mypage_offsets.json`
- 기타 크레이지 아케이드 원본 리소스 파일

### 사용 방법

1. 웹페이지를 엽니다.
2. `폴더 열기`를 누릅니다.
3. 크레이지 아케이드 설치 폴더를 선택합니다.
4. 브라우저가 파일 접근 권한을 물어보면 허용합니다.
5. 왼쪽 목록에서 Avatar, CharDeco, Slot, IDDeco를 선택합니다.
6. `장착`을 눌러 미리보기에 적용합니다.
7. 캐릭터, 방향, 동작, 레벨, 좌표, 장착 위치를 조정합니다.
8. `GIF 저장`을 누르면 현재 미리보기 애니메이션을 GIF로 저장합니다.

### 필요한 로컬 파일

선택한 크레이지 아케이드 설치 폴더에는 아래 파일들이 있어야 합니다.

- `FxCharacter.idx` / `FxCharacter.idd`
- `CharTE.idx` / `CharTE.idd`
- `EmoTE.idx` / `EmoTE.idd`
- `FxDesktop.idx` / `FxDesktop.idd`
- `frame.png` 선택 사항. 없으면 `FxDesktop`에서 자동으로 잘라옵니다.
- `csysitem.ssd`
- `mypage_offsets.json` 선택 사항

### 브라우저

Chrome 또는 Edge 권장.

GitHub Pages처럼 HTTPS로 열린 페이지에서 폴더 접근 기능이 가장 안정적으로 동작합니다.

### 로컬 테스트

```bat
serve.bat
```

브라우저에서 아래 주소를 엽니다.

```text
http://127.0.0.1:5174/
```

### 배포용 난독화 빌드

Cloudflare Pages Direct Upload처럼 파일을 직접 올릴 때는 원본 폴더가 아니라 `dist` 폴더를 올리는 것을 권장합니다.

```bat
build_release.bat
```

이 명령은 `dist` 폴더를 새로 만들고, `app.js`를 난독화한 배포본으로 생성합니다. 웹 JS는 브라우저에 전달되는 파일이라 완전히 숨길 수는 없지만, 원본 코드 노출은 줄일 수 있습니다.

GitHub Pages처럼 저장소 루트의 `app.js`가 그대로 배포되는 방식이면 아래 명령으로 루트 `app.js`도 난독화본으로 교체합니다.

```bat
build_release.bat --root
```

현재 작업 폴더 구조에서는 원본 `app.js`를 한 단계 위 폴더에서 읽고, 저장소 루트에는 배포용 난독화 파일만 둡니다.

### GitHub Pages 배포

이 폴더의 웹 파일만 저장소 루트에 올립니다.

- `index.html`
- `app.js`
- `styles.css`
- `README.md`
- `.nojekyll`
- `.gitignore`
- `serve.bat` 선택 사항

GitHub 저장소에서:

1. `Settings`로 이동
2. `Pages` 메뉴 선택
3. `Source`를 `Deploy from a branch`로 설정
4. Branch는 `main`, Folder는 `/root` 선택
5. `Save`

배포 주소 예시:

```text
https://YOUR_ID.github.io/YOUR_REPO/
```

## English

### Features

- Preview Crazy Arcade characters in the browser
- Equip and preview Avatar, CharDeco, Slot, and IDDeco items
- Show level icons, nickname, and MyPage frame
- Adjust coordinates and save them locally in the browser
- Export the current preview animation as a GIF
- Runs on static hosting such as GitHub Pages

### Important

This repository does not include game resource files.

Users select their own local Crazy Arcade install folder in the browser. The selected files are read locally and are not uploaded to a server.

Do not upload files such as:

- `*.idx`
- `*.idd`
- `*.ssd`
- `frame.png`
- `mypage_offsets.json`
- Other original Crazy Arcade resource files

### Usage

1. Open the web page.
2. Click `Open Folder`.
3. Choose the Crazy Arcade install folder.
4. Allow browser file access when prompted.
5. Select Avatar, CharDeco, Slot, or IDDeco from the left list.
6. Click `Wear` to apply it to the preview.
7. Adjust character, direction, action, levels, coordinates, and equipped layer positions.
8. Click `GIF 저장` to export the current preview animation as a GIF.

### Required Local Files

The selected Crazy Arcade install folder should contain:

- `FxCharacter.idx` / `FxCharacter.idd`
- `CharTE.idx` / `CharTE.idd`
- `EmoTE.idx` / `EmoTE.idd`
- `FxDesktop.idx` / `FxDesktop.idd`
- `frame.png` optional. If missing, the viewer crops it from `FxDesktop`.
- `csysitem.ssd`
- `mypage_offsets.json` optional

### Browser

Chrome or Edge is recommended.

Folder access works best when the page is served over HTTPS, such as GitHub Pages.

### Local Test

```bat
serve.bat
```

Open this URL in your browser:

```text
http://127.0.0.1:5174/
```

### Obfuscated Release Build

For direct file uploads such as Cloudflare Pages Direct Upload, upload the generated `dist` folder instead of the source folder.

```bat
build_release.bat
```

This command recreates the `dist` folder and writes an obfuscated deployment copy of `app.js`. Browser JavaScript cannot be fully hidden, but this reduces plain source exposure.

If the site is deployed from the repository root, such as GitHub Pages branch deployment, also replace the root `app.js` with the obfuscated build:

```bat
build_release.bat --root
```

In this local workspace layout, the source `app.js` is read from the parent folder, while the repository root keeps the deployment copy.

### Deploy To GitHub Pages

Upload only the web files in this folder to the repository root.

- `index.html`
- `app.js`
- `styles.css`
- `README.md`
- `.nojekyll`
- `.gitignore`
- `serve.bat` optional

In the GitHub repository:

1. Go to `Settings`
2. Open `Pages`
3. Set `Source` to `Deploy from a branch`
4. Select branch `main` and folder `/root`
5. Click `Save`

The deployed URL will look like:

```text
https://YOUR_ID.github.io/YOUR_REPO/
```
