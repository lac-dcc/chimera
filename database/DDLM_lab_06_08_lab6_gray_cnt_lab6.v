// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module gray_cnt
#(
  parameter WIDTH = 4
  )
 (
  input                      clk,
  input                      rst_n,
  input                      enable,
  output reg [WIDTH - 1 : 0] gray 
 );

  reg [WIDTH - 1 : 0]       bin;
  wire [WIDTH - 1 : 0]      bin_inc;
  wire [WIDTH - 1 : 0]      bin_to_gray;
  
  always@(posedge clk or negedge rst_n)
    if(!rst_n)begin
      bin  <= 0;
      gray <= 0;
    end
    else if(enable)begin
      bin  <= bin_inc;
      gray <= bin_to_gray;
    end
  

  assign bin_inc     = bin + 1'b1;
  assign bin_to_gray = bin_inc ^ (bin_inc >> 1);
  
  
endmodule // gray_cnt
