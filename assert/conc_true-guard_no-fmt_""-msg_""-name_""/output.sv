// Generated by CIRCT firtool-1.64.0g20240203_01f73c9
module Verif(	// <stdin>:2:3
  input clock,	// <stdin>:2:27
        cond,	// <stdin>:2:53
        enable	// <stdin>:2:80
);

  wire _GEN = ~enable | cond;	// <stdin>:3:5
  assert property (@(posedge clock) _GEN);	// <stdin>:3:5
  `ifdef USE_PROPERTY_AS_CONSTRAINT	// <stdin>:3:5
    assume property (@(posedge clock) _GEN);	// <stdin>:3:5
  `endif // USE_PROPERTY_AS_CONSTRAINT
endmodule
