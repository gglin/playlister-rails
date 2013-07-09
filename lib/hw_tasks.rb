
rap       = Genre.find_or_create_by_name("rap")
wutang    = Artist.find_or_create_by_name("Wu-Tang Clan")
thirtysix = Album.find_or_create_by_name("36 Chambers")

wutang.albums << thirtysix

s1 = Song.build(:name => "Bring da Ruckus").update_attributes(:artist => wutang, :genre => rap)
s1.save
thirtysix.songs << s1

s2 = Song.new(:name => "C.R.E.A.M").update_attributes(:artist => wutang, :genre => rap)
s2.save
thirtysix.songs << s2

s3 = thirtysix.build_song(:name => "Protect Ya Neck").update_attributes(:artist => wutang, :genre => rap)
s3.save

s4 = thirtysix.create_song(:name => "Method Man").update_attributes(:artist => wutang, :genre => rap)




biggie = Artist.find_or_create_by_name("Notorius B.I.G.")
