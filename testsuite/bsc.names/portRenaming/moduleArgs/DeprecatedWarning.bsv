interface ModIfc;
  method Action foo();
  method Action bar();
endinterface

// This should generate a deprecated attribute warning
(* synthesize
 , CLK = "CK"
 *)
module sysDeprecatedWarning(Clock clk2, ModIfc ifc);

  Reg#(Bool) r1 <- mkReg(False);
  Reg#(Bool) r2 <- mkReg(True, clocked_by clk2, reset_by noReset);

  method Action foo();
    $display("Foo: %b", r1);
  endmethod

  method Action bar();
    $display("Bar: %b", r2);
  endmethod

endmodule