{:user {
        :plugins [[cider/cider-nrepl "0.9.1"]
                  [refactor-nrepl "1.1.0"]
                  [lein-midje "3.1.3"]]
        :dependencies [[org.clojure/tools.nrepl "0.2.7"]]
        :repl {:dependencies [[midje "1.7.0"]]}
        :repl-options {:init (use 'midje.repl)}}
        }
 }
