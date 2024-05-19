// This program was cloned from: https://github.com/TCL606/MipsPipeline
// License: MIT License

`timescale 1ns / 1ps
module BranchJudge(
    input wire [5:0] OpCode,
    input wire [31:0] data1_ID,
    input wire [31:0] data2_ID,
    input wire Branch,
    output reg Zero
);

    always@(*) begin
        if(Branch) begin
            if(OpCode == 6'h04) begin       // beq
                Zero <= data1_ID == data2_ID;
            end
            else if(OpCode == 6'h05) begin  // bne
                Zero <= data1_ID != data2_ID;
            end
            else if(OpCode == 6'h06) begin  // blez
                Zero <= (data1_ID <= data2_ID);
            end
            else if(OpCode == 6'h07) begin  // bgtz
                Zero <= (data1_ID > data2_ID);
            end
            else if(OpCode == 6'h01) begin  // bltz
                Zero <= (data1_ID < data2_ID);
            end
            else begin
                Zero <= Zero;
            end
        end
        else begin
            Zero <= 0;
        end
    end

endmodule