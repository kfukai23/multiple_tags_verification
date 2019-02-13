# README
Ruby on Rails 複数タグ機能検証用リポジトリ

## 実現できた特徴
1) 複数のタグをひとつの投稿に紐付けて生成できる
2) 投稿更新時にタグも更新できる 
3) 投稿作成時に入力したタグが自動で生成される
4) タグはuserごとにuniqueとなる
5) userごとに、紐付けられた投稿がゼロになったタグは自動的に削除される
6) タグ入力はBootstrap Tags Inputを用い、よりそれらしい見た目と入力感を備えている

## Dependencies
Ruby 2.5.3
Ruby on Rails 5.2.2
Bundler 1.17.3

## ライブラリ
Bootstrap Tags Input https://bootstrap-tagsinput.github.io/bootstrap-tagsinput/examples/

## 手順
Bootstrap Tags Inputを関連Gemとともにインストール、マニフェストファイルに記入
https://github.com/koalamask/multiple_tags_verification/commit/409911cca317787e1114fc088adcba605245e622

bootstrap-tagsinput.jsをTurbolinksのイベントフックに合わせて発火できるよう修正する
https://github.com/koalamask/multiple_tags_verification/commit/d816474cb149d3872aacc36b1e7a1796f0582028

## 参考資料
- Bootstrap Tags Input関連
https://stackoverflow.com/questions/17317816/rails-javascript-only-works-after-reload
http://midnight-engineering.hatenadiary.jp/entry/2018/09/20/182547
https://www.wcf-drill.com/%E3%81%A9%E3%81%86%E3%82%82%E6%8C%99%E5%8B%95%E3%81%8C%E3%81%8A%E3%81%8B%E3%81%97%E3%81%84%E3%81%AA%E3%81%A8%E6%80%9D%E3%81%A3%E3%81%A6%E3%81%9F%E3%82%89turbolinks%E3%81%8B-417.html

- 複数タグ生成、レコード操作関連
https://qiita.com/tobita0000/items/daaf015fb98fb918b6b8
