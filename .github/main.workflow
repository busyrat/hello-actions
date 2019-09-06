workflow "Hello world workflow" {
  resolves = [
    "Hello World",
  ]
  on = "push"
}

action "Deploy to GitHub Pages" {
  uses = "maxheld83/ghpages@v0.2.1"
  env = {
    BUILD_DIR = "public/"
  }
  secrets = [
    "GITHUB_TOKEN",
    "GH_PAT",
  ]
}

action "Hello World" {
  uses = "./custom-action"
  needs = ["Deploy to GitHub Pages"],
  env = {
    NAME = "busyrat"
  }
  args = "\"Hello world, I'm $NAME!\""
}
