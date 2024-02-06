firrtl.circuit "Verif" {
  firrtl.module @Verif(in %clock: !firrtl.clock, in %cond: !firrtl.uint<1>, in %enable: !firrtl.uint<1>) attributes {convention = #firrtl<convention scalarized>} {
    firrtl.assume %clock, %cond, %enable, "" : !firrtl.clock, !firrtl.uint<1>, !firrtl.uint<1>  {eventControl = 0 : i32, isConcurrent = false, format = "", guards = ["USE_UNR_ONLY_CONSTRAINTS"], name = "" }
  }
}
