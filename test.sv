//test program
`include "environment.sv"
program test(intf i_intf); 
//environment instance
environment env;

initial begin
//creating environment
env=new(i_intf);
env.gen.repeat_count=20;//it will generate 4 packets
env.run();//calling run of environment
end
endprogram
