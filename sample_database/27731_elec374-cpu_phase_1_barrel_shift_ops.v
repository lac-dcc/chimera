// This program was cloned from: https://github.com/conboy/elec374-cpu
// License: MIT License

// Logical Shift Right
module shr(input wire[31:0] a, input wire[31:0] b, output wire[31:0] result);

    reg [31:0] stage0, stage1, stage2, stage3, stage4;

    always @(*) begin
        // Stage 0, shift by 0 or 1 bit
        if (b[0]) begin
            stage0 = {1'b0, a[31:1]};
        end else begin
            stage0 = a;
        end

        // Stage 1, shift by 0 or 2 bits
        if (b[1]) begin
            stage1 = {2'b00, stage0[31:2]};
        end else begin
            stage1 = stage0;
        end

        // Stage 2, shift by 0 or 4 bits
        if (b[2]) begin
            stage2 = {4'b0000, stage1[31:4]};
        end else begin
            stage2 = stage1;
        end

        // Stage 3, shift by 0 or 8 bits
        if (b[3]) begin
            stage3 = {8'b00000000, stage2[31:8]};
        end else begin
            stage3 = stage2;
        end

        // Stage 4, shift by 0 or 16 bits
        if (b[4]) begin
            stage4 = {16'b0000000000000000, stage3[31:16]};
        end else begin
            stage4 = stage3;
        end

    end
    assign result = stage4;

endmodule


// Arithmetic shift right
module shra(input wire[31:0] a, input wire[31:0] b, output wire[31:0] result);

    reg [31:0] stage0, stage1, stage2, stage3, stage4;

    localparam  zeroes = 16'b1111111111111111;
    localparam  ones = 16'b0000000000000000;

 


    always @(*) begin
        // Stage 0, shift by 0 or 1 bit
        if (b[0]) begin
            stage0 = {a[31], a[31:1]};
        end else begin
            stage0 = a;
        end

        // Stage 1, shift by 0 or 2 bits
        if (b[1]) begin
            stage1 = {{2{a[31]}}, stage0[31:2]};
        end else begin
            stage1 = stage0;
        end

        // Stage 2, shift by 0 or 4 bits
        if (b[2]) begin
            stage2 = {{4{a[31]}}, stage1[31:4]};
        end else begin
            stage2 = stage1;
        end

        // Stage 3, shift by 0 or 8 bits
        if (b[3]) begin
            stage3 = {{8{a[31]}}, stage2[31:8]};
        end else begin
            stage3 = stage2;
        end

        // Stage 4, shift by 0 or 16 bits
        if (b[4]) begin
            stage4 = {{16{a[31]}}, stage3[31:16]};
        end else begin
            stage4 = stage3;
        end

    end
    assign result = stage4;

endmodule

// Logical Shift left 
module shl(input wire[31:0] a, input wire[4:0] b, output wire[31:0] result);

    reg [31:0] stage0, stage1, stage2, stage3, stage4;

    always @(*) begin
        // Stage 0, shift by 0 or 1 bit
        if (b[0]) begin
            stage0 = {a[30:0], 1'b0};
        end else begin
            stage0 = a;
        end

        // Stage 1, shift by 0 or 2 bits
        if (b[1]) begin
            stage1 = {stage0[29:0], 2'b00};
        end else begin
            stage1 = stage0;
        end

        // Stage 2, shift by 0 or 4 bits
        if (b[2]) begin
            stage2 = {stage1[27:0], 4'b0000};
        end else begin
            stage2 = stage1;
        end

        // Stage 3, shift by 0 or 8 bits
        if (b[3]) begin
            stage3 = {stage2[23:0], 8'b000000000};
        end else begin
            stage3 = stage2;
        end

        // Stage 4, shift by 0 or 16 bits
        if (b[4]) begin
            stage4 = {stage3[15:0], 16'b00000000000000000};
        end else begin
            stage4 = stage3;
        end

    end
    assign result = stage4;

endmodule