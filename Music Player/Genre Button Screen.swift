import UIKit
import MediaPlayer

class Genre_Button_Screen: UIViewController {
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    //Plays music only in App
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func genreButtonTapped(_ sender: UIButton) {
        //check for media permission
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized{
                //Now, when the Pop button is tapped, the genre passed will be Pop.
                self.playGenere(genre: sender.currentTitle!)
            }
        }

    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        musicPlayer.stop()
    
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    
    func playGenere(genre: String){
        //first thing we do is stop the music players
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
}
