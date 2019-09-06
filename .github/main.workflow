workflow "Hello world workflow" {
  on = "push"
  resolves = ["Echo", "Deploy to GitHub Pages"]
}

action "Echo" {
  uses = "./custom-action"
  env = {
    NAME = "busyrat"
  }
  args = "\"Hello world, I'm $NAME!\""
}

action "Deploy to GitHub Pages" {
  uses = "maxheld83/ghpages@v0.2.1"
  env = {
    BUILD_DIR = "public/"
  }
  secrets = ["GH_PAT"]
}
