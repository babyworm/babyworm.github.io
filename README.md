이 레포지토리는 https://babyworm.net 를 만들기 위해서 사용됩니다. 

## Deploy Status
[![GitHub Pages](https://github.com/babyworm/babyworm.github.io/actions/workflows/hugo.yaml/badge.svg)](https://github.com/babyworm/babyworm.github.io/actions/workflows/hugo.yaml)

[![Netlify Status](https://api.netlify.com/api/v1/badges/6c0cd1b2-4699-4b4b-8183-6a9c0426ac07/deploy-status)](https://app.netlify.com/projects/babyworm/deploys)

[![Cloudflare Pages](https://img.shields.io/badge/Cloudflare-Pages-F38020?logo=cloudflare&logoColor=white)](https://babyworm.net)

---

## Shortcodes

이 블로그는 Hugo shortcode를 통해 다양한 콘텐츠 요소를 삽입할 수 있습니다.

### Custom Shortcodes

직접 구현한 커스텀 shortcode입니다.

#### 1. Notice (알림 박스)
정보, 경고, 팁 등의 알림 박스를 표시합니다.

```markdown
{{< notice "info" >}}정보 메시지{{< /notice >}}
{{< notice "warning" title="주의" >}}경고 메시지{{< /notice >}}
```

**파라미터:**
- `type`: `info`, `warning`, `tip`, `note`
- `title`: 알림 제목 (선택)

#### 2. Expand (접기/펼치기)
접었다 펼칠 수 있는 콘텐츠를 생성합니다.

```markdown
{{< expand title="더 보기" open="false" >}}
숨겨진 내용
{{< /expand >}}
```

**파라미터:**
- `title`: 제목 (기본값: "Details")
- `open`: 초기 상태 `true`/`false` (기본값: `false`)

#### 3. Wikipedia / WP (위키피디아 링크)
위키피디아 문서로 링크를 생성합니다.

```markdown
{{< wikipedia "Machine Learning" >}}
{{< wp "Machine Learning" "머신러닝" >}}
```

**파라미터:**
- 첫 번째 인자: 위키피디아 검색어 (영문)
- 두 번째 인자: 표시 텍스트 (선택)

**참고:** 영문 위키피디아만 지원

---

### Blowfish Theme Shortcodes

테마에서 제공하는 주요 shortcode입니다. [전체 문서](https://blowfish.page/docs/shortcodes/)

#### Alert
알림 메시지 표시

```markdown
{{< alert >}}경고 메시지{{< /alert >}}
{{< alert "twitter" >}}트위터 알림{{< /alert >}}
```

#### Badge
뱃지 표시

```markdown
{{< badge >}}New{{< /badge >}}
```

#### Button
버튼 생성

```markdown
{{< button href="#" target="_self" >}}클릭{{< /button >}}
```

#### Figure
이미지와 캡션 표시

```markdown
{{< figure src="image.jpg" alt="설명" caption="캡션" >}}
```

#### Gallery
이미지 갤러리

```markdown
{{< gallery >}}
  <img src="image1.jpg" />
  <img src="image2.jpg" />
{{< /gallery >}}
```

#### GitHub / GitLab / Gitea
저장소 정보 카드

```markdown
{{< github repo="username/repo" >}}
{{< gitlab projectID="12345678" >}}
```

#### Icon
아이콘 삽입

```markdown
{{< icon "github" >}}
```

#### KaTeX
수학 공식

```markdown
{{< katex >}}
f(x) = \int_{-\infty}^\infty\hat f(\xi)\,e^{2 \pi i \xi x}\,d\xi
{{< /katex >}}
```

#### Lead
강조 텍스트

```markdown
{{< lead >}}
중요한 내용을 강조합니다.
{{< /lead >}}
```

#### Mermaid
다이어그램 생성

```markdown
{{< mermaid >}}
graph LR
A[시작] --> B[종료]
{{< /mermaid >}}
```

#### Timeline
타임라인 표시

```markdown
{{< timeline >}}
{{< timelineItem icon="code" header="제목" badge="2024" >}}
내용
{{< /timelineItem >}}
{{< /timeline >}}
```

#### TypeIt
타이핑 애니메이션

```markdown
{{< typeit >}}
타이핑 효과
{{< /typeit >}}
```

#### YouTube Lite
경량 YouTube 임베드

```markdown
{{< youtubeLite id="dQw4w9WgXcQ" label="비디오 제목" >}}
```

---

상세한 프로젝트 정보는 [CLAUDE.md](./CLAUDE.md)를 참고하세요.
