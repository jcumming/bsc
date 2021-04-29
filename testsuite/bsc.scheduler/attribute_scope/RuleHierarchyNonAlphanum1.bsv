module mkSub (Reg#(UInt#(16)) rg, Empty ifc);
   rule r1;
      rg <= rg + 2;
   endrule
endmodule

(* synthesize *)
module sysRuleHierarchyNonAlphanum1 ();
   Reg#(UInt#(16)) rg <- mkRegU;

   Empty \s@ <- mkSub(rg);

   (* descending_urgency = "\\s@_r1 , r2" *)
   rule r2;
      rg <= rg + 1;
   endrule

endmodule

