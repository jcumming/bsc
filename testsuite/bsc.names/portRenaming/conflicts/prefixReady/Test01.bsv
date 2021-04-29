
interface IFC#(type anyType);
 (*prefix = "" *)
 method Action start(anyType a, anyType b);
 method anyType result(anyType c);
 (*ready = "a" *)
 method ActionValue#(anyType) check(anyType d);
endinterface

typedef Bit#(5) Type;

(* synthesize *)
module mkDesign_01 (IFC#(Type));

  Reg#(Type) val <- mkReg(0);
  Reg#(Type) res <- mkReg(0);


  method Action start(a,b);
    val <= a;
    res <= b;
  endmethod

  method Type result(c);
     return res+c;
  endmethod

  method ActionValue#(Type) check(d);
    val <= val + 1;
    res <= res + 2;
	return res+d;
  endmethod

endmodule
