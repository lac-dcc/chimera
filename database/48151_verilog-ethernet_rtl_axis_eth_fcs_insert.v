// This program was cloned from: https://github.com/alexforencich/verilog-ethernet
// License: MIT License

/*

Copyright (c) 2015-2018 Alex Forencich

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

`resetall
`timescale 1ns / 1ps
`default_nettype none

/*
 * AXI4-Stream Ethernet FCS inserter
 */
module axis_eth_fcs_insert #
(
    parameter ENABLE_PADDING = 0,
    parameter MIN_FRAME_LENGTH = 64
)
(
    input  wire        clk,
    input  wire        rst,
    
    /*
     * AXI input
     */
    input  wire [7:0]  s_axis_tdata,
    input  wire        s_axis_tvalid,
    output wire        s_axis_tready,
    input  wire        s_axis_tlast,
    input  wire        s_axis_tuser,
    
    /*
     * AXI output
     */
    output wire [7:0]  m_axis_tdata,
    output wire        m_axis_tvalid,
    input  wire        m_axis_tready,
    output wire        m_axis_tlast,
    output wire        m_axis_tuser,

    /*
     * Status
     */
    output wire        busy
);

localparam [1:0]
    STATE_IDLE = 2'd0,
    STATE_PAYLOAD = 2'd1,
    STATE_PAD = 2'd2,
    STATE_FCS = 2'd3;

reg [1:0] state_reg = STATE_IDLE, state_next;

// datapath control signals
reg reset_crc;
reg update_crc;

reg [15:0] frame_ptr_reg = 16'd0, frame_ptr_next;

reg busy_reg = 1'b0;

reg s_axis_tready_reg = 1'b0, s_axis_tready_next;

reg [31:0] crc_state = 32'hFFFFFFFF;
wire [31:0] crc_next;

// internal datapath
reg [7:0] m_axis_tdata_int;
reg       m_axis_tvalid_int;
reg       m_axis_tready_int_reg = 1'b0;
reg       m_axis_tlast_int;
reg       m_axis_tuser_int;
wire      m_axis_tready_int_early;

assign s_axis_tready = s_axis_tready_reg;

assign busy = busy_reg;

lfsr #(
    .LFSR_WIDTH(32),
    .LFSR_POLY(32'h4c11db7),
    .LFSR_CONFIG("GALOIS"),
    .LFSR_FEED_FORWARD(0),
    .REVERSE(1),
    .DATA_WIDTH(8),
    .STYLE("AUTO")
)
eth_crc_8 (
    .data_in(m_axis_tdata_int),
    .state_in(crc_state),
    .data_out(),
    .state_out(crc_next)
);

