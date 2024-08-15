---
icon: material/bird
---

# 音标

## 单元音

### 前元音

| 音标   | 发音                                                | 单词 | 说明 |
|------|---------------------------------------------------|----|----|
| /iː/ | <span class="phonetic" mp3="mp3/iː.mp3">🔊</span> |    |    |
| /ɪ/  | <span class="phonetic" mp3="mp3/ɪ.mp3">🔊</span>  |    |    |
| /e/  | <span class="phonetic" mp3="mp3/e.mp3">🔊</span>  |    |    |
| /æ/  | <span class="phonetic" mp3="mp3/æ.mp3">🔊</span>  |    |    |

### 中元音

| 音标   | 发音                                                | 单词 | 说明 |
|------|---------------------------------------------------|----|----|
| /ɜː/ | <span class="phonetic" mp3="mp3/ɜː.mp3">🔊</span> |    |    |
| /ə/  | <span class="phonetic" mp3="mp3/ə.mp3">🔊</span>  |    |    |
| /ʌ/  | <span class="phonetic" mp3="mp3/ʌ.mp3">🔊</span>  |    |    |

### 后元音

| 音标   | 发音                                                | 单词 | 说明 |
|------|---------------------------------------------------|----|----|
| /uː/ | <span class="phonetic" mp3="mp3/uː.mp3">🔊</span> |    |    |
| /ʊ/  | <span class="phonetic" mp3="mp3/ʊ.mp3">🔊</span>  |    |    |
| /ɔː/ | <span class="phonetic" mp3="mp3/ɔː.mp3">🔊</span> |    |    |
| /ɒ/  | <span class="phonetic" mp3="mp3/ɒ.mp3">🔊</span>  |    |    |
| /ɑː/ | <span class="phonetic" mp3="mp3/ɑː.mp3">🔊</span> |    |    |

## 双元音

| 音标   | 单词 | 说明 |
|------|----|----|
| /eɪ/ |    |    |
| /aɪ/ |    |    |
| /ɔɪ/ |    |    |
| /aʊ/ |    |    |
| /əʊ/ |    |    |
| /ɪə/ |    |    |
| /eə/ |    |    |
| /ʊə/ |    |    |

## 辅音

### 清辅音

爆破音：

| 音标  | 单词 | 说明 |
|-----|----|----|
| /p/ |    |    |
| /t/ |    |    |
| /k/ |    |    |

摩擦音：

| 音标  | 单词 | 说明 |
|-----|----|----|
| /f/ |    |    |
| /s/ |    |    |
| /∫/ |    |    |
| /θ/ |    |    |
| /h/ |    |    |

破擦音：

| 音标   | 单词 | 说明 |
|------|----|----|
| /t∫/ |    |    |
| /tr/ |    |    |
| /ts/ |    |    |

### 浊辅音

爆破音：

| 音标  | 单词 | 说明 |
|-----|----|----|
| /b/ |    |    |
| /d/ |    |    |
| /g/ |    |    |

摩擦音：

| 音标  | 单词 | 说明 |
|-----|----|----|
| /v/ |    |    |
| /z/ |    |    |
| /ʒ/ |    |    |
| /ð/ |    |    |
| /r/ |    |    |

破擦音：

| 音标   | 单词 | 说明 |
|------|----|----|
| /dʒ/ |    |    |
| /dr/ |    |    |
| /dz/ |    |    |

鼻音：

| 音标  | 单词 | 说明 |
|-----|----|----|
| /m/ |    |    |
| /n/ |    |    |
| /ŋ/ |    |    |

舌则音：

| 音标  | 单词 | 说明 |
|-----|----|----|
| /l/ |    |    |

半元音：

| 音标  | 单词 | 说明 |
|-----|----|----|
| /j/ |    |    |
| /w/ |    |    |

<audio id="audioPlayer" style="display:none"></audio>
<script>

const hoverWords =document.querySelectorAll(".phonetic");

const audioPlayer = document.getElementById('audioPlayer');

hoverWords.forEach(word => {
    word.style.cursor = "pointer";
    word.addEventListener('click', () => {
        const audioSrc = word.getAttribute('mp3');
        audioPlayer.src = audioSrc;
        audioPlayer.play();
    });
})
</script>
