// Generated by CIRCT firtool-1.64.0g20240203_01f73c9
module Verif(	// <stdin>:2:3
  input clock,	// <stdin>:2:27
        cond,	// <stdin>:2:53
        enable	// <stdin>:2:80
);

  `ifdef USE_UNR_ONLY_CONSTRAINTS	// <stdin>:3:5
    assume property (@(posedge clock) ~enable | cond) else $error("message");	// <stdin>:3:5
  `endif // USE_UNR_ONLY_CONSTRAINTS
endmodule
