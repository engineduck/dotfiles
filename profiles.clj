{:user {
        :plugins [[refactor-nrepl "1.1.0"]
                  [lein-midje "3.2"]]
        :dependencies [[org.clojure/tools.nrepl "0.2.7"]
                       [slamhound "1.5.5"]]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}
        }
 :repl {:plugins [[cider/cider-nrepl "0.9.1"]]}
 }
