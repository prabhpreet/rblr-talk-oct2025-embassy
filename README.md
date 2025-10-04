# README

This presentation was created for Rust Bangalore meetup talks in July and October 2025.

Implements very rudimentary keyboard firmware(s) for ESP32C3 seed studio board and an emulated binary (spin executor) for desktop using Embassy.

The presentation walks through the async code, demonstrating some of Embassy internals and a code walkthrough from start to polling the futures. Other contrasting code can also be found (superloop with interrupts) in the git commit history.

## Run the emulated mode with spin executor

```
cd rblr-embassy-talk-code/asynckb-spin
cargo run
```

Use q to exit, keyboard arrow to select input switch and space to toggle input key press for the selected input switch

### Viewing traces

Traces will be generate in the current working directory with filename `embassy.perfetto.pftrace`. You can view them with [ui.perfetto.dev](https://ui.perfetto.dev/) with traces corresponding to names specified in `src/fw.rs`

## Run the firmware

You need to wire two physical buttons, two diodes in a matrix configuration. Checkout the code for input/output pin assignments.

```
cd rblr-embassy-talk-code/asynckb-esp
cargo run
```

## Accessing the presentation and code simultaneously

We use [presenterm](https://mfontanini.github.io/presenterm/install.html) to present a presentation in markdown and nvim to show the associated code.

Start with two terminal shells side-by-side (with Ghostty or [other supported terminals](https://mfontanini.github.io/presenterm/features/images.html) )

Assign a location for NVIM unix socket. Eg. in macOS:

```
export NVIM_SOCK=$TMPDIR/testsock
```

Then create an nvim session that listens to that socket

```
nvim --listen $NVIM_SOCK
```


In another shell, also set the same environment variable and run presenterm:

```
export NVIM_SOCK=$TMPDIR/testsock
presenterm -x -X main.md
```


In slides where `goto.sh` appears, you can run Ctrl + e to go to the referred code with git tag, file and line number.

## PDF

A generated PDF is also present in root as `main.pdf`

## Code

Code is present in the `rblr-embassy-talk-code` folder as a submodule. Be sure to recursively checkout/update as it contains further submodules. Git tags used by presentation to refer to revisions of code.

## Questions
Feel free to add an issue to discuss!
