// This program was cloned from: https://github.com/ic7x24/verilog-mini-demo
// License: MIT License

// ================================================================ 
// Verilog Mini Demo Project 
//  
// Licensed under the MIT License.
// 
// github  : https://github.com/ic7x24/verilog-mini-demo 
// ================================================================

module mini_sp_ram #(
    parameter ADDR_BITS=8
)(    
    input             clk,
    input      [ 7:0] addr,
    input      [ 7:0] din,
    input             ce,
    input             we,
    output reg [ 7:0] dout
);

localparam MEM_DEPTH= 1<<ADDR_BITS;

reg [7:0] mem[MEM_DEPTH-1:0];

// synopsys_translate_off
integer i;
initial begin
    for(i=0; i<MEM_DEPTH;i=i+1) begin
        mem[i] = 8'h00;
    end
end
// synopsys_translate_on

always @(posedge clk) begin
    if(ce & we) begin
        mem[addr] = din;
    end
end

always @(posedge clk) begin
    if(ce && (!we)) begin
        dout <= mem[addr];
    end
end

endmodule
