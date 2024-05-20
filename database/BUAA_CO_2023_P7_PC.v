// This program was cloned from: https://github.com/Qin-shihuang/BUAA_CO_2023
// License: MIT License

module PC (
    input wire req,
    input wire D_eret,
    input wire [31:0] EPC,
    output wire F_Exc_AdEL,

    input wire clk,
    input wire rst,
    input wire WE,
    input wire [31:0] NPC,
    output wire [31:0] PC
);
    /*
        Program Counter
        Address space: 0x00003000-0x00006FFF
    */
    initial begin
        temp_PC = 32'h00003000;
    end

    assign F_Exc_AdEL = !(
        temp_PC[1:0] == 2'b00 && temp_PC >= 32'h00003000 && temp_PC <= 32'h00006ffc 
    ) && !D_eret;

    assign PC = D_eret ? EPC : temp_PC;

    reg [31:0] temp_PC;
    always @(posedge clk) begin
        if (rst) begin
            temp_PC <= 32'h00003000;
        end 
        else if (WE | req) begin
            temp_PC <= NPC;
        end
    end
endmodule