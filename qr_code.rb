require 'rqrcode_png'
require 'pry'

puts 'Au p\'tit bijour, veuillez saisir vot tixt si you plé:'
reponse = gets.chomp

qr = RQRCode::QRCode.new( reponse, :size => 4, :level => :h )

# Enregistre le QRcode
png = qr.to_img
png.resize(120, 120).save("reponse.png")

# Affiche dans le terminal
qr.modules.each do |row|
	row.each do |col| 
		print col ? "X" : " "
		end
	print "\n"
end