always @* begin
    state_next = STATE_IDLE;

    reset_crc = 1'b0;
    update_crc = 1'b0;

    frame_ptr_next = frame_ptr_reg;

    s_axis_tready_next = 1'b0;

    m_axis_tdata_int = 8'd0;
    m_axis_tvalid_int = 1'b0;
    m_axis_tlast_int = 1'b0;
    m_axis_tuser_int = 1'b0;

    case (state_reg)
        STATE_IDLE: begin
            // idle state - wait for data
            s_axis_tready_next = m_axis_tready_int_early;
            frame_ptr_next = 16'd0;
            reset_crc = 1'b1;

            m_axis_tdata_int = s_axis_tdata;
            m_axis_tvalid_int = s_axis_tvalid;
            m_axis_tlast_int = 1'b0;
            m_axis_tuser_int = 1'b0;

            if (s_axis_tready && s_axis_tvalid) begin
                frame_ptr_next = 16'd1;
                reset_crc = 1'b0;
                update_crc = 1'b1;
                if (s_axis_tlast) begin
                    if (s_axis_tuser) begin
                        m_axis_tlast_int = 1'b1;
                        m_axis_tuser_int = 1'b1;
                        reset_crc = 1'b1;
                        frame_ptr_next = 16'd0;
                        state_next = STATE_IDLE;
                    end else begin
                        s_axis_tready_next = 1'b0;
                        if (ENABLE_PADDING && frame_ptr_reg < MIN_FRAME_LENGTH-5) begin
                            state_next = STATE_PAD;
                        end else begin
                            frame_ptr_next = 16'd0;
                            state_next = STATE_FCS;
                        end
                    end
                end else begin
                    state_next = STATE_PAYLOAD;
                end
            end else begin
                state_next = STATE_IDLE;
            end
        end
        STATE_PAYLOAD: begin
            // transfer payload
            s_axis_tready_next = m_axis_tready_int_early;

            m_axis_tdata_int = s_axis_tdata;
            m_axis_tvalid_int = s_axis_tvalid;
            m_axis_tlast_int = 1'b0;
            m_axis_tuser_int = 1'b0;

            if (s_axis_tready && s_axis_tvalid) begin
                frame_ptr_next = frame_ptr_reg + 16'd1;
                update_crc = 1'b1;
                if (s_axis_tlast) begin
                    if (s_axis_tuser) begin
                        m_axis_tlast_int = 1'b1;
                        m_axis_tuser_int = 1'b1;
                        reset_crc = 1'b1;
                        frame_ptr_next = 16'd0;
                        state_next = STATE_IDLE;
                    end else begin
                        s_axis_tready_next = 1'b0;
                        if (ENABLE_PADDING && frame_ptr_reg < MIN_FRAME_LENGTH-5) begin
                            state_next = STATE_PAD;
                        end else begin
                            frame_ptr_next = 16'd0;
                            state_next = STATE_FCS;
                        end
                    end
                end else begin
                    state_next = STATE_PAYLOAD;
                end
            end else begin
                state_next = STATE_PAYLOAD;
            end
        end
        STATE_PAD: begin
            // insert padding
            s_axis_tready_next = 1'b0;

            m_axis_tdata_int = 8'd0;
            m_axis_tvalid_int = 1'b1;
            m_axis_tlast_int = 1'b0;
            m_axis_tuser_int = 1'b0;

            if (m_axis_tready_int_reg) begin
                frame_ptr_next = frame_ptr_reg + 16'd1;
                update_crc = 1'b1;
                if (frame_ptr_reg < MIN_FRAME_LENGTH-5) begin
                    state_next = STATE_PAD;
                end else begin
                    frame_ptr_next = 16'd0;
                    state_next = STATE_FCS;
                end
            end else begin
                state_next = STATE_PAD;
            end
        end
        STATE_FCS: begin
            // send FCS
            s_axis_tready_next = 1'b0;

            case (frame_ptr_reg)
                2'd0: m_axis_tdata_int = ~crc_state[7:0];
                2'd1: m_axis_tdata_int = ~crc_state[15:8];
                2'd2: m_axis_tdata_int = ~crc_state[23:16];
                2'd3: m_axis_tdata_int = ~crc_state[31:24];
            endcase
            m_axis_tvalid_int = 1'b1;
            m_axis_tlast_int = 1'b0;
            m_axis_tuser_int = 1'b0;

            if (m_axis_tready_int_reg) begin
                frame_ptr_next = frame_ptr_reg + 16'd1;

                if (frame_ptr_reg < 16'd3) begin
                    state_next = STATE_FCS;
                end else begin
                    reset_crc = 1'b1;
                    frame_ptr_next = 16'd0;
                    m_axis_tlast_int = 1'b1;
                    s_axis_tready_next = m_axis_tready_int_early;
                    state_next = STATE_IDLE;
                end
            end else begin
                state_next = STATE_FCS;
            end
        end
    endcase
end

always @(posedge clk) begin
    if (rst) begin
        state_reg <= STATE_IDLE;
        
        frame_ptr_reg <= 1'b0;
        
        s_axis_tready_reg <= 1'b0;

        busy_reg <= 1'b0;

        crc_state <= 32'hFFFFFFFF;
    end else begin
        state_reg <= state_next;

        frame_ptr_reg <= frame_ptr_next;

        s_axis_tready_reg <= s_axis_tready_next;

        busy_reg <= state_next != STATE_IDLE;

        // datapath
        if (reset_crc) begin
            crc_state <= 32'hFFFFFFFF;
        end else if (update_crc) begin
            crc_state <= crc_next;
        end
    end
end

// output datapath logic
reg [7:0] m_axis_tdata_reg = 8'd0;
reg       m_axis_tvalid_reg = 1'b0, m_axis_tvalid_next;
reg       m_axis_tlast_reg = 1'b0;
reg       m_axis_tuser_reg = 1'b0;

reg [7:0] temp_m_axis_tdata_reg = 8'd0;
reg       temp_m_axis_tvalid_reg = 1'b0, temp_m_axis_tvalid_next;
reg       temp_m_axis_tlast_reg = 1'b0;
reg       temp_m_axis_tuser_reg = 1'b0;

// datapath control
reg store_axis_int_to_output;
reg store_axis_int_to_temp;
reg store_axis_temp_to_output;

assign m_axis_tdata = m_axis_tdata_reg;
assign m_axis_tvalid = m_axis_tvalid_reg;
assign m_axis_tlast = m_axis_tlast_reg;
assign m_axis_tuser = m_axis_tuser_reg;

// enable ready input next cycle if output is ready or if both output registers are empty
assign m_axis_tready_int_early = m_axis_tready || (!temp_m_axis_tvalid_reg && !m_axis_tvalid_reg);

always @* begin
    // transfer sink ready state to source
    m_axis_tvalid_next = m_axis_tvalid_reg;
    temp_m_axis_tvalid_next = temp_m_axis_tvalid_reg;

    store_axis_int_to_output = 1'b0;
    store_axis_int_to_temp = 1'b0;
    store_axis_temp_to_output = 1'b0;
    
    if (m_axis_tready_int_reg) begin
        // input is ready
        if (m_axis_tready || !m_axis_tvalid_reg) begin
            // output is ready or currently not valid, transfer data to output
            m_axis_tvalid_next = m_axis_tvalid_int;
            store_axis_int_to_output = 1'b1;
        end else begin
            // output is not ready, store input in temp
            temp_m_axis_tvalid_next = m_axis_tvalid_int;
            store_axis_int_to_temp = 1'b1;
        end
    end else if (m_axis_tready) begin
        // input is not ready, but output is ready
        m_axis_tvalid_next = temp_m_axis_tvalid_reg;
        temp_m_axis_tvalid_next = 1'b0;
        store_axis_temp_to_output = 1'b1;
    end
end

always @(posedge clk) begin
    m_axis_tvalid_reg <= m_axis_tvalid_next;
    m_axis_tready_int_reg <= m_axis_tready_int_early;
    temp_m_axis_tvalid_reg <= temp_m_axis_tvalid_next;

    // datapath
    if (store_axis_int_to_output) begin
        m_axis_tdata_reg <= m_axis_tdata_int;
        m_axis_tlast_reg <= m_axis_tlast_int;
        m_axis_tuser_reg <= m_axis_tuser_int;
    end else if (store_axis_temp_to_output) begin
        m_axis_tdata_reg <= temp_m_axis_tdata_reg;
        m_axis_tlast_reg <= temp_m_axis_tlast_reg;
        m_axis_tuser_reg <= temp_m_axis_tuser_reg;
    end

    if (store_axis_int_to_temp) begin
        temp_m_axis_tdata_reg <= m_axis_tdata_int;
        temp_m_axis_tlast_reg <= m_axis_tlast_int;
        temp_m_axis_tuser_reg <= m_axis_tuser_int;
    end

    if (rst) begin
        m_axis_tvalid_reg <= 1'b0;
        m_axis_tready_int_reg <= 1'b0;
        temp_m_axis_tvalid_reg <= 1'b0;
    end
end

endmodule

`resetall
