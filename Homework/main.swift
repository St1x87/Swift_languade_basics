import Foundation

//Опишем класс из первого задания, метод которого может вернуть ошибку, и обработаем результат с помощью конструкции guard else
struct Song {
    let name: String
    let type: String
    let size: Int
}

class Playlist{
    var songs = [String: Song]()
    
    func addSong(_ name: String, _ song: Song) {
        songs[name] = song
    }
    
    func playSong(_ name: String) -> Song? {
        guard songs[name] != nil else {
            return nil
        }
        
        return songs[name]
    }
    
}

var newPlaylist = Playlist()
newPlaylist.addSong("SOAD", Song(name: "Chop suey", type: ".mp3", size: 6))
newPlaylist.addSong("Metallica", Song(name: "Enter sandman", type: ".mp3", size: 8))
newPlaylist.addSong("Slipknot", Song(name: "Before i forget", type: ".mp3", size: 8))
print(newPlaylist.playSong("Korn") as Any)


//Создадим копия класса, описанного выше, и реализуем в нем обработку ошибок с помощью throws-функций
enum playlistError: Error {
    case invalidType
    case moreSize
    case noNameSong
}

class popPlaylist{
    var songs = [String: Song]()
    
    let sizeSong = 10
    
    func addSong(_ name: String, _ song: Song) throws {
        guard song.size <= sizeSong else {
            throw playlistError.moreSize
        }
        guard song.type == ".mp3" else {
            throw playlistError.invalidType
        }
        songs[name] = song
    }
    
    func playSong(_ name: String) throws -> Song? {
        guard songs[name] != nil else {
            throw playlistError.noNameSong
        }
        
        return songs[name]
    }
    
}

var newPopPlaylist = popPlaylist()

do {
    try newPopPlaylist.addSong("Adele", Song(name: "Rolling in the Deep", type: ".mp3", size: 11))
}catch playlistError.moreSize {
    print("Слишком большой размер песни")
}catch playlistError.invalidType {
    print("Неверный формат песни")
}
print(newPopPlaylist.songs)

do {
    let popSong = try newPopPlaylist.playSong("BTS")
    print(popSong as Any)
}catch playlistError.noNameSong {
    print("Нет такой песни в плейлисте")
}
