// This program was cloned from: https://github.com/kevinwguan/tt06-SAP-1_Computer-
// License: Apache License 2.0

`default_nettype none
`timescale 1ns/1ps
module sap_1(
	input clk,  // Clock input
	input rst,  // Reset input
	output [7:0] bus_out  // Bus output
);

    reg[7:0] bus;
    reg[7:0] bus_reg;
    
    
    wire hlt;
    wire int_clk;
    clock clock(
    	.hlt(hlt),
    	.clk_in(clk),
    	.clk_out(int_clk)
    );
    
    wire pc_inc;
    wire pc_en;
    wire[7:0] pc_out;
    pc pc(
    	.clk(int_clk),
    	.rst(rst),
    	.inc(pc_inc),
    	.out(pc_out)
    );
    
    wire mar_load;
    wire mem_en;
    wire[7:0] mem_out;
    memory mem(
    	.clk(int_clk),
    	.rst(rst),
    	.load(mar_load),
    	.bus(bus_reg),
    	.out(mem_out)
    );
    
    wire a_load;
    wire a_en;
    wire[7:0] a_out;
    reg_a reg_a(
    	.clk(int_clk),
    	.rst(rst),
    	.load(a_load),
    	.bus(bus_reg),
    	.out(a_out)
    );
    
    wire b_load;
    wire[7:0] b_out;
    reg_b reg_b(
    	.clk(int_clk),
    	.rst(rst),
    	.load(b_load),
    	.bus(bus_reg),
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
    
    // New multiplier module instance
    wire multiplier_en;
    wire[7:0] multiplier_out;
    multiplier multiplier(
        .a(a_out),
        .b(b_out),
        .out(multiplier_out)
    );
    
    // New divider module instance
    wire divider_en;
    wire[7:0] divider_out;
    divider divider(
        .a(a_out),
        .b(b_out),
        .out(divider_out)
    );
    
    wire ir_load;
    wire ir_en;
    wire[7:0] ir_out;
    ir ir(
    	.clk(int_clk),
    	.rst(rst),
    	.load(ir_load),
    	.bus(bus_reg),
    	.out(ir_out)
    );
    
    controller controller(
    	.clk(int_clk),
    	.rst(rst),
    	.opcode(ir_out[7:4]),
    	.out({
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
            adder_en,
            multiplier_en,  // Added control signal for multiplier
            divider_en      // Added control signal for divider
        })
    );
    
    always @(*) begin
    	if (ir_en) begin
    		bus = ir_out;
    	end else if (adder_en) begin
    		bus = adder_out;
    	end else if (multiplier_en) begin  // Added for multiplier output
            bus = multiplier_out;
        end else if (divider_en) begin  // Added for divider output
            bus = divider_out;
        end else if (a_en) begin
    		bus = a_out;
    	end else if (mem_en) begin
    		bus = mem_out;
    	end else if (pc_en) begin
    		bus = pc_out;
    	end else begin
    		bus = 8'b0;
    	end
    end
    
    always @(posedge clk) begin
           if (rst) begin
               bus_reg <= 8'b0;
           end else begin
               bus_reg <= bus; // Pipelining the bus
           end
    end

    assign bus_out = bus_reg;

endmodule
