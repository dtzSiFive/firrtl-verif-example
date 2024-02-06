firrtl.circuit "Verif" {
  firrtl.module @Verif(in %clock: !firrtl.clock, in %cond: !firrtl.uint<1>, in %enable: !firrtl.uint<1>) attributes {convention = #firrtl<convention scalarized>} {
    firrtl.assert %clock, %cond, %enable, "message" : !firrtl.clock, !firrtl.uint<1>, !firrtl.uint<1>  {eventControl = 0 : i32, isConcurrent = true, format = "", guards = ["USE_UNR_ONLY_CONSTRAINTS"], name = "label" }
  }
}
