getOS <- function() {
  if (.Platform$OS.type == "windows") {
    base::return("win")
  } else if (Sys.info()["sysname"] == "Darwin") {
    base::return("mac")
  } else if (.Platform$OS.type == "unix") {
    base::return("unix")
  }
  base::return("unknown")
}

playFileForNixBoi <-
  function(hornwavfile = base::system.file("extdata", "horn.wav", package = "horn")) {
    if (nchar(Sys.which("paplay")) >= 1) {
      cmd <- "paplay"
      args <- c()
    } else if (nchar(Sys.which("aplay")) >= 1) {
      cmd <- "aplay"
      args <- c("--buffer-time=48000", "-N", "-q")
    } else if (nchar(Sys.which("vlc")) >= 1) {
      cmd <- "vlc"
      args <- c(
        "-Idummy",
        "--no-loop",
        "--no-repeat",
        "--playlist-autostart",
        "--no-media-library",
        "--play-and-exit"
      )
    } else {
      base::stop("you need audio, *nix boi")
    }
    base::system2(
      cmd,
      c(args, hornwavfile),
      stdout = FALSE,
      stderr = FALSE,
      wait = FALSE
    )
  }

horn <- function(x) {
  base::on.exit(base::switch(
    getOS(),
    "mac" = audio::play.audioSample(hornwav),
    "win" = audio::play.audioSample(hornwav),
    "unix" = playFileForNixBoi(),
    "unknown" = base::stop("get a real OS")
  ))
  if(missing(x)){
    base::invisible(NULL)
  } else {
    base::return(x)
  }
}
