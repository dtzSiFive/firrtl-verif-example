// Generated by CIRCT firtool-1.64.0g20240203_01f73c9
module Verif(	// <stdin>:2:3
  input clock,	// <stdin>:2:27
        cond,	// <stdin>:2:53
        enable	// <stdin>:2:80
);

  always @(posedge clock) begin	// <stdin>:3:5
    if (enable)	// <stdin>:3:5
      cover__label: cover(cond);	// <stdin>:3:5
  end // always @(posedge)
endmodule
