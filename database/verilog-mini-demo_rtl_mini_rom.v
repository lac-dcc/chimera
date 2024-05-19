// This program was cloned from: https://github.com/ic7x24/verilog-mini-demo
// License: MIT License

// ================================================================ 
// Verilog Mini Demo Project 
//  
// Licensed under the MIT License.
// 
// github  : https://github.com/ic7x24/verilog-mini-demo 
// ================================================================

module mini_rom (    
    input             clk,
    input      [ 7:0] addr,
    output reg [ 7:0] dout
);

always @(posedge clk) begin
    case(addr)
        8'h00: dout <= 8'h0A;
        8'h01: dout <= 8'h1A;
        8'h02: dout <= 8'h2A;
        8'h03: dout <= 8'h3A;
        8'h04: dout <= 8'h4A;
        8'h05: dout <= 8'h5A;
        8'h06: dout <= 8'h6A;
        8'h07: dout <= 8'h7A;
        8'h08: dout <= 8'h8A;
        8'h09: dout <= 8'h9A;
        8'h0A: dout <= 8'hAA;
        8'h0B: dout <= 8'hBA;
        8'h0C: dout <= 8'hCA;
        8'h0D: dout <= 8'hDA;
        8'h0E: dout <= 8'hEA;
        8'h0F: dout <= 8'hFA;

        8'h10: dout <= 8'h50;
        8'h11: dout <= 8'h51;
        8'h12: dout <= 8'h52;
        8'h13: dout <= 8'h53;
        8'h14: dout <= 8'h54;
        8'h15: dout <= 8'h55;
        8'h16: dout <= 8'h56;
        8'h17: dout <= 8'h57;
        8'h18: dout <= 8'h58;
        8'h19: dout <= 8'h59;
        8'h1A: dout <= 8'h5A;
        8'h1B: dout <= 8'h5B;
        8'h1C: dout <= 8'h5C;
        8'h1D: dout <= 8'h5D;
        8'h1E: dout <= 8'h5E;
        8'h1F: dout <= 8'h5F;

        default: dout <= 8'hff;
    endcase
end

endmodule
