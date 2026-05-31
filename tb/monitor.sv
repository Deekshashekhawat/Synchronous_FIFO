//monitor class
`include "transcation.sv"
class monitor;
virtual intf vif;
mailbox mon2scor;

//constractor
function new(virtual intf vif,mailbox mon2scor);
this.vif=vif;
this.mon2scor=mon2scor;
endfunction

// main task

task main();
forever begin
transcation t;
t = new();
@(posedge vif.clk);//why??
wait(vif.cs);
t.w_en=vif.w_en;
t.r_en=vif.r_en;
t.data_in=vif.data_in;
@(posedge vif.clk); //why???
t.full=vif.full;
t.empty=vif.empty;
t.data_out=vif.data_out;
@(posedge vif.clk); //why??
mon2scor.put(t);
t.display("monitor");
end
endtask
endclass
