// This program was cloned from: https://github.com/KosugiSubaru/tt07-td4cpu
// License: Apache License 2.0

module tt_um_TD4_Assy_KosugiSubaru(clk, rst_n, addres, data, cf, port_i, port_o, ena);
    input clk, rst_n;
    input [7:0] data;
    output [3:0] addres;
    output cf;
    input [3:0] port_i;
    output [3:0] port_o;

    input  wire       ena;      // always 1 when the design is powered, so you can ignore it

    wire [3:0] ALU_to_reg, sel_to_ALU;
    wire [3:0] regA_to_sel, regB_to_sel;
    wire [3:0] load, op, im;
    wire carry, cf, co_from_pc;
    wire [1:0] select;

    assign op = data[7:4], im = data[3:0];

    register_ff_4bit reg_A (.in(ALU_to_reg), .out(regA_to_sel), .ld(~load [0]), .clk(clk), .rst(~rst_n));
    register_ff_4bit reg_B (.in(ALU_to_reg), .out(regB_to_sel), .ld(~load[1]), .clk(clk), .rst(~rst_n));
    register_ff_4bit OUT   (.in(ALU_to_reg), .out(port_o), .ld(~load [2]), .clk(clk), .rst(~rst_n));

    pc       pc0  (.in(ALU_to_reg), .out(addres), .ld(~load [3]), .clk(clk), .rst(~rst_n), .co(co_from_pc));

    decoder  dec0 (.op(op), .c_n(~cf), .s(select), .ld_n(load));

    selector sel0 (.in_a(regA_to_sel), .in_b(regB_to_sel), .in_c(port_i), .in_d(4'b0000), .s(select), .out(sel_to_ALU));

    ff_1bit  cf0  (.in(carry), .out(cf), .clk(clk), .rst(~rst_n), .pr(1'b1));

    ALU_adder_4bit ALU0 (.in_a(sel_to_ALU), .in_b(im), .out(ALU_to_reg), .ci(1'b0), .co(carry));
    
endmodule
