// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

/*

Copyright (c) 2019-2021 Moein Khazraee
Copyright (c) 2016-2018 Alex Forencich

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
 * AXI4-Stream switch
 */

// simple axis switch uses MSB bits of tdest for routing
module simple_axis_switch #
(
    // Number of AXI stream inputs
    parameter S_COUNT = 4,
    // Number of AXI stream outputs
    parameter M_COUNT = 4,
    // Width of AXI stream interfaces in bits
    parameter DATA_WIDTH = 8,
    // Propagate tkeep signal
    parameter KEEP_ENABLE = (DATA_WIDTH>8),
    // tkeep signal width (words per cycle)
    parameter KEEP_WIDTH = (DATA_WIDTH/8),
    // Propagate tid signal
    parameter ID_ENABLE = 0,
    // tid signal width
    parameter ID_WIDTH = 8,
    // tdest signal width
    // must be wide enough to uniquely address outputs
    parameter DEST_WIDTH = $clog2(M_COUNT),
    // Propagate tuser signal
    parameter USER_ENABLE = 1,
    // tuser signal width
    parameter USER_WIDTH = 1,
    // Input interface register type
    // 0 to bypass, 1 for simple buffer, 2 for skid buffer
    parameter S_REG_TYPE = 0,
    // Output interface register type
    // 0 to bypass, 1 for simple buffer, 2 for skid buffer
    parameter M_REG_TYPE = 2,
    // select round robin arbitration
    parameter ARB_TYPE_ROUND_ROBIN = 1,
    // LSB priority selection
    parameter ARB_LSB_HIGH_PRIORITY = 1
)
(
    input  wire                   clk,
    input  wire                   rst,

    /*
     * AXI Stream inputs
     */
    input  wire [S_COUNT*DATA_WIDTH-1:0] s_axis_tdata,
    input  wire [S_COUNT*KEEP_WIDTH-1:0] s_axis_tkeep,
    input  wire [S_COUNT-1:0]            s_axis_tvalid,
    output wire [S_COUNT-1:0]            s_axis_tready,
    input  wire [S_COUNT-1:0]            s_axis_tlast,
    input  wire [S_COUNT*ID_WIDTH-1:0]   s_axis_tid,
    input  wire [S_COUNT*DEST_WIDTH-1:0] s_axis_tdest,
    input  wire [S_COUNT*USER_WIDTH-1:0] s_axis_tuser,

    /*
     * AXI Stream outputs
     */
    output wire [M_COUNT*DATA_WIDTH-1:0] m_axis_tdata,
    output wire [M_COUNT*KEEP_WIDTH-1:0] m_axis_tkeep,
    output wire [M_COUNT-1:0]            m_axis_tvalid,
    input  wire [M_COUNT-1:0]            m_axis_tready,
    output wire [M_COUNT-1:0]            m_axis_tlast,
    output wire [M_COUNT*ID_WIDTH-1:0]   m_axis_tid,
    output wire [M_COUNT*DEST_WIDTH-1:0] m_axis_tdest,
    output wire [M_COUNT*USER_WIDTH-1:0] m_axis_tuser
);

parameter CL_S_COUNT  = $clog2(S_COUNT);
parameter CL_M_COUNT  = $clog2(M_COUNT);

integer i, j;

// check configuration
initial begin
    if (2**DEST_WIDTH < CL_M_COUNT) begin
        $error("Error: DEST_WIDTH too small for port count");
        $finish;
    end
end

wire [S_COUNT*DATA_WIDTH-1:0] int_s_axis_tdata;
wire [S_COUNT*KEEP_WIDTH-1:0] int_s_axis_tkeep;
wire [S_COUNT-1:0]            int_s_axis_tvalid;
wire [S_COUNT-1:0]            int_s_axis_tready;
wire [S_COUNT-1:0]            int_s_axis_tlast;
wire [S_COUNT*ID_WIDTH-1:0]   int_s_axis_tid;
wire [S_COUNT*DEST_WIDTH-1:0] int_s_axis_tdest;
wire [S_COUNT*USER_WIDTH-1:0] int_s_axis_tuser;

wire [S_COUNT*M_COUNT-1:0]    int_axis_tvalid;
wire [M_COUNT*S_COUNT-1:0]    int_axis_tready;

