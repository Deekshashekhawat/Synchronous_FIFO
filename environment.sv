//environment 

`include "transcation.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
generator gen;
driver driv;
monitor mon;
scoreboard scb;

mailbox gen2driv;
mailbox mon2scor;

virtual intf vif;

function new(virtual intf vif);
this.vif=vif;

gen2driv=new();
mon2scor=new();

gen=new(gen2driv);
driv=new(vif,gen2driv);
mon=new(vif,mon2scor);
scb=new(mon2scor);
endfunction

task pre_test();
driv.reset();
endtask

task test();
fork//all 4 will be executed parallaly when anyone of them will be completed after that post_test will start executing without waiting for all to complate
gen.main();
driv.main();
mon.main();
scb.main();
join_any
endtask

task post_test();
wait(gen.ended.triggered);
wait(gen.repeat_count==driv.no_of_transaction);
wait(gen.repeat_count==scb.no_of_transaction);
endtask

task run();
pre_test();
test();
post_test();
$finish;
endtask

endclass

