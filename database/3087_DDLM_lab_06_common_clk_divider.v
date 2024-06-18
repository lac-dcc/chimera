// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

// Clock divider module for lab demonstration

module clk_divider
#(
  parameter WIDTH = 24    
)
(
 input  clk_in,
 input  rst_n,
 output clk_out
);

  reg [WIDTH-1:0] cnt_div;
  
  always@(posedge clk_in or negedge rst_n)
  begin
    if(!rst_n)
      cnt_div <= {WIDTH{1'b0}};
    else
      cnt_div <= cnt_div + 1'b1;
  end
   
    assign clk_out = cnt_div[WIDTH-1];
   
endmodule
  
  
  
