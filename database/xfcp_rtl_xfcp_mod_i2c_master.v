/*

Copyright (c) 2017 Alex Forencich

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

// Language: Verilog 2001

`timescale 1ns / 1ps

/*
 * XFCP I2C master module
 */
module xfcp_mod_i2c_master #
(
    parameter XFCP_ID_TYPE = 16'h2C00,
    parameter XFCP_ID_STR = "I2C Master",
    parameter XFCP_EXT_ID = 0,
    parameter XFCP_EXT_ID_STR = "",
    parameter DEFAULT_PRESCALE = 1
)
(
    input  wire       clk,
    input  wire       rst,

    /*
     * XFCP upstream interface
     */
    input  wire [7:0] up_xfcp_in_tdata,
    input  wire       up_xfcp_in_tvalid,
    output wire       up_xfcp_in_tready,
    input  wire       up_xfcp_in_tlast,
    input  wire       up_xfcp_in_tuser,

    output wire [7:0] up_xfcp_out_tdata,
    output wire       up_xfcp_out_tvalid,
    input  wire       up_xfcp_out_tready,
    output wire       up_xfcp_out_tlast,
    output wire       up_xfcp_out_tuser,

    /*
     * I2C interface
     */
    input  wire       i2c_scl_i,
    output wire       i2c_scl_o,
    output wire       i2c_scl_t,
    input  wire       i2c_sda_i,
    output wire       i2c_sda_o,
    output wire       i2c_sda_t
);

localparam START_TAG = 8'hFF;
localparam RPATH_TAG = 8'hFE;
localparam I2C_REQ = 8'h2C;
localparam I2C_RESP = 8'h2D;
localparam ID_REQ = 8'hFE;
localparam ID_RESP = 8'hFF;

// ID ROM
localparam ID_ROM_SIZE = (XFCP_EXT_ID != 0 || XFCP_EXT_ID_STR != 0) ? 64 : 32;
reg [7:0] id_rom[ID_ROM_SIZE-1:0];

reg [5:0] id_ptr_reg = 6'd0, id_ptr_next;

integer i, j;

initial begin
    // init ID ROM
    for (i = 0; i < ID_ROM_SIZE; i = i + 1) begin
        id_rom[i] = 0;
    end

    // binary part
    {id_rom[1], id_rom[0]} = 16'h2C00 | (16'h00FF & XFCP_ID_TYPE); // module type

    // string part
    // find string length
    j = 0;
    for (i = 1; i <= 16; i = i + 1) begin
        if (j == i-1 && (XFCP_ID_STR >> (i*8)) > 0) begin
            j = i;
        end
    end

    // pack string
    for (i = 0; i <= j; i = i + 1) begin
        id_rom[i+16] = XFCP_ID_STR[8*(j-i) +: 8];
    end

    if (XFCP_EXT_ID != 0 || XFCP_EXT_ID_STR != 0) begin
        // extended ID

        // binary part
        j = -1;
        for (i = 0; i < 16; i = i + 1) begin
            if (j == i-1 && (XFCP_EXT_ID >> (i*8)) > 0) begin
                id_rom[i+32] = XFCP_EXT_ID[8*i +: 8];
            end
        end

        // string part
        // find string length
        j = 0;
        for (i = 1; i <= 16; i = i + 1) begin
            if (j == i-1 && (XFCP_EXT_ID_STR >> (i*8)) > 0) begin
                j = i;
            end
        end

        // pack string
        for (i = 0; i <= j; i = i + 1) begin
            id_rom[i+48] = XFCP_EXT_ID_STR[8*(j-i) +: 8];
        end
    end
end

localparam [3:0]
    STATE_IDLE = 4'd0,
    STATE_HEADER_1 = 4'd1,
    STATE_HEADER_2 = 4'd2,
    STATE_PROCESS = 4'd3,
    STATE_STATUS = 4'd4,
    STATE_PRESCALE_L = 4'd5,
    STATE_PRESCALE_H = 4'd6,
    STATE_COUNT = 4'd7,
    STATE_NEXT_CMD= 4'd8,
    STATE_WRITE_DATA = 4'd9,
    STATE_READ_DATA = 4'd10,
    STATE_WAIT_LAST = 4'd11,
    STATE_ID = 4'd12;

