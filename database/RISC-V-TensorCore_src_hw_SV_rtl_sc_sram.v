// This program was cloned from: https://github.com/stillwater-sc/RISC-V-TensorCore
// License: MIT License

module sc_sram (
  input logic clk,
  input logic nrst,
  input logic we,
  //input logic re,
  //input logic[7:0] raddr,
  input logic[4:0] addr,
  input logic[31:0] wdata,
  output logic[31:0] rdata
);
  
  logic[31:0] mem [31:0]; //Define memory of size to hold 8 elements of 32 VRs
  
  always_ff @(posedge clk, negedge nrst) begin
    if(!nrst) begin
      rdata <= 32'd0;
    end
    
    else if (we == 1'b1) begin
      mem[addr] <= wdata;
      rdata	 <= rdata;
    end
    
    else if (we == 1'b0) begin
      rdata	<= mem[addr];
    end
    
    else begin
      rdata	<= rdata;
    end
    
  end
endmodule


      
      
      