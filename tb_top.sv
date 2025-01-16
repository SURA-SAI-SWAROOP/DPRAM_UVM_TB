`include "dpram.v"
`include "interface.sv"

module tb_top;
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  `include "transaction.sv"
  `include "my_sequence.sv"
  `include "my_sequencer.sv"
  `include "my_driver.sv"
  `include "my_monitor.sv"
  `include "my_agent.sv"
  `include "sb predictor.sv"
  `include "sb_comparator.sv"
  `include "my_scoreboard.sv
  `include "my env.sv"
  `include "base test.sv"
  
  bit clk, reset:
  
  my_if vif(.clk(clk),.reset(reset));
  dpram dut(.clk(clk),.reset(reset),.we(vif.we),.re(vif.re),.waddr(vif.waddr),.raddr(vif.raddr),.data_in(vif.data_in),.data_out(vif.data_out));
  
  initial begin
    uvm_config_db#(virtual my_if)::set(uvm_root::get(),"*","vif",vif);
  end
    
  initial begin
    clk=0; reset=1;
    #10;
    reset=0;
  end

  always #5 clk<=~clk;
  
  initial begin
    run_test("base_test");
  end
endmodule
