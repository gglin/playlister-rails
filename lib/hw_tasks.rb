# https://gist.github.com/ashleygwilliams/5952482

# Entered sequentially into rails console


# WU-TANG

rap       = Genre.find_or_create_by_name("rap")
wutang    = Artist.find_or_create_by_name("Wu-Tang Clan")
thirtysix = Album.find_or_create_by_name("36 Chambers")

wutang.albums << thirtysix


thirtysix.songs.build(:name => "Bring da Ruckus").update_attributes(:artist => wutang, :genre => rap)
s1 = thirtysix.songs.last


s2 = Song.new(:name => "C.R.E.A.M")
s2.save
s2.update_attributes(:artist => wutang, :genre => rap)
thirtysix.songs << s2
wutang.songs << s2


s3 = thirtysix.songs.create(:name => "Protect Ya Neck")
s3.update_attributes(:artist => wutang, :genre => rap)
wutang.songs << s3


s4 = Song.create(:name => "Method Man") # can't save to db yet bc it requires artist and genre
s4.update_attributes(:artist => wutang, :genre => rap, :album => thirtysix)



# BIGGIE

s5     = Song.create(:name => "Gimme the Loot") # can't save to db yet bc it requires artist and genre
a1     = s5.build_album(:name => "Ready to Die")
a1.save
biggie = a1.create_artist(:name => "Notorious B.I.G.") # biggie has no album or songs?
s5.update_attributes(:artist => biggie, :genre => rap, :album => a1)


s6     = Song.create(:name => "Dead Wrong") # can't save to db yet
s6.artist_id = biggie.id
s6.genre_id  = rap.id
a2     = s6.create_album(:name => "Born Again")
a2.songs << s6


a3 = biggie.albums.build(:name => "Life After Death")
a3.save
s7 = a3.songs.build(:name => "Hypnotize")
s7.update_attributes(:artist => biggie, :genre => rap)


