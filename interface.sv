//interface

interface intf #(parameter data_width=32)(input  bit clk,rst_n);
 logic cs;
  logic r_en;
  logic w_en;
  logic [data_width-1:0]data_in;
  logic [data_width-1:0]data_out;
  logic full;// full=1 when read_pointer==write_pointer  except msb bit
  logic empty;// empty=1 when write pointer==read_pointer
  
endinterface
