interface my_if (input clk, reset);
  logic we;
  logic re;
  logic[3:0]waddr;
  logic[3:0]raddr;
  logic [7:0] data_in;
  logic [7:0] data_out;
  
  clocking DRV@(posedge clk);
    default input #1 output #1;
    output we;
    output re;
    output waddr;
    output raddr;
    output data_in;
    input data_out;
  endclocking
    
  clocking MON@(posedge clk);
    default input #1 output #1;
    input we;
    input re;
    input waddr;
    input raddr;
    input data_in;
    input data_out;
    input reset;
  endclocking
    
  modport drv mod(clocking DRV, input clk, reset);
    modport mon_mod(clocking MON, input clk);
endinterface