reg [3:0] state_reg = STATE_IDLE, state_next;

reg [7:0] count_reg = 8'd0, count_next;

reg last_cycle_reg = 1'b0;

reg [6:0] cmd_address_reg = 7'd0, cmd_address_next;
reg cmd_start_reg = 1'b0, cmd_start_next;
reg cmd_read_reg = 1'b0, cmd_read_next;
reg cmd_write_reg = 1'b0, cmd_write_next;
reg cmd_write_multiple_reg = 1'b0, cmd_write_multiple_next;
reg cmd_stop_reg = 1'b0, cmd_stop_next;
reg cmd_valid_reg = 1'b0, cmd_valid_next;
wire cmd_ready;

reg cmd_transaction_stop_reg = 1'b0, cmd_transaction_stop_next;

reg [7:0] data_in_reg = 8'd0, data_in_next;
reg data_in_valid_reg = 1'b0, data_in_valid_next;
wire data_in_ready;
reg data_in_last_reg = 1'b0, data_in_last_next;

wire [7:0] data_out;
wire data_out_valid;
reg data_out_ready_reg = 1'b0, data_out_ready_next;
wire data_out_last;

reg [15:0] prescale_reg = DEFAULT_PRESCALE, prescale_next;
reg stop_on_idle_reg = 1'b0, stop_on_idle_next;

reg missed_ack_reg = 1'b0, missed_ack_next;

reg up_xfcp_in_tready_reg = 1'b0, up_xfcp_in_tready_next;

// internal datapath
reg [7:0]  up_xfcp_out_tdata_int;
reg        up_xfcp_out_tvalid_int;
reg        up_xfcp_out_tready_int_reg = 1'b0;
reg        up_xfcp_out_tlast_int;
reg        up_xfcp_out_tuser_int;
wire       up_xfcp_out_tready_int_early;

assign up_xfcp_in_tready = up_xfcp_in_tready_reg;

always @* begin
    state_next = STATE_IDLE;

    count_next = count_reg;

    id_ptr_next = id_ptr_reg;

    cmd_address_next = cmd_address_reg;
    cmd_start_next = cmd_start_reg;
    cmd_read_next = cmd_read_reg;
    cmd_write_next = cmd_write_reg;
    cmd_write_multiple_next = cmd_write_multiple_reg;
    cmd_stop_next = cmd_stop_reg;
    cmd_valid_next = cmd_valid_reg & ~cmd_ready;

    cmd_transaction_stop_next = cmd_transaction_stop_reg;

    data_in_next = data_in_reg;
    data_in_valid_next = data_in_valid_reg & ~data_in_ready;
    data_in_last_next = data_in_last_reg;
    
    data_out_ready_next = 1'b0;
    
    prescale_next = prescale_reg;
    stop_on_idle_next = stop_on_idle_reg;

    missed_ack_next = missed_ack_reg | missed_ack;

    up_xfcp_in_tready_next = 1'b0;

    up_xfcp_out_tdata_int = 8'd0;
    up_xfcp_out_tvalid_int = 1'b0;
    up_xfcp_out_tlast_int = 1'b0;
    up_xfcp_out_tuser_int = 1'b0;

    case (state_reg)
        STATE_IDLE: begin
            // idle, wait for start of packet
            up_xfcp_in_tready_next = up_xfcp_out_tready_int_early;
            id_ptr_next = 5'd0;

            if (up_xfcp_in_tready & up_xfcp_in_tvalid) begin
                if (up_xfcp_in_tlast) begin
                    // last asserted, ignore cycle
                    state_next = STATE_IDLE;
                end else if (up_xfcp_in_tdata == RPATH_TAG) begin
                    // need to pass through rpath
                    up_xfcp_out_tdata_int = up_xfcp_in_tdata;
                    up_xfcp_out_tvalid_int = 1'b1;
                    up_xfcp_out_tlast_int = 1'b0;
                    up_xfcp_out_tuser_int = 1'b0;
                    state_next = STATE_HEADER_1;
                end else if (up_xfcp_in_tdata == START_TAG) begin
                    // process header
                    up_xfcp_out_tdata_int = up_xfcp_in_tdata;
                    up_xfcp_out_tvalid_int = 1'b1;
                    up_xfcp_out_tlast_int = 1'b0;
                    up_xfcp_out_tuser_int = 1'b0;
                    state_next = STATE_HEADER_2;
                end else begin
                    // bad start byte, drop packet
                    state_next = STATE_WAIT_LAST;
                end
            end else begin
                state_next = STATE_IDLE;
            end
        end
        STATE_HEADER_1: begin
            // transfer through header
            up_xfcp_in_tready_next = up_xfcp_out_tready_int_early;

            if (up_xfcp_in_tready & up_xfcp_in_tvalid) begin
                // transfer through
                up_xfcp_out_tdata_int = up_xfcp_in_tdata;
                up_xfcp_out_tvalid_int = 1'b1;
                up_xfcp_out_tlast_int = 1'b0;
                up_xfcp_out_tuser_int = 1'b0;

                if (up_xfcp_in_tlast) begin
                    // last asserted in header, mark as such and drop
                    up_xfcp_out_tuser_int = 1'b1;
                    state_next = STATE_IDLE;
                end else if (up_xfcp_in_tdata == START_TAG) begin
                    // process header
                    state_next = STATE_HEADER_2;
                end else begin
                    state_next = STATE_HEADER_1;
                end
            end else begin
                state_next = STATE_HEADER_1;
            end
        end
        STATE_HEADER_2: begin
            // read packet type
            up_xfcp_in_tready_next = up_xfcp_out_tready_int_early;

            if (up_xfcp_in_tready & up_xfcp_in_tvalid) begin
                if (up_xfcp_in_tdata == I2C_REQ & ~up_xfcp_in_tlast) begin
                    // start of read
                    up_xfcp_out_tdata_int = I2C_RESP;
                    up_xfcp_out_tvalid_int = 1'b1;
                    up_xfcp_out_tlast_int = 1'b0;
                    up_xfcp_out_tuser_int = 1'b0;
                    state_next = STATE_PROCESS;
                end else if (up_xfcp_in_tdata == ID_REQ) begin
                    // identify
                    up_xfcp_out_tdata_int = ID_RESP;
                    up_xfcp_out_tvalid_int = 1'b1;
                    up_xfcp_out_tlast_int = 1'b0;
                    up_xfcp_out_tuser_int = 1'b0;
                    state_next = STATE_ID;
                end else begin
                    // invalid
                    up_xfcp_out_tvalid_int = 1'b1;
                    up_xfcp_out_tlast_int = 1'b1;
                    up_xfcp_out_tuser_int = 1'b1;
                    if (up_xfcp_in_tlast) begin
                        state_next = STATE_IDLE;
                    end else begin
                        state_next = STATE_WAIT_LAST;
                    end
                end
            end else begin
                state_next = STATE_HEADER_2;
            end
        end
        STATE_PROCESS: begin
            // process commands
            up_xfcp_in_tready_next = up_xfcp_out_tready_int_early & ~cmd_valid_reg;

            up_xfcp_out_tdata_int = up_xfcp_in_tdata;
            up_xfcp_out_tvalid_int = up_xfcp_in_tready & up_xfcp_in_tvalid;
            up_xfcp_out_tlast_int = up_xfcp_in_tlast;
            up_xfcp_out_tuser_int = 1'b0;

            count_next = 8'd0;

            if (up_xfcp_in_tready & up_xfcp_in_tvalid) begin
                if (up_xfcp_in_tdata[7]) begin
                    // set address
                    cmd_address_next = up_xfcp_in_tdata[6:0];
                    state_next = STATE_PROCESS;
                end else if (up_xfcp_in_tdata[6]) begin
                    if (up_xfcp_in_tdata[5:0] == 6'b000000) begin
                        // status query
                        up_xfcp_in_tready_next = 1'b0;
                        up_xfcp_out_tlast_int = 1'b0;
                        state_next = STATE_STATUS;
                    end else if (up_xfcp_in_tdata[5:0] == 6'b100000) begin
                        // set prescale
                        up_xfcp_in_tready_next = up_xfcp_out_tready_int_early;
                        state_next = STATE_PRESCALE_L;
                    end else begin
                        state_next = STATE_PROCESS;
                    end
                end else begin
                    cmd_start_next = up_xfcp_in_tdata[0];
                    cmd_read_next = up_xfcp_in_tdata[1];
                    cmd_write_next = up_xfcp_in_tdata[2];
                    cmd_stop_next = up_xfcp_in_tdata[3];
                    cmd_valid_next = (cmd_start_next | cmd_read_next | cmd_write_next | cmd_stop_next);

                    cmd_transaction_stop_next = cmd_stop_next;

                    if (up_xfcp_in_tdata[4]) begin
                        cmd_stop_next = 1'b0;

                        if (up_xfcp_in_tlast) begin
                            // last cycle; return to idle
                            up_xfcp_in_tready_next = up_xfcp_out_tready_int_early;
                            state_next = STATE_IDLE;
                        end else begin
                            // read in count value
                            up_xfcp_in_tready_next = up_xfcp_out_tready_int_early;
                            state_next = STATE_COUNT;
                        end
                    end else if (cmd_write_next & ~cmd_read_next) begin
                        // write
                        if (up_xfcp_in_tlast) begin
                            // last cycle; return to idle
                            up_xfcp_in_tready_next = up_xfcp_out_tready_int_early;
                            state_next = STATE_IDLE;
                        end else begin
                            // start writing
                            up_xfcp_in_tready_next = up_xfcp_out_tready_int_early & ~data_in_valid_reg;
                            state_next = STATE_WRITE_DATA;
                        end
                    end else if (cmd_read_next & ~cmd_write_next) begin
                        // read
                        up_xfcp_in_tready_next = 1'b0;
                        up_xfcp_out_tlast_int = 1'b0;
                        state_next = STATE_READ_DATA;
                    end else begin
                        state_next = STATE_PROCESS;
                    end
                end
            end else begin
                state_next = STATE_PROCESS;
            end
        end
        STATE_STATUS: begin
            // read status
            up_xfcp_in_tready_next = 1'b0;

            up_xfcp_out_tdata_int[0] = busy;
            up_xfcp_out_tdata_int[1] = bus_control;
            up_xfcp_out_tdata_int[2] = bus_active;
            up_xfcp_out_tdata_int[3] = missed_ack_reg;
            up_xfcp_out_tdata_int[7:4] = 4'd0;
            up_xfcp_out_tvalid_int = 1'b1;
            up_xfcp_out_tlast_int = last_cycle_reg;
            up_xfcp_out_tuser_int = 1'b0;

            if (up_xfcp_out_tready_int_reg) begin
                missed_ack_next = missed_ack;

                if (last_cycle_reg) begin
                    // last cycle; return to idle
                    up_xfcp_in_tready_next = up_xfcp_out_tready_int_early;
                    state_next = STATE_IDLE;
                end else begin
                    // process next command
                    up_xfcp_in_tready_next = up_xfcp_out_tready_int_early & ~cmd_valid_reg;
                    state_next = STATE_PROCESS;
                end
            end else begin
                state_next = STATE_STATUS;
            end
        end
        STATE_PRESCALE_L: begin
            // store prescale value
            up_xfcp_in_tready_next = up_xfcp_out_tready_int_early;

            up_xfcp_out_tdata_int = up_xfcp_in_tdata;
            up_xfcp_out_tvalid_int = up_xfcp_in_tready & up_xfcp_in_tvalid;
            up_xfcp_out_tlast_int = up_xfcp_in_tlast;
            up_xfcp_out_tuser_int = 1'b0;

            if (up_xfcp_in_tready & up_xfcp_in_tvalid) begin
                prescale_next[7:0] = up_xfcp_in_tdata;

                if (up_xfcp_in_tlast) begin
                    // last cycle; return to idle
                    state_next = STATE_IDLE;
                end else begin
                    state_next = STATE_PRESCALE_H;
                end
            end else begin
                state_next = STATE_PRESCALE_L;
            end
        end
        STATE_PRESCALE_H: begin
            // store prescale value
            up_xfcp_in_tready_next = up_xfcp_out_tready_int_early;

            up_xfcp_out_tdata_int = up_xfcp_in_tdata;
            up_xfcp_out_tvalid_int = up_xfcp_in_tready & up_xfcp_in_tvalid;
            up_xfcp_out_tlast_int = up_xfcp_in_tlast;
            up_xfcp_out_tuser_int = 1'b0;

            if (up_xfcp_in_tready & up_xfcp_in_tvalid) begin
                prescale_next[15:8] = up_xfcp_in_tdata;

                if (up_xfcp_in_tlast) begin
                    // last cycle; return to idle
                    state_next = STATE_IDLE;
                end else begin
                    up_xfcp_in_tready_next = up_xfcp_out_tready_int_early & ~cmd_valid_reg;
                    state_next = STATE_PROCESS;
                end
            end else begin
                state_next = STATE_PRESCALE_H;
            end
        end
        STATE_COUNT: begin
            // store count value
            up_xfcp_in_tready_next = up_xfcp_out_tready_int_early;

            up_xfcp_out_tdata_int = up_xfcp_in_tdata;
            up_xfcp_out_tvalid_int = up_xfcp_in_tready & up_xfcp_in_tvalid;
            up_xfcp_out_tlast_int = up_xfcp_in_tlast;
            up_xfcp_out_tuser_int = 1'b0;

            if (up_xfcp_in_tready & up_xfcp_in_tvalid) begin
                count_next = up_xfcp_in_tdata;

                if (cmd_write_reg & ~cmd_read_reg) begin
                    // write
                    if (up_xfcp_in_tlast) begin
                        // last cycle; return to idle
                        up_xfcp_in_tready_next = up_xfcp_out_tready_int_early;
                        state_next = STATE_IDLE;
                    end else begin
                        // start writing
                        up_xfcp_in_tready_next = up_xfcp_out_tready_int_early & ~data_in_valid_reg;
                        state_next = STATE_WRITE_DATA;
                    end
                end else if (cmd_read_reg & ~cmd_write_reg) begin
                    // start reading
                    up_xfcp_in_tready_next = 1'b0;
                    up_xfcp_out_tlast_int = 1'b0;
                    state_next = STATE_READ_DATA;
                end else begin
                    // neither, process next command
                    if (up_xfcp_in_tlast) begin
                        // last cycle; return to idle
                        up_xfcp_in_tready_next = up_xfcp_out_tready_int_early;
                        state_next = STATE_IDLE;
                    end else begin
                        up_xfcp_in_tready_next = up_xfcp_out_tready_int_early & ~cmd_valid_reg;
                        state_next = STATE_PROCESS;
                    end
                end
            end else begin
                state_next = STATE_COUNT;
            end
        end
        STATE_NEXT_CMD: begin
            // next command

            if (~cmd_valid_reg) begin
                cmd_start_next = 1'b0;
                cmd_valid_next = 1'b1;

                count_next = count_reg - 1;

                if (count_reg == 2) begin
                    cmd_stop_next = cmd_transaction_stop_reg;
                end

                if (cmd_write_reg) begin
                    up_xfcp_in_tready_next = up_xfcp_out_tready_int_early & ~data_in_valid_reg;
                    state_next = STATE_WRITE_DATA;
                end else if (cmd_read_reg) begin
                    up_xfcp_in_tready_next = 1'b0;
                    state_next = STATE_READ_DATA;
                end
            end else begin
                state_next = STATE_NEXT_CMD;
            end
        end
        STATE_WRITE_DATA: begin
            // write data
            up_xfcp_in_tready_next = up_xfcp_out_tready_int_early & ~data_in_valid_reg;

            up_xfcp_out_tdata_int = up_xfcp_in_tdata;
            up_xfcp_out_tvalid_int = up_xfcp_in_tready & up_xfcp_in_tvalid;
            up_xfcp_out_tlast_int = up_xfcp_in_tlast;
            up_xfcp_out_tuser_int = 1'b0;

            if (up_xfcp_in_tready & up_xfcp_in_tvalid) begin
                data_in_next = up_xfcp_in_tdata;
                data_in_valid_next = 1'b1;

                if (up_xfcp_in_tlast) begin
                    up_xfcp_in_tready_next = up_xfcp_out_tready_int_early;
                    state_next = STATE_IDLE;
                end else begin
                    if (count_reg > 1) begin
                        up_xfcp_in_tready_next = 1'b0;
                        state_next = STATE_NEXT_CMD;
                    end else begin
                        up_xfcp_in_tready_next = up_xfcp_out_tready_int_early & ~cmd_valid_reg;
                        state_next = STATE_PROCESS;
                    end
                end
            end else begin
                state_next = STATE_WRITE_DATA;
            end
        end
        STATE_READ_DATA: begin
            // read data
            up_xfcp_in_tready_next = 1'b0;
            data_out_ready_next = up_xfcp_out_tready_int_early;

            up_xfcp_out_tdata_int = data_out;
            up_xfcp_out_tvalid_int = data_out_valid;
            up_xfcp_out_tlast_int = last_cycle_reg;
            up_xfcp_out_tuser_int = 1'b0;

            if (data_out_ready_reg & data_out_valid) begin
                if (count_reg > 1) begin
                    up_xfcp_out_tlast_int = 1'b0;
                    up_xfcp_in_tready_next = 1'b0;
                    state_next = STATE_NEXT_CMD;
                end else begin
                    if (last_cycle_reg) begin
                        up_xfcp_in_tready_next = up_xfcp_out_tready_int_early;
                        state_next = STATE_IDLE;
                    end else begin
                        up_xfcp_in_tready_next = up_xfcp_out_tready_int_early & ~cmd_valid_reg;
                        state_next = STATE_PROCESS;
                    end
                end
            end else begin
                state_next = STATE_READ_DATA;
            end
        end
        STATE_ID: begin
            // send ID

            // drop padding
            up_xfcp_in_tready_next = !(last_cycle_reg || (up_xfcp_in_tvalid & up_xfcp_in_tlast));

            up_xfcp_out_tdata_int = id_rom[id_ptr_reg];
            up_xfcp_out_tvalid_int = 1'b1;
            up_xfcp_out_tlast_int = 1'b0;
            up_xfcp_out_tuser_int = 1'b0;

            if (up_xfcp_out_tready_int_reg) begin
                id_ptr_next = id_ptr_reg + 1;
                if (id_ptr_reg == ID_ROM_SIZE-1) begin
                    up_xfcp_out_tlast_int = 1'b1;
                    if (!(last_cycle_reg || (up_xfcp_in_tvalid & up_xfcp_in_tlast))) begin
                        state_next = STATE_WAIT_LAST;
                    end else begin
                        up_xfcp_in_tready_next = up_xfcp_out_tready_int_early;
                        state_next = STATE_IDLE;
                    end
                end else begin
                    state_next = STATE_ID;
                end
            end else begin
                state_next = STATE_ID;
            end
        end
        STATE_WAIT_LAST: begin
            // wait for end of frame
            up_xfcp_in_tready_next = 1'b1;

            if (up_xfcp_in_tready & up_xfcp_in_tvalid) begin
                if (up_xfcp_in_tlast) begin
                    up_xfcp_in_tready_next = up_xfcp_out_tready_int_early;
                    state_next = STATE_IDLE;
                end else begin
                    state_next = STATE_WAIT_LAST;
                end
            end else begin
                state_next = STATE_WAIT_LAST;
            end
        end
    endcase
end

always @(posedge clk) begin
    state_reg <= state_next;

    id_ptr_reg <= id_ptr_next;

    count_reg <= count_next;

    if (up_xfcp_in_tready & up_xfcp_in_tvalid) begin
        last_cycle_reg <= up_xfcp_in_tlast;
    end

    cmd_address_reg <= cmd_address_next;
    cmd_start_reg <= cmd_start_next;
    cmd_read_reg <= cmd_read_next;
    cmd_write_reg <= cmd_write_next;
    cmd_write_multiple_reg <= cmd_write_multiple_next;
    cmd_stop_reg <= cmd_stop_next;
    cmd_valid_reg <= cmd_valid_next;

    cmd_transaction_stop_reg <= cmd_transaction_stop_next;

    data_in_reg <= data_in_next;
    data_in_valid_reg <= data_in_valid_next;
    data_in_last_reg <= data_in_last_next;

    data_out_ready_reg <= data_out_ready_next;

    prescale_reg <= prescale_next;
    stop_on_idle_reg <= stop_on_idle_next;

    missed_ack_reg <= missed_ack_next;

    up_xfcp_in_tready_reg <= up_xfcp_in_tready_next;

    if (rst) begin
        state_reg <= STATE_IDLE;
        cmd_address_reg <= 7'd0;
        cmd_valid_reg <= 1'b0;
        data_in_valid_reg <= 1'b0;
        data_out_ready_reg <= 1'b0;
        prescale_reg <= DEFAULT_PRESCALE;
        stop_on_idle_reg <= 1'b0;
        missed_ack_reg <= 1'b0;
        up_xfcp_in_tready_reg <= 1'b0;
    end
end

// output datapath logic
reg [7:0]  up_xfcp_out_tdata_reg = 8'd0;
reg        up_xfcp_out_tvalid_reg = 1'b0, up_xfcp_out_tvalid_next;
reg        up_xfcp_out_tlast_reg = 1'b0;
reg        up_xfcp_out_tuser_reg = 1'b0;

reg [7:0]  temp_up_xfcp_tdata_reg = 8'd0;
reg        temp_up_xfcp_tvalid_reg = 1'b0, temp_up_xfcp_tvalid_next;
reg        temp_up_xfcp_tlast_reg = 1'b0;
reg        temp_up_xfcp_tuser_reg = 1'b0;

// datapath control
reg store_up_xfcp_int_to_output;
reg store_up_xfcp_int_to_temp;
reg store_up_xfcp_temp_to_output;

assign up_xfcp_out_tdata = up_xfcp_out_tdata_reg;
assign up_xfcp_out_tvalid = up_xfcp_out_tvalid_reg;
assign up_xfcp_out_tlast = up_xfcp_out_tlast_reg;
assign up_xfcp_out_tuser = up_xfcp_out_tuser_reg;

// enable ready input next cycle if output is ready or the temp reg will not be filled on the next cycle (output reg empty or no input)
assign up_xfcp_out_tready_int_early = up_xfcp_out_tready | (~temp_up_xfcp_tvalid_reg & (~up_xfcp_out_tvalid_reg | ~up_xfcp_out_tvalid_int));

always @* begin
    // transfer sink ready state to source
    up_xfcp_out_tvalid_next = up_xfcp_out_tvalid_reg;
    temp_up_xfcp_tvalid_next = temp_up_xfcp_tvalid_reg;

    store_up_xfcp_int_to_output = 1'b0;
    store_up_xfcp_int_to_temp = 1'b0;
    store_up_xfcp_temp_to_output = 1'b0;
    
    if (up_xfcp_out_tready_int_reg) begin
        // input is ready
        if (up_xfcp_out_tready | ~up_xfcp_out_tvalid_reg) begin
            // output is ready or currently not valid, transfer data to output
            up_xfcp_out_tvalid_next = up_xfcp_out_tvalid_int;
            store_up_xfcp_int_to_output = 1'b1;
        end else begin
            // output is not ready, store input in temp
            temp_up_xfcp_tvalid_next = up_xfcp_out_tvalid_int;
            store_up_xfcp_int_to_temp = 1'b1;
        end
    end else if (up_xfcp_out_tready) begin
        // input is not ready, but output is ready
        up_xfcp_out_tvalid_next = temp_up_xfcp_tvalid_reg;
        temp_up_xfcp_tvalid_next = 1'b0;
        store_up_xfcp_temp_to_output = 1'b1;
    end
end

always @(posedge clk) begin
    if (rst) begin
        up_xfcp_out_tvalid_reg <= 1'b0;
        up_xfcp_out_tready_int_reg <= 1'b0;
        temp_up_xfcp_tvalid_reg <= 1'b0;
    end else begin
        up_xfcp_out_tvalid_reg <= up_xfcp_out_tvalid_next;
        up_xfcp_out_tready_int_reg <= up_xfcp_out_tready_int_early;
        temp_up_xfcp_tvalid_reg <= temp_up_xfcp_tvalid_next;
    end

    // datapath
    if (store_up_xfcp_int_to_output) begin
        up_xfcp_out_tdata_reg <= up_xfcp_out_tdata_int;
        up_xfcp_out_tlast_reg <= up_xfcp_out_tlast_int;
        up_xfcp_out_tuser_reg <= up_xfcp_out_tuser_int;
    end else if (store_up_xfcp_temp_to_output) begin
        up_xfcp_out_tdata_reg <= temp_up_xfcp_tdata_reg;
        up_xfcp_out_tlast_reg <= temp_up_xfcp_tlast_reg;
        up_xfcp_out_tuser_reg <= temp_up_xfcp_tuser_reg;
    end

    if (store_up_xfcp_int_to_temp) begin
        temp_up_xfcp_tdata_reg <= up_xfcp_out_tdata_int;
        temp_up_xfcp_tlast_reg <= up_xfcp_out_tlast_int;
        temp_up_xfcp_tuser_reg <= up_xfcp_out_tuser_int;
    end
end

i2c_master
i2c_master_inst (
    .clk(clk),
    .rst(rst),
    .s_axis_cmd_address(cmd_address_reg),
    .s_axis_cmd_start(cmd_start_reg),
    .s_axis_cmd_read(cmd_read_reg),
    .s_axis_cmd_write(cmd_write_reg),
    .s_axis_cmd_write_multiple(cmd_write_multiple_reg),
    .s_axis_cmd_stop(cmd_stop_reg),
    .s_axis_cmd_valid(cmd_valid_reg),
    .s_axis_cmd_ready(cmd_ready),
    .s_axis_data_tdata(data_in_reg),
    .s_axis_data_tvalid(data_in_valid_reg),
    .s_axis_data_tready(data_in_ready),
    .s_axis_data_tlast(data_in_last_reg),
    .m_axis_data_tdata(data_out),
    .m_axis_data_tvalid(data_out_valid),
    .m_axis_data_tready(data_out_ready_reg),
    .m_axis_data_tlast(data_out_last),
    .scl_i(i2c_scl_i),
    .scl_o(i2c_scl_o),
    .scl_t(i2c_scl_t),
    .sda_i(i2c_sda_i),
    .sda_o(i2c_sda_o),
    .sda_t(i2c_sda_t),
    .busy(busy),
    .bus_control(bus_control),
    .bus_active(bus_active),
    .missed_ack(missed_ack),
    .prescale(prescale_reg),
    .stop_on_idle(stop_on_idle_reg)
);

endmodule
