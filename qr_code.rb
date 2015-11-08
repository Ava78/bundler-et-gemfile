require 'rqrcode_png'
require 'pry'
require 'date'

puts 'Au p\'tit bijour, veuillez saisir vot tixt si you plé:'
reponse = gets.chomp

qr = RQRCode::QRCode.new( reponse, :size => 4, :level => :h )
ma_date = Time.now
# Enregistre le QRcode
png = qr.to_img
png.resize(120, 120).save("#{ma_date.strftime(('Le %d-%m-%Y à %H:%M'))}.png")

# Affiche dans le terminal
qr.modules.each do |row|
	row.each do |col| 
		print col ? "X" : " "
		end
	print "\n"
end
