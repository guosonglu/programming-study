function resizeAllIframes() {
  const iframes = document.getElementsByTagName("iframe");
  const iframesLength = iframes.length;

  for (let i = 0; i < iframesLength; i++) {
    resizeIframe(iframes[i]);
  }
}

function resizeIframe(iframe) {
  if (iframe) {
    const iframeDoc = iframe.contentWindow.document;
    iframe.style.height = calcPageHeight(iframeDoc) + "px";
  }
}

function calcPageHeight(doc) {
  const cHeight = Math.max(doc.body.clientHeight, doc.documentElement.clientHeight);
  const sHeight = Math.max(doc.body.scrollHeight, doc.documentElement.scrollHeight);
  return Math.max(cHeight, sHeight);
}

window.addEventListener("load", function() {
  resizeAllIframes();
});
