////////////////////////////////////////////////////////////////////////////////
///
////////////////////////////////////////////////////////////////////////////////

package SimpleRam;

////////////////////////////////////////////////////////////////////////////////
///
////////////////////////////////////////////////////////////////////////////////

import RegFile :: * ;

////////////////////////////////////////////////////////////////////////////////
///
////////////////////////////////////////////////////////////////////////////////

interface SimpleRamIFC#(type addr_t, type data_t);
   method data_t read (addr_t addr);
   method Action write (addr_t addr, data_t data);
endinterface

module mkSimpleRam (SimpleRamIFC#(addr_t, data_t))
   provisos(Bits#(addr_t, saddr_t), Eq#(addr_t), Bounded#(addr_t),
	    Bits#(data_t, sdata_t), Eq#(data_t));

   RegFile#(addr_t , data_t) mem <- mkRegFile(minBound, maxBound);

   method data_t read (addr_t addr);
      return mem.sub(addr);
   endmethod

   method Action write (addr_t addr, data_t data);
      mem.upd(addr, data);
   endmethod

endmodule

endpackage

////////////////////////////////////////////////////////////////////////////////
///
////////////////////////////////////////////////////////////////////////////////