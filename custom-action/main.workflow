workflow "Hello world workflow" {
    on = "push"
    resolves = ["Echo"]
}

action "Echo" {
    uses = "./custom-action"
    env = {
        NAME = "busyrat"
    }
    args = "\"Hello world, I'm $NAME!\""
}