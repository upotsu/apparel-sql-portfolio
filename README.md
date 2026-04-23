\# Apparel Sales \& Inventory Analysis (PostgreSQL)



\## 概要



本プロジェクトは、アパレル業界を想定したデータベースを設計し、

売上（EC / 店舗）と在庫データを統合して分析を行うポートフォリオです。



単なるCRUDではなく、\*\*実務を想定したデータモデル設計と分析SQL\*\*の実装を目的としています。



\---



\## 使用技術



\* PostgreSQL

\* SQL（JOIN / GROUP BY / UNION ALL / サブクエリ / 集計関数）

\* pgAdmin



\---



\## データモデル概要



以下のような構成で設計しています。



\* customers（顧客）

\* products（商品）

\* stores（店舗）

\* campaigns（広告施策）

\* pos\_sales（店舗売上）

\* ec\_orders（EC注文）

\* inventory\_snapshots（在庫）



\---



\## 設計ポイント



\* 外部キー制約によるデータ整合性の担保

\* 売上（EC / POS）を分離しつつ統合可能な構造

\* 在庫スナップショットによる時系列分析対応

\* 分析クエリを想定した正規化設計



\---



\## セットアップ手順



\### 1. スキーマ作成



```sql

\\i sql/01\_create\_schema.sql

```



\### 2. テーブル作成



```sql

\\i sql/02\_create\_tables.sql

```



\### 3. サンプルデータ投入



```sql

\\i sql/03\_insert\_sample\_data.sql

```



\---



\## 主な分析内容



\### 1. チャネル別売上（EC / 店舗）



\* EC売上と店舗売上を比較

\* UNION ALLを使用



\### 2. 商品別売上分析



\* EC + POS の売上統合

\* 売れ筋商品の特定



\### 3. 顧客別売上分析



\* 顧客単位の購買金額集計

\* LTV分析の基礎



\### 4. 在庫分析



\* 商品別在庫数

\* 在庫と販売数の比較



\### 5. 売上 × 在庫分析（重要）



\* 在庫と販売数量を統合

\* 欠品リスク・在庫過多の可視化



\---



\## 代表クエリ（売上 × 在庫）



```sql

SELECT

&#x20;   p.product\_name,

&#x20;   COALESCE(stock.total\_stock, 0) AS total\_stock,

&#x20;   COALESCE(sales.total\_sold\_qty, 0) AS total\_sold\_qty

FROM apparel.products p

LEFT JOIN (

&#x20;   SELECT product\_id, SUM(stock\_qty) AS total\_stock

&#x20;   FROM apparel.inventory\_snapshots

&#x20;   GROUP BY product\_id

) stock

ON p.product\_id = stock.product\_id

LEFT JOIN (

&#x20;   SELECT product\_id, SUM(qty) AS total\_sold\_qty

&#x20;   FROM (

&#x20;       SELECT product\_id, quantity AS qty FROM apparel.ec\_orders

&#x20;       UNION ALL

&#x20;       SELECT product\_id, quantity AS qty FROM apparel.pos\_sales

&#x20;   ) combined

&#x20;   GROUP BY product\_id

) sales

ON p.product\_id = sales.product\_id

ORDER BY total\_sold\_qty DESC;

```



\---



\## 工夫した点



\* 実務でよく使われる分析（売上・在庫・顧客）を一通り実装

\* 複数テーブルを跨ぐ分析クエリの作成

\* データ統合（EC / POS）を意識した設計

\* 初学者レベルから一歩踏み込んだSQL設計



\---



\## 今後の改善



\* 日次・週次の売上推移分析

\* 在庫回転率の算出

\* BIツール（Tableau / Power BI）連携

\* PythonによるETL処理の追加



\---



\## 対象



\* SQL初学者から一歩ステップアップしたい方

\* データ分析基盤の基礎を理解したい方

\* ポートフォリオを作成したい方



