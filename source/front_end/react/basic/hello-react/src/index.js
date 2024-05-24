import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);

// 如果您想在应用程序中开始测量性能，请通过一个函数
// 来记录结果（例如：reportWebVitals(console.log)
// 或发送到分析端点。了解更多信息： https://bit.ly/CRA-vitals
reportWebVitals();
