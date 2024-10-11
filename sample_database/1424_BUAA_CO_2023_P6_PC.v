// This program was cloned from: https://github.com/Qin-shihuang/BUAA_CO_2023
// License: MIT License

module PC (
    input wire clk,
    input wire rst,
    input wire WE,
    input wire [31:0] NPC,
    output reg [31:0] PC
);
    /*
        Program Counter
        Address space: 0x00003000-0x00006FFF
    */
    initial begin
        PC = 32'h00003000;
    end

    always @(posedge clk) begin
        if (rst) begin
            PC <= 32'h00003000;
        end 
        else if (WE) begin
            PC <= NPC;
        end
    end
endmodule