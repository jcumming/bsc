(* synthesize *)
module sysNoOp_LargerRes();

   Reg#(Bit#(2)) r_idx <- mkReg(0);

   rule r;
      // Value is larger
      Bit#(3) v;
      case (r_idx)
         0 : v = 0;
         1 : v = 1;
         2 : v = 2;
         default : v = 3;
      endcase
      $displayh(v);

      r_idx <= r_idx + 1;
      if (r_idx == 3)
         $finish(0);
   endrule

endmodule