generate

    genvar m, n;

    for (m = 0; m < S_COUNT; m = m + 1) begin : s_ifaces

        // S side register
        axis_register #(
            .DATA_WIDTH(DATA_WIDTH),
            .KEEP_ENABLE(KEEP_ENABLE),
            .KEEP_WIDTH(KEEP_WIDTH),
            .LAST_ENABLE(1),
            .ID_ENABLE(ID_ENABLE),
            .ID_WIDTH(ID_WIDTH),
            .DEST_ENABLE(1),
            .DEST_WIDTH(DEST_WIDTH),
            .USER_ENABLE(USER_ENABLE),
            .USER_WIDTH(USER_WIDTH),
            .REG_TYPE(S_REG_TYPE)
        )
        reg_inst (
            .clk(clk),
            .rst(rst),
            // AXI input
            .s_axis_tdata(s_axis_tdata[m*DATA_WIDTH +: DATA_WIDTH]),
            .s_axis_tkeep(s_axis_tkeep[m*KEEP_WIDTH +: KEEP_WIDTH]),
            .s_axis_tvalid(s_axis_tvalid[m]),
            .s_axis_tready(s_axis_tready[m]),
            .s_axis_tlast(s_axis_tlast[m]),
            .s_axis_tid(s_axis_tid[m*ID_WIDTH +: ID_WIDTH]),
            .s_axis_tdest(s_axis_tdest[m*DEST_WIDTH +: DEST_WIDTH]),
            .s_axis_tuser(s_axis_tuser[m*USER_WIDTH +: USER_WIDTH]),
            // AXI output
            .m_axis_tdata(int_s_axis_tdata[m*DATA_WIDTH +: DATA_WIDTH]),
            .m_axis_tkeep(int_s_axis_tkeep[m*KEEP_WIDTH +: KEEP_WIDTH]),
            .m_axis_tvalid(int_s_axis_tvalid[m]),
            .m_axis_tready(int_s_axis_tready[m]),
            .m_axis_tlast(int_s_axis_tlast[m]),
            .m_axis_tid(int_s_axis_tid[m*ID_WIDTH +: ID_WIDTH]),
            .m_axis_tdest(int_s_axis_tdest[m*DEST_WIDTH +: DEST_WIDTH]),
            .m_axis_tuser(int_s_axis_tuser[m*USER_WIDTH +: USER_WIDTH])
        );

        // Select CL_M_COUNT MSB bits for destination
        wire [CL_M_COUNT-1:0] select = int_s_axis_tdest[((m+1)*DEST_WIDTH)-1-:CL_M_COUNT];

        // Making simulator happy!
        assign int_axis_tvalid[m*M_COUNT +: M_COUNT] = int_s_axis_tvalid[m] ?
                                           (int_s_axis_tvalid[m] << select) : {M_COUNT{1'b0}};
        assign int_s_axis_tready[m] = int_axis_tready[select*S_COUNT+m];

    end // s_ifaces

    for (n = 0; n < M_COUNT; n = n + 1) begin : m_ifaces

        // arbitration
        wire [S_COUNT-1:0] request;
        wire grant_valid;
        wire [CL_S_COUNT-1:0] grant_encoded;
        reg  [CL_S_COUNT-1:0] grant_encoded_r;

        // mux
        reg [DATA_WIDTH-1:0] s_axis_tdata_mux;
        reg [KEEP_WIDTH-1:0] s_axis_tkeep_mux;
        reg                  s_axis_tvalid_mux;
        wire                 s_axis_tready_mux;
        reg                  s_axis_tlast_mux;
        reg [ID_WIDTH-1:0]   s_axis_tid_mux;
        reg [DEST_WIDTH-1:0] s_axis_tdest_mux;
        reg [USER_WIDTH-1:0] s_axis_tuser_mux;

        // FSM
        reg state;
        localparam IDLE = 1'b0;
        localparam PROC = 1'b1;

        always @ (posedge clk)
            if (rst) begin
                state <= IDLE;
                grant_encoded_r <= 0;
            end else begin
                case (state)
                    IDLE: if (grant_valid && s_axis_tready_mux && (!s_axis_tlast_mux))    state <= PROC;
                    PROC: if (s_axis_tlast_mux && s_axis_tvalid_mux && s_axis_tready_mux) state <= IDLE;
                endcase
                if (state == IDLE) // && grant_valid && s_axis_tready_mux
                    grant_encoded_r <= grant_encoded;
            end

        for (m = 0; m < S_COUNT; m = m + 1) begin
            assign request[m] = int_axis_tvalid[m*M_COUNT+n];
        end

        simple_arbiter #(
            .PORTS(S_COUNT),
            .ARB_TYPE_ROUND_ROBIN(ARB_TYPE_ROUND_ROBIN),
            .ARB_LSB_HIGH_PRIORITY(ARB_LSB_HIGH_PRIORITY)
        )
        arb_inst (
            .clk(clk),
            .rst(rst),
            .request(request),
            .taken(s_axis_tready_mux && (state==IDLE)),
            .grant(),
            .grant_valid(grant_valid),
            .grant_encoded(grant_encoded)
        );

        always @ (*)
            if (state == IDLE) begin
                s_axis_tdata_mux   = int_s_axis_tdata[grant_encoded*DATA_WIDTH +: DATA_WIDTH];
                s_axis_tkeep_mux   = int_s_axis_tkeep[grant_encoded*KEEP_WIDTH +: KEEP_WIDTH];
                s_axis_tvalid_mux  = int_axis_tvalid [grant_encoded*M_COUNT+n] && grant_valid;
                s_axis_tlast_mux   = int_s_axis_tlast[grant_encoded];
                s_axis_tid_mux     = int_s_axis_tid  [grant_encoded*ID_WIDTH +: ID_WIDTH];
                s_axis_tdest_mux   = int_s_axis_tdest[grant_encoded*DEST_WIDTH +: DEST_WIDTH];
                s_axis_tuser_mux   = int_s_axis_tuser[grant_encoded*USER_WIDTH +: USER_WIDTH];
            end else begin
                s_axis_tdata_mux   = int_s_axis_tdata[grant_encoded_r*DATA_WIDTH +: DATA_WIDTH];
                s_axis_tkeep_mux   = int_s_axis_tkeep[grant_encoded_r*KEEP_WIDTH +: KEEP_WIDTH];
                s_axis_tvalid_mux  = int_axis_tvalid [grant_encoded_r*M_COUNT+n];
                s_axis_tlast_mux   = int_s_axis_tlast[grant_encoded_r];
                s_axis_tid_mux     = int_s_axis_tid  [grant_encoded_r*ID_WIDTH +: ID_WIDTH];
                s_axis_tdest_mux   = int_s_axis_tdest[grant_encoded_r*DEST_WIDTH +: DEST_WIDTH];
                s_axis_tuser_mux   = int_s_axis_tuser[grant_encoded_r*USER_WIDTH +: USER_WIDTH];
            end

        assign int_axis_tready[n*S_COUNT +: S_COUNT] = (state==IDLE) ? (s_axis_tready_mux << grant_encoded) :
                                                                       (s_axis_tready_mux << grant_encoded_r);

        // M side register
        axis_register #(
            .DATA_WIDTH(DATA_WIDTH),
            .KEEP_ENABLE(KEEP_ENABLE),
            .KEEP_WIDTH(KEEP_WIDTH),
            .LAST_ENABLE(1),
            .ID_ENABLE(ID_ENABLE),
            .ID_WIDTH(ID_WIDTH),
            .DEST_ENABLE(1),
            .DEST_WIDTH(DEST_WIDTH),
            .USER_ENABLE(USER_ENABLE),
            .USER_WIDTH(USER_WIDTH),
            .REG_TYPE(M_REG_TYPE)
        )
        reg_inst (
            .clk(clk),
            .rst(rst),
            // AXI input
            .s_axis_tdata(s_axis_tdata_mux),
            .s_axis_tkeep(s_axis_tkeep_mux),
            .s_axis_tvalid(s_axis_tvalid_mux),
            .s_axis_tready(s_axis_tready_mux),
            .s_axis_tlast(s_axis_tlast_mux),
            .s_axis_tid(s_axis_tid_mux),
            .s_axis_tdest(s_axis_tdest_mux),
            .s_axis_tuser(s_axis_tuser_mux),
            // AXI output
            .m_axis_tdata(m_axis_tdata[n*DATA_WIDTH +: DATA_WIDTH]),
            .m_axis_tkeep(m_axis_tkeep[n*KEEP_WIDTH +: KEEP_WIDTH]),
            .m_axis_tvalid(m_axis_tvalid[n]),
            .m_axis_tready(m_axis_tready[n]),
            .m_axis_tlast(m_axis_tlast[n]),
            .m_axis_tid(m_axis_tid[n*ID_WIDTH +: ID_WIDTH]),
            .m_axis_tdest(m_axis_tdest[n*DEST_WIDTH +: DEST_WIDTH]),
            .m_axis_tuser(m_axis_tuser[n*USER_WIDTH +: USER_WIDTH])
        );
    end // m_ifaces

endgenerate

endmodule

`resetall
