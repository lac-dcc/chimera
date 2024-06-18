// This program was cloned from: https://github.com/namberino/vsap-1
// License: BSD 2-Clause "Simplified" License

module top_design_tb();

    initial begin
        $dumpfile("top_design_tb.vcd");
        $dumpvars(0, top_design_tb);

        // pulse reset signal
        rst = 1;
        #1
        rst = 0;
    end

    // multiplexer
    wire[4:0] bus_en = {pc_en, mem_en, ir_en, a_en, adder_en};
    reg[7:0] bus;
    always @ (*) 
    begin
        case (bus_en)
            5'b00001: bus = adder_out;
            5'b00010: bus = a_out;
            5'b00100: bus = ir_out;
            5'b01000: bus = mem_out;
            5'b10000: bus = pc_out;
            default: bus = 8'b0;
        endcase
    end

    // clock signal
    reg clk_in = 0;
    integer i;
    initial begin
        for (i = 0; i < 128; i++)
        begin
            #1
            clk_in = ~clk_in;
        end
    end

    // clock module
    wire clk;
    wire hlt;
    reg rst;
    clock clock(
        .hlt(hlt),
        .clk_in(clk_in),
        .clk_out(clk)
    );

    // program counter
    wire pc_inc;
    wire pc_en;
    wire[7:0] pc_out;
    pc pc(
        .clk(clk),
        .rst(rst),
        .inc(pc_inc),
        .out(pc_out)
    );

    wire mar_load;
    wire mem_en;
    wire[7:0] mem_out;
    memory mem(
        .clk(clk),
        .rst(rst),
        .load(mar_load),
        .bus(bus),
        .out(mem_out)
    );


    wire a_load;
    wire a_en;
    wire[7:0] a_out;
    reg_a reg_a(
        .clk(clk),
        .rst(rst),
        .load(a_load),
        .bus(bus),
        .out(a_out)
    );


    wire b_load;
    wire[7:0] b_out;
    reg_b reg_b(
        .clk(clk),
        .rst(rst),
        .load(b_load),
        .bus(bus),
        .out(b_out)
    );


    wire adder_sub;
    wire adder_en;
    wire[7:0] adder_out;
    adder adder(
        .a(a_out),
        .b(b_out),
        .sub(adder_sub),
        .out(adder_out)
    );


    wire ir_load;
    wire ir_en;
    wire[7:0] ir_out;
    ir ir(
        .clk(clk),
        .rst(rst),
        .load(ir_load),
        .bus(bus),
        .out(ir_out)
    );

    controller controller(
        .clk(clk),
        .rst(rst),
        .opcode(ir_out[7:4]),
        .out(
        {
            hlt,
            pc_inc,
            pc_en,
            mar_load,
            mem_en,
            ir_load,
            ir_en,
            a_load,
            a_en,
            b_load,
            adder_sub,
            adder_en
        })
    );

endmodule
