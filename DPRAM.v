module dpram(
  input clk,reset,
  input [7:0]data_in,
  input [3:0]waddr,raddr,
  input we,re,
  output reg[7:0]data_out
);

  integer i;
  reg[7:0]mem[15:0];

  always@(posedge clk)begin
    if(reset)begin
      for(i=0;i<=15;i++)begin
        mem[i]<=8'h00;
      end
    end
    else begin
      if(we)begin
        mem[waddr]<=data_in;
      end
      if(re)begin
        data_out<=mem[raddr];
      end
    end
  end
endmodule
