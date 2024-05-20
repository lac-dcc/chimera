// This program was cloned from: https://github.com/conboy/elec374-cpu
// License: MIT License

//rotate right
module ror(input wire[31:0] a, input wire[31:0] b, output wire [31:0] result);


    reg [31:0] stage0, stage1, stage2, stage3, stage4;

    always @(*) begin
        // Stage 0, shift by 0 or 1 bit
        if (b[0]) begin
            stage0 = {a[0], a[31:1]};
        end else begin
            stage0 = a;
        end

        // Stage 1, shift by 0 or 2 bits
        if (b[1]) begin
            stage1 = {stage0[1:0], stage0[31:2]};
        end else begin
            stage1 = stage0;
        end

        // Stage 2, shift by 0 or 4 bits
        if (b[2]) begin
            stage2 = {stage1[3:0], stage1[31:4]};
        end else begin
            stage2 = stage1;
        end

        // Stage 3, shift by 0 or 8 bits
        if (b[3]) begin
            stage3 = {stage2[7:0], stage2[31:8]};
        end else begin
            stage3 = stage2;
        end

        // Stage 4, shift by 0 or 16 bits
        if (b[4]) begin
            stage4 = {stage3[15:0], stage3[31:16]};
        end else begin
            stage4 = stage3;
        end

    end
    assign result = stage4;

endmodule

// Rotate Left
module rol(input wire[31:0] a, input wire[31:0] b, output wire [31:0] result);


    reg [31:0] stage0, stage1, stage2, stage3, stage4;

    always @(*) begin
        // Stage 0, shift by 0 or 1 bit
        if (b[0]) begin
            stage0 = {a[30:0], a[31]};
        end else begin
            stage0 = a;
        end

        // Stage 1, shift by 0 or 2 bits
        if (b[1]) begin
            stage1 = {stage0[29:0], stage0[31:30]};
        end else begin
            stage1 = stage0;
        end

        // Stage 2, shift by 0 or 4 bits
        if (b[2]) begin
            stage2 = {stage1[27:0], stage1[31:28]};
        end else begin
            stage2 = stage1;
        end

        // Stage 3, shift by 0 or 8 bits
        if (b[3]) begin
            stage3 = {stage2[23:0], stage2[31:24]};
        end else begin
            stage3 = stage2;
        end

        // Stage 4, shift by 0 or 16 bits
        if (b[4]) begin
            stage4 = {stage3[15:0], stage3[31:16]};
        end else begin
            stage4 = stage3;
        end

    end
    assign result = stage4;

endmodule

