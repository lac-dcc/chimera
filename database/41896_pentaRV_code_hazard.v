// This program was cloned from: https://github.com/Rohan7Gupta/pentaRV
// License: Apache License 2.0

module hazard(clk,rst,PCsrcE, RegWriteM, RegWriteW, rdM, rdW, rs1E, rs2E, ForwardAE, ForwardBE, flush);

    // Declaration of I/Os
    input clk, PCsrcE, rst, RegWriteM, RegWriteW;
    input [4:0] rdM, rdW, rs1E, rs2E;
    output [1:0] ForwardAE, ForwardBE;
    output reg flush;
    
    assign ForwardAE = (rst) ? 2'b00 : 
                       ((RegWriteM == 1'b1) & (rdM != 5'h00) & (rdM == rs1E)) ? 2'b10 :
                       ((RegWriteW == 1'b1) & (rdW != 5'h00) & (rdW == rs1E)) ? 2'b01 : 2'b00;
                       
    assign ForwardBE = (rst) ? 2'b00 : 
                       ((RegWriteM == 1'b1) & (rdM != 5'h00) & (rdM == rs2E)) ? 2'b10 :
                       ((RegWriteW == 1'b1) & (rdW != 5'h00) & (rdW == rs2E)) ? 2'b01 : 2'b00;

    always @(negedge clk) begin //flush
        flush <= PCsrcE;
    end
    always @(posedge clk) begin
        flush <= 1'b0;
    end

endmodule