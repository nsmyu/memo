require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

status = 0 # 1or2の入力前:0、1or2の入力後:10

while status == 0 do
 puts "\e[44m1 → 新規でメモを作成する / 2 → 既存のメモを編集する\e[0m"
 memo_type = gets.to_i

 if memo_type == 1
  puts "\e[44m拡張子を除いたファイル名を入力してください\e[0m"
  file_name = gets.chomp
  file = File.open("#{file_name}.csv", "w")
  
  puts "\e[44mメモしたい内容を入力してください\e[0m"
  puts "\e[44m入力し終えたら「ctrl + D」を押してください\e[0m"
  memo_content = readlines
  file.puts(memo_content)
  file.close()
  
  puts "\n\e[44m新規ファイル「#{file_name}.csv」を作成しました！\e[0m"
  status = 10
  
 elsif memo_type == 2
  puts "\e[44m編集したいファイル名を拡張子を除いて入力してください\e[0m"
  edit_file_name = gets.chomp
  edit_file = File.open("#{edit_file_name}.csv", "a+")
  
  puts "\e[44m現在のメモ：\e[0m"
  puts(edit_file.read())
  
  puts "\e[44m追加したい内容を入力してください\e[0m"
  puts "\e[44m入力し終えたら「ctrl + D」を押してください\e[0m"
  memo_content = readlines
  edit_file.puts(memo_content)
  edit_file.close()
  
  puts "\n\e[44m「#{edit_file_name}.csv」を更新しました！\e[0m"
  status = 10
  
 else 
  puts "\e[44m1か2を入力してください。\e[0m"
 end
end
 