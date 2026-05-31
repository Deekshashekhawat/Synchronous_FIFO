
`timescale 1ns/1ps
//top module
module top();
bit clk;
bit rst_n;
bit cs=1;
initial clk=0;
always #5 clk=~clk;

initial begin 
rst_n=0;
#12 rst_n=1;
end

intf i_intf(clk,rst_n);

test t1(i_intf);

fifo_sync DUT(
.clk(i_intf.clk),
.rst_n(i_intf.rst_n),
.cs(i_intf.cs),
.w_en(i_intf.w_en),
.r_en(i_intf.r_en),
.data_in(i_intf.data_in),
.data_out(i_intf.data_out),
.full(i_intf.full),
.empty(i_intf.empty)
);

initial begin
$dumpfile("dump.vcd");
$dumpvars;
end
endmodule