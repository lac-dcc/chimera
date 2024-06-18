// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps

`include "../../HDL/computer/io/segcom.v"
`include "../../HDL/computer/sdram/sdram_core.v"

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:06:01 02/24/2024 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top(
        input clk,
        input rst_n,

        output sdram_clk,
        output sdram_cke,
        output sdram_cs_n,
        output sdram_ras_n,
        output sdram_cas_n,
        output sdram_we_n,
        output [1:0] sdram_ba,
        output [12:0] sdram_addr,
        output [1:0] sdram_dqm,
        inout [15:0] sdram_dq,

        output [7:0] hexdisplay_sel,
        output [7:0] hexdisplay_data
    );

    localparam DATA_BITS  = 16'd16;
    localparam BURST_BITS = 16'd10;
    localparam BURST_SIZE = 16'd128;

    wire sdram_clk_ref;

    sdram_pll sdram_pll0(
        .clk_in(clk),
        .clk_out(sdram_clk),
        .CLK_OUT2(sdram_clk_ref)
    );

    localparam OP_ADDR = 24'b0; 

    reg [DATA_BITS - 1 : 0] write_buffer;
    wire write_burst_req;                       // to sdram core
    wire [DATA_BITS - 1 : 0] write_burst_data;  // to sdram core
    wire [BURST_BITS - 1 : 0] write_burst_len;   // to sdram core
    wire write_burst_data_req;                  // from sdram core
    wire write_burst_data_finish;               // from sdram core

    reg [DATA_BITS - 1 : 0] read_buffer;
    wire read_burst_req;    // to sdram core
    wire [BURST_BITS - 1 : 0] read_burst_len;    // to sdram core
    wire [DATA_BITS - 1 : 0] read_burst_data;   // from sdram core
    wire read_burst_data_vaild;                 // from sdram core
    wire read_burst_data_finish;                // from sdram core   

    assign write_burst_data = write_buffer;
    assign write_burst_len = BURST_SIZE[BURST_BITS - 1 : 0];
    assign read_burst_len = BURST_SIZE[BURST_BITS - 1 : 0];

    localparam STATE_IDLE = 4'd0;
    localparam STATE_WRITE = 4'd1;
    localparam STATE_READ = 4'd2;
    reg [1:0] state;
    reg [31:0] tick_counter;

    reg write_burst_req_r;
    reg read_burst_req_r;

    always @(posedge sdram_clk_ref or negedge rst_n) begin
        if (!rst_n) begin
            tick_counter <= 0;
        end else begin
            if (tick_counter < 32'd100000000) begin 
                tick_counter <= tick_counter + 1;
            end else begin
                tick_counter <= 0;
            end
        end
    end

    always @(posedge sdram_clk_ref or negedge rst_n) begin
        if (!rst_n) begin
            state <= STATE_IDLE;
            write_burst_req_r <= 0;
            read_burst_req_r <= 0;

            write_buffer <= 16'd0;
            read_buffer <= 16'd0;
        end else begin
            case (state)
                STATE_IDLE: begin
                    if (tick_counter == 16'd0) begin
                        state <= STATE_WRITE;
                        write_burst_req_r <= 1;
                        write_buffer <= write_buffer + 1;
                    end
                end
                STATE_WRITE: begin
                    if (write_burst_data_finish) begin
                        state <= STATE_READ;
                        write_burst_req_r <= 0;
                        read_burst_req_r <= 1;
                    end
                end
                STATE_READ: begin
                    if (read_burst_data_vaild) begin
                        read_burst_req_r <= 0;
                        read_buffer <= read_burst_data;
                    end else if (read_burst_data_finish) begin
                        state <= STATE_IDLE;
                    end
                end
                default: begin
                    state <= STATE_IDLE;
                end
            endcase
        end
    end
    assign write_burst_req = write_burst_req_r;
    assign read_burst_req = read_burst_req_r;

    sdram_core sdram_core0(
        .clk(sdram_clk_ref),
        .rst(!rst_n),
        .sdram_cke(sdram_cke),
        .sdram_cs_n(sdram_cs_n),
        .sdram_ras_n(sdram_ras_n),
        .sdram_cas_n(sdram_cas_n),
        .sdram_we_n(sdram_we_n),
        .sdram_ba(sdram_ba),
        .sdram_addr(sdram_addr),
        .sdram_dqm(sdram_dqm),
        .sdram_dq(sdram_dq),

        .wr_burst_req(write_burst_req),
        .wr_burst_addr(OP_ADDR),
        .wr_burst_data(write_burst_data),
        .wr_burst_len(write_burst_len),
        .wr_burst_data_req(write_burst_data_req),
        .wr_burst_finish(write_burst_data_finish),

        .rd_burst_req(read_burst_req),
        .rd_burst_addr(OP_ADDR),
        .rd_burst_len(read_burst_len),
        .rd_burst_data(read_burst_data),
        .rd_burst_data_valid(read_burst_data_vaild),
        .rd_burst_finish(read_burst_data_finish)
    );

    // hex display
    reg [7:0] sel_temp;
	reg [7:0] data_temp;

    wire [7:0] segdata0;
	wire [7:0] segdata1;
	wire [7:0] segdata2;
	wire [7:0] segdata3;
	reg [9:0] segcounter;

    segcom hseg0(.val(read_buffer[3:0]), .data(segdata0));
	segcom hseg1(.val(read_buffer[7:4]), .data(segdata1));
	segcom hseg2(.val(read_buffer[11:8]), .data(segdata2));
	segcom hseg3(.val(read_buffer[15:12]), .data(segdata3));
	
	always @(posedge sdram_clk_ref or negedge rst_n) begin
        if (!rst_n) begin 
            sel_temp <= 0;
            data_temp <= 0;
            segcounter <= 0;
        end else begin
            segcounter <= segcounter + 2'b1;
            case (segcounter[9:8])
                2'b00: begin
                    sel_temp <= 8'b11111110;
                    data_temp <= segdata0;
                end
                2'b01: begin
                    sel_temp <= 8'b11111101;
                    data_temp <= segdata1;
                end
                2'b10: begin
                    sel_temp <= 8'b11111011;
                    data_temp <= segdata2;
                end
                2'b11: begin
                    sel_temp <= 8'b11110111;
                    data_temp <= segdata3;
                end
                default: begin
                    segcounter <= 0;
                end
            endcase
        end
	end

    assign hexdisplay_sel = sel_temp;
    assign hexdisplay_data = data_temp;

endmodule
