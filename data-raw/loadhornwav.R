hornwav <- audio::load.wave(
  base::system.file("extdata", "horn.wav", package = "horn"))

usethis::use_data(hornwav, internal = TRUE)
