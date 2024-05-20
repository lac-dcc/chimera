// This program was cloned from: https://github.com/KosugiSubaru/tt07-td4cpu
// License: Apache License 2.0

module register_ff_4bit(in, out, ld, clk, rst);
    input [3:0] in;
    input ld, clk, rst;
    output [3:0] out;

    reg [3:0] out;
    always @(posedge clk or negedge rst) begin
        if (rst ==1'b0) begin
            out <= 4'b0000;
        end else begin 
            if (ld == 1'b1) begin
                out <= in;
            end else if (ld == 1'b0) begin
                out <= out;
            end
        end
    end
endmodule

module ff_1bit(in, out, clk, rst, pr);
    input in;
    input clk, rst, pr;
    output out;

    reg out;
    always @(posedge clk or negedge rst) begin
        if (rst == 1'b0) begin
            out <= 0;
        end else begin
            if (pr == 1'b0) begin
                out <= 1;
            end else begin
                out <= in;
            end
        end
    end
endmodule

module pc(in, out, ld, clk, rst, co);
    input [3:0] in;
    input ld, clk, rst;
    output [3:0] out;
    output co;

    reg [3:0] out;
    reg co;
    always @(posedge clk or negedge rst) begin
        if (rst == 1'b0) begin
            out <= 4'b0000;
            co <= 1'b0;
        end else if (out == 4'b1111) begin
            co <= 1'b1;
        end else begin
            if (ld == 1'b1) begin
                out <= in;
            end else if (ld == 1'b0) begin
                out <= out + 4'b0001;
            end
        end
    end
endmodule

module ALU_adder_4bit(in_a, in_b, out, ci, co);
    input [3:0] in_a, in_b;
    input ci;
    output [3:0] out;
    output co;

    reg [3:0] out;
    reg co;
    always @(in_a or in_b or ci) begin
        {co, out} <= in_a + in_b + ci;
    end
endmodule

module decoder(op, c_n, s, ld_n);
    input [3:0] op;
    input c_n;
    output [1:0] s;
    output [3:0] ld_n;

    reg [1:0] s;
    reg [3:0] ld_n;
    always @(op or c_n) begin
        s [1] <= op[1];
        s [0] <= op[0] | op[3];
        ld_n[0] <= op[2] | op[3];
        ld_n[1] <= op[3] | ~(op[2] & 1 & 1);
        ld_n[2] <= ~(1 & ~(op[2] & 1 & 1) & op[3]);
        ld_n[3] <= ~(op[2] & op[3] & (op[0] | c_n));
    end
endmodule

module selector(in_a, in_b, in_c, in_d, s, out);
    input [3:0] in_a, in_b, in_c, in_d;
    input [1:0] s;
    output [3:0] out;

    reg [3:0] out; 
    always @(in_a or in_b or in_c or in_d or s) begin
        case (s)
            2'b00: out <= in_a;
            2'b01: out <= in_b;
            2'b10: out <= in_c;
            2'b11: out <= in_d;
            default: out <= 1'bx;
        endcase
    end
endmodule