# Kunming Guidebook

Offline-friendly Kunming travel guidebook (Aug 2026).

**GitHub Pages:** https://randomwalk202.github.io/city-guidebook/

## Supabase 云端同步（游后感）

1. 在 [Supabase](https://supabase.com) 新建项目
2. SQL Editor 里运行 `supabase/migrations/001_guide_notes.sql`
3. Authentication → URL Configuration 添加重定向：`https://randomwalk202.github.io/city-guidebook/kunming.html`
4. 复制 `supabase-config.example.js` 为 `supabase-config.js`，填入 Project URL 和 anon key
5. 部署后点页面右上角「登录同步」，邮箱收链接即可跨设备同步

笔记经 RLS 隔离，只有登录用户本人能读写自己的数据。
