// This program was cloned from: https://github.com/marceldobehere/goofy-cpu-verilog
// License: GNU Affero General Public License v3.0

module GoofyALU (
    input clk,
    input res,

    input alu0w,
    output [7:0] alu0o,
    input [7:0] alu0d,

    input alu1w,
    output [7:0] alu1o,
    input [7:0] alu1d,

    output alu_flag_ov_o,
    output alu_flag_eq_o,
    output alu_flag_hlt_o, 

    output [7:0] alu_out,

    input alu_add,
    input alu_add_ov,
    input alu_sub,
    input alu_sub_ov,
    input alu_and,
    input alu_or,
    input alu_not,
    input alu_cmp,
    input alu_hlt,
    input alu_flag_res
);
    reg [7:0] alu0 = 0;
    reg [7:0] alu1  = 0;
    reg [8:0] alu_temp  = 0;

    reg alu_flag_ov  = 0;
    reg alu_flag_eq  = 0;
    reg alu_flag_hlt = 0;

    assign alu0o = alu0;
    assign alu1o = alu1;

    assign alu_flag_ov_o  = alu_flag_ov;
    assign alu_flag_eq_o  = alu_flag_eq;
    assign alu_flag_hlt_o = alu_flag_hlt;

    initial begin
        alu0 = 0;
        alu1 = 0;
        alu_temp = 0;
        alu_flag_ov = 0;
        alu_flag_eq = 0;
        alu_flag_hlt = 0;
    end

    always @(posedge clk) begin
        if (alu0w) begin
            alu0 <= alu0d;
            $display("ALU> Setting alu0 to %h", alu0d);
        end
        if (alu1w) begin
            alu1 <= alu1d;
            $display("ALU> Setting alu1 to %h", alu1d);
        end
    end

    assign alu_out = (
        (alu_add ? (alu0 + alu1) : 0) |
        (alu_add_ov ? (alu0 + alu1 + alu_flag_ov) : 0) |
        (alu_sub ? (alu0 - alu1) : 0) |
        (alu_sub_ov ? (alu0 - alu1 - alu_flag_ov) : 0) |
        (alu_and ? (alu0 & alu1) : 0) |
        (alu_or ? (alu0 | alu1) : 0) |
        (alu_not ? (~alu0) : 0)
    );

    always @(negedge clk) begin
        if (alu_add) begin
            // will perform an 8 bit add and set the overflow flag if the result is greater than 255
            if (alu0 + alu1 > 255) begin
                alu_flag_ov <= 1;
            end
            //alu_out <= alu0 + alu1;
            $display("ALU> Performing add %h + %h = %h", alu0, alu1, alu0 + alu1);
        end
        if (alu_add_ov) begin
            // will perform an 8 bit add and add 1 to the result if the overflow flag is set and set the overflow flag if the result is greater than 255
            if (alu0 + alu1 + alu_flag_ov > 255) begin
                alu_flag_ov <= 1;
            end
            //alu_out <= alu0 + alu1 + alu_flag_ov;
            $display("ALU> Performing add_ov %h + %h = %h", alu0, alu1, alu0 + alu1 + alu_flag_ov);
        end
        if (alu_sub) begin
            // will perform an 8 bit sub and set the overflow flag if the result is less than 0
            if (alu0 - alu1 < 0) begin
                alu_flag_ov <= 1;
            end
            //alu_out <= alu0 - alu1;
            $display("ALU> Performing sub %h - %h = %h", alu0, alu1, alu0 - alu1);
        end
        if (alu_sub_ov) begin
            // will perform an 8 bit sub and subtract 1 from the result if the overflow flag is set and set the overflow flag if the result is less than 0
            if (alu0 - alu1 - alu_flag_ov < 0) begin
                alu_flag_ov <= 1;
            end
            //alu_out <= alu0 - alu1 - alu_flag_ov;
            $display("ALU> Performing sub_ov %h - %h = %h", alu0, alu1, alu0 - alu1 - alu_flag_ov);
        end
        if (alu_and) begin
            //alu_out <= alu0 & alu1;
            $display("ALU> Performing and %h & %h = %h", alu0, alu1, alu0 & alu1);
        end
        if (alu_or) begin
            //alu_out <= alu0 | alu1;
            $display("ALU> Performing or %h | %h = %h", alu0, alu1, alu0 | alu1);
        end
        if (alu_not) begin
            //alu_out <= ~alu0;
            $display("ALU> Performing not ~%h = %h", alu0, ~alu0);
        end
        if (alu_cmp) begin
            alu_flag_eq <= alu0 == alu1;
            $display("ALU> Performing cmp %h == %h = %h", alu0, alu1, alu0 == alu1);
        end
        if (alu_hlt) begin
            alu_flag_hlt <= 1;
            $display("ALU> Performing hlt");
        end
        if (alu_flag_res) begin
            alu_flag_ov <= 0;
            alu_flag_eq <= 0;
            alu_flag_hlt <= 0;
            $display("ALU> Resetting flags");
        end
    end

endmodule