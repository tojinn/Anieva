class Anime < ApplicationRecord
  has_many :posts,dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  #アニメをインポートするための記述
  enum season: { spring: 1, summer: 2, autumn: 3, winter: 4 }
  def import_from_annict
    base_url = "https://api.annict.com/v1"
    access_token = ENV["ANNICT_ACCESS_TOKEN"]

   start_year = 2021
   end_year = Date.today.year
   seasons = ["spring", "summer", "autumn", "winter"]

   (start_year..end_year).each do |year|
     seasons.each.with_index(1) do |season, index|
       # 初回リクエストはデータの総数を調べるために実行
        data = JSON.parse(Faraday.get("#{base_url}/works?fields=id&per_page=50&filter_season=#{year}-#{season}&sort_watchers_count=desc&access_token=#{access_token}").body)

        data_count = data["total_count"] # データの数
        page_count = (data_count / 50.to_f).ceil # ページの数

        current_page = 1

        # 現在のページ <= ページの数になるまで繰り返し処理を実行
        while current_page <= page_count do
          data = JSON.parse(Faraday.get("#{base_url}/works?fields=title,images,twitter_username,official_site_url,media_text,syobocal_tid,season_name_text&page=#{current_page}&per_page=50&filter_season=#{year}-#{season}&sort_watchers_count=desc&access_token=#{access_token}").body)
          animes = data["animes"]

          animes.each do |anime|
            # すでにレコードが存在する場合は更新、無ければ新規作成
            anime.find_or_initialize_by(title: work["title"]).update(
              year: year,
              season: index
              )
          end
          current_page += 1
        end
      end
    end
  end
end
