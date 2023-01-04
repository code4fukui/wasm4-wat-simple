(module
  (import "env" "blit" (func $blit (param i32 i32 i32 i32 i32 i32)))
  (import "env" "blitSub" (func $blitSub (param i32 i32 i32 i32 i32 i32 i32 i32 i32)))
  (import "env" "line" (func $line (param i32 i32 i32 i32)))
  (import "env" "hline" (func $nline (param i32 i32 i32)))
  (import "env" "vline" (func $vline (param i32 i32 i32)))
  (import "env" "oval" (func $oval (param i32 i32 i32 i32)))
  (import "env" "rect" (func $rect (param i32 i32 i32 i32)))
  (import "env" "textUtf8" (func $textUtf8 (param i32 i32 i32 i32)))
  (import "env" "traceUtf8" (func $traceUtf8 (param i32 i32)))
  (import "env" "tone" (func $tone (param i32 i32 i32 i32)))
  (import "env" "diskr" (func $diskr (param i32 i32) (result i32)))
  (import "env" "diskw" (func $diskw (param i32 i32) (result i32)))
  (import "env" "memory" (memory 1))

  (export "start" (func $start))
  (func $start
  )

  (data (i32.const 0) "WASM-4 in WAT")
  (global $cnt (mut i32) (i32.const 0))

  (export "update" (func $update))
  (func $update
    (i32.store16 (i32.const 0x14) (i32.const 3)) ;; DRAW_COLORS

    i32.const 10
    i32.const 10
    i32.const 32
    i32.const 32
    call $rect

    global.get $cnt
    i32.const 0
    i32.const 159
    i32.const 159
    call $line

    (global.set $cnt (i32.rem_s (i32.add (global.get $cnt) (i32.const 1)) (i32.const 160)))

    i32.const 0
    i32.const 13
    i32.const 10
    i32.const 1
    call $textUtf8
  )
)
