
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2026 07:59:44 PM
// Design Name: 
// Module Name: fifo_sync
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


// Code your design here
// synchronous fifo design

module fifo_sync #(parameter fifo_depth=8,parameter data_width=32)(
  
  input cs,//chip select
  input clk,//single clock only
  input rst_n,// neagtive reset
  input r_en,
  input w_en,
  input [data_width-1:0]data_in,
  output reg [data_width-1:0]data_out,
  output full,// full=1 when read_pointer==write_pointer  except msb bit
  output empty// empty=1 when write pointer==read_pointer
  
  );
  
  localparam fifo_depth_log=$clog2(fifo_depth);// how many bits or states or flip-flop required 
  
 //read and write pointer with one extra bit 
  reg [fifo_depth_log:0]rd_p;
  reg [fifo_depth_log:0]wr_p;
  
  //fifo memory array
  reg [data_width-1:0]fifo[fifo_depth-1:0];
  
  //write operation
  always@(posedge clk or negedge rst_n) begin
    if(!rst_n) wr_p<='b0;
    else if(cs&&w_en&&!full) begin
      fifo[wr_p[fifo_depth_log-1:0]]<=data_in;
      wr_p<=wr_p+1'b1;
    end
  end
  
  //read operation
  always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
    rd_p<='b0;
    data_out <= 'b0; end
    else if(cs&&r_en&&!empty) begin
      data_out<=fifo[rd_p[fifo_depth_log-1:0]];
      rd_p<=rd_p+1'b1;
    end
  end
  
  
  //empty flag
  assign empty=(wr_p==rd_p);
  
  
  //full flag
  assign full=(wr_p=={~rd_p[fifo_depth_log],rd_p[fifo_depth_log-1:0]});
  
endmodule
