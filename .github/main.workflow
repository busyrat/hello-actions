workflow "Hello world workflow" {
  resolves = [
    "Build",
  ]
  on = "push"
}

action "Deploy to GitHub Pages" {
  uses = "maxheld83/ghpages@v0.2.1"
  needs = ["Build"]
  env = {
    BUILD_DIR = "public/"
  }
  secrets = [
    "GH_PAT",
  ]
}

action "Build" {
  uses = "./custom-action"
  env = {
    NAME = "busyrat"
  }
  args = "\"Hello world, I'm $NAME!\""
}
