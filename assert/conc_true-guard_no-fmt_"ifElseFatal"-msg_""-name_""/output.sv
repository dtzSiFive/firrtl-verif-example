// Generated by CIRCT firtool-1.64.0g20240203_01f73c9
// Standard header to adapt well known macros for prints and assertions.

// Users can define 'ASSERT_VERBOSE_COND' to add an extra gate to assert error printing.
`ifndef ASSERT_VERBOSE_COND_
  `ifdef ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ (`ASSERT_VERBOSE_COND)
  `else  // ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ 1
  `endif // ASSERT_VERBOSE_COND
`endif // not def ASSERT_VERBOSE_COND_

// Users can define 'STOP_COND' to add an extra gate to stop conditions.
`ifndef STOP_COND_
  `ifdef STOP_COND
    `define STOP_COND_ (`STOP_COND)
  `else  // STOP_COND
    `define STOP_COND_ 1
  `endif // STOP_COND
`endif // not def STOP_COND_

module Verif(	// <stdin>:2:3
  input clock,	// <stdin>:2:27
        cond,	// <stdin>:2:53
        enable	// <stdin>:2:80
);

  `ifndef SYNTHESIS	// <stdin>:3:5
    always @(posedge clock) begin	// <stdin>:3:5
      if (enable & ~cond) begin	// <stdin>:3:5
        if (`ASSERT_VERBOSE_COND_)	// <stdin>:3:5
          $error;	// <stdin>:3:5
        if (`STOP_COND_)	// <stdin>:3:5
          $fatal;	// <stdin>:3:5
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
endmodule
