import Connectable::*;
import RegisteredSender::*;
import EnabledReceiver::*;

(*synthesize*)
module sysRegEnConnect2(Empty);
   RegisteredSender_ifc send <- mkRegisteredSender;
   EnabledReceiver_ifc recv <- mkEnabledReceiver;
   mkConnection(send.iioo, recv.iioo);  //flip me
   Reg#(int) count <- mkReg(0);
   rule increment;
      count <= count + 1;
      send.set(count);
   endrule

   rule disp (count>0);
      recv.display_it;
   endrule

   rule stop (count==10);
      $finish(0);
   endrule

endmodule
