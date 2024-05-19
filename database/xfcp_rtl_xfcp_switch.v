// This program was cloned from: https://github.com/alexforencich/xfcp
// License: MIT License

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
 * XFCP 1xN switch
 */
module xfcp_switch #
(
    parameter PORTS = 4,
    parameter XFCP_ID_TYPE = 16'h0100,
    parameter XFCP_ID_STR = "XFCP Switch",
    parameter XFCP_EXT_ID = 0,
    parameter XFCP_EXT_ID_STR = ""
)
(
    input  wire                clk,
    input  wire                rst,

    /*
     * XFCP upstream port
     */
    input  wire [7:0]          up_xfcp_in_tdata,
    input  wire                up_xfcp_in_tvalid,
    output wire                up_xfcp_in_tready,
    input  wire                up_xfcp_in_tlast,
    input  wire                up_xfcp_in_tuser,

    output wire [7:0]          up_xfcp_out_tdata,
    output wire                up_xfcp_out_tvalid,
    input  wire                up_xfcp_out_tready,
    output wire                up_xfcp_out_tlast,
    output wire                up_xfcp_out_tuser,

    /*
     * XFCP downstream ports
     */
    input  wire [PORTS*8-1:0]  down_xfcp_in_tdata,
    input  wire [PORTS-1:0]    down_xfcp_in_tvalid,
    output wire [PORTS-1:0]    down_xfcp_in_tready,
    input  wire [PORTS-1:0]    down_xfcp_in_tlast,
    input  wire [PORTS-1:0]    down_xfcp_in_tuser,

    output wire [PORTS*8-1:0]  down_xfcp_out_tdata,
    output wire [PORTS-1:0]    down_xfcp_out_tvalid,
    input  wire [PORTS-1:0]    down_xfcp_out_tready,
    output wire [PORTS-1:0]    down_xfcp_out_tlast,
    output wire [PORTS-1:0]    down_xfcp_out_tuser
);

parameter CL_PORTS = $clog2(PORTS);
parameter CL_PORTS_P1 = $clog2(PORTS+1);

// check configuration
initial begin
    if (PORTS < 1 || PORTS > 256) begin
        $error("Error: PORTS out of range; must be between 1 and 256");
        $finish;
    end
end

localparam START_TAG = 8'hFF;
localparam RPATH_TAG = 8'hFE;
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
    {id_rom[1], id_rom[0]} = 16'h0100 | (XFCP_ID_TYPE & 16'h00FF); // module type (switch)
    id_rom[2] = 8'd1; // upstream port count
    id_rom[3] = PORTS; // downstream port count

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

localparam [2:0]
    DOWN_STATE_IDLE = 3'd0,
    DOWN_STATE_TRANSFER = 3'd1,
    DOWN_STATE_HEADER = 3'd2,
    DOWN_STATE_PKT = 3'd3,
    DOWN_STATE_ID = 3'd4;

reg [2:0] down_state_reg = DOWN_STATE_IDLE, down_state_next;

localparam [2:0]
    UP_STATE_IDLE = 3'd0,
    UP_STATE_ADDRESS = 3'd1,
    UP_STATE_TRANSFER = 3'd2;

reg [2:0] up_state_reg = UP_STATE_IDLE, up_state_next;

reg [CL_PORTS-1:0] down_select_reg = {CL_PORTS{1'b0}}, down_select_next;
reg down_frame_reg = 1'b0, down_frame_next;
reg down_enable_reg = 1'b0, down_enable_next;

reg [CL_PORTS_P1-1:0] up_select_reg = {CL_PORTS_P1{1'b0}}, up_select_next;
reg up_frame_reg = 1'b0, up_frame_next;

reg up_xfcp_in_tready_reg = 1'b0, up_xfcp_in_tready_next;

reg [PORTS-1:0] down_xfcp_in_tready_reg = {PORTS{1'b0}}, down_xfcp_in_tready_next;

// internal datapath
reg [7:0] up_xfcp_out_tdata_int;
reg       up_xfcp_out_tvalid_int;
reg       up_xfcp_out_tready_int_reg = 1'b0;
reg       up_xfcp_out_tlast_int;
reg       up_xfcp_out_tuser_int;
wire      up_xfcp_out_tready_int_early;

reg [7:0]       down_xfcp_out_tdata_int;
reg [PORTS-1:0] down_xfcp_out_tvalid_int;
reg             down_xfcp_out_tready_int_reg = 1'b0;
reg             down_xfcp_out_tlast_int;
reg             down_xfcp_out_tuser_int;
wire            down_xfcp_out_tready_int_early;

reg [7:0] int_loop_tdata_reg = 8'd0, int_loop_tdata_next;
reg       int_loop_tvalid_reg = 1'b0, int_loop_tvalid_next;
reg       int_loop_tready;
reg       int_loop_tready_early;
reg       int_loop_tlast_reg = 1'b0, int_loop_tlast_next;
reg       int_loop_tuser_reg = 1'b0, int_loop_tuser_next;

assign up_xfcp_in_tready = up_xfcp_in_tready_reg;

assign down_xfcp_in_tready = down_xfcp_in_tready_reg;

// mux for downstream output control signals
wire current_output_tvalid = down_xfcp_out_tvalid[down_select_reg];
wire current_output_tready = down_xfcp_out_tready[down_select_reg];

// mux for incoming downstream packet
wire [7:0] current_input_tdata  = {int_loop_tdata_reg,  down_xfcp_in_tdata} >> up_select_reg*8;
wire       current_input_tvalid = {int_loop_tvalid_reg, down_xfcp_in_tvalid} >> up_select_reg;
wire       current_input_tready = {int_loop_tready,     down_xfcp_in_tready} >> up_select_reg;
wire       current_input_tlast  = {int_loop_tlast_reg,  down_xfcp_in_tlast} >> up_select_reg;
wire       current_input_tuser  = {int_loop_tuser_reg,  down_xfcp_in_tuser} >> up_select_reg;

// downstream control logic
always @* begin
    down_state_next = DOWN_STATE_IDLE;

    down_select_next = down_select_reg;
    down_frame_next = down_frame_reg;
    down_enable_next = down_enable_reg;

    id_ptr_next = id_ptr_reg;

    up_xfcp_in_tready_next = 1'b0;

    down_xfcp_out_tdata_int = up_xfcp_in_tdata;
    down_xfcp_out_tvalid_int = (up_xfcp_in_tvalid && up_xfcp_in_tready && down_enable_reg) << down_select_reg;
    down_xfcp_out_tlast_int = up_xfcp_in_tlast;
    down_xfcp_out_tuser_int = up_xfcp_in_tuser;

    int_loop_tdata_next = int_loop_tdata_reg;
    int_loop_tvalid_next = int_loop_tvalid_reg && !int_loop_tready;
    int_loop_tlast_next = int_loop_tlast_reg;
    int_loop_tuser_next = int_loop_tuser_reg;

    if (up_xfcp_in_tready & up_xfcp_in_tvalid) begin
        // end of frame detection
        if (up_xfcp_in_tlast) begin
            down_frame_next = 1'b0;
            down_enable_next = 1'b0;
        end
    end

    case (down_state_reg)
        DOWN_STATE_IDLE: begin
            // wait for incoming upstream packet
            up_xfcp_in_tready_next = !current_output_tvalid;
            id_ptr_next = 6'd0;

            if (!down_frame_reg && up_xfcp_in_tready && up_xfcp_in_tvalid) begin
                // start of frame, grab select value
                down_frame_next = 1'b1;
                if (up_xfcp_in_tdata == RPATH_TAG || up_xfcp_in_tdata == START_TAG) begin
                    // packet for us

                    int_loop_tdata_next = up_xfcp_in_tdata;
                    int_loop_tvalid_next = up_xfcp_in_tvalid;
                    int_loop_tlast_next = up_xfcp_in_tlast;
                    int_loop_tuser_next = up_xfcp_in_tuser;

                    up_xfcp_in_tready_next = int_loop_tready_early;

                    if (up_xfcp_in_tdata == RPATH_TAG) begin
                        // has rpath
                        down_state_next = DOWN_STATE_HEADER;
                    end else begin
                        // no rpath
                        down_state_next = DOWN_STATE_PKT;
                    end
                end else begin
                    // route packet
                    down_enable_next = 1'b1;
                    down_select_next = up_xfcp_in_tdata;
                    up_xfcp_in_tready_next = down_xfcp_out_tready_int_early;
                    down_state_next = DOWN_STATE_TRANSFER;
                    if (up_xfcp_in_tdata > PORTS-1) begin
                        // out of range
                        down_enable_next = 1'b0;
                    end
                end
            end else begin
                down_state_next = DOWN_STATE_IDLE;
            end
        end
        DOWN_STATE_TRANSFER: begin
            // transfer upstream packet through proper downstream port
            if (up_xfcp_in_tready && up_xfcp_in_tvalid) begin
                // end of frame detection
                if (up_xfcp_in_tlast) begin
                    down_frame_next = 1'b0;
                    down_enable_next = 1'b0;
                    down_state_next = DOWN_STATE_IDLE;
                end else begin
                    down_state_next = DOWN_STATE_TRANSFER;
                end
            end else begin
                down_state_next = DOWN_STATE_TRANSFER;
            end
            up_xfcp_in_tready_next = down_xfcp_out_tready_int_early && down_frame_next;
        end
        DOWN_STATE_HEADER: begin
            // loop back header

            up_xfcp_in_tready_next = int_loop_tready_early;

            if (up_xfcp_in_tready && up_xfcp_in_tvalid) begin
                int_loop_tdata_next = up_xfcp_in_tdata;
                int_loop_tvalid_next = 1'b1;
                int_loop_tlast_next = up_xfcp_in_tlast;
                int_loop_tuser_next = up_xfcp_in_tuser;

                // end of header detection
                if (up_xfcp_in_tdata == START_TAG) begin
                    down_state_next = DOWN_STATE_PKT;
                end else begin
                    down_state_next = DOWN_STATE_HEADER;
                end
            end else begin
                down_state_next = DOWN_STATE_HEADER;
            end
        end
        DOWN_STATE_PKT: begin
            // packet type

            up_xfcp_in_tready_next = int_loop_tready_early;

            if (up_xfcp_in_tready && up_xfcp_in_tvalid) begin
                int_loop_tdata_next = up_xfcp_in_tdata;
                int_loop_tvalid_next = 1'b1;
                int_loop_tlast_next = up_xfcp_in_tlast;
                int_loop_tuser_next = up_xfcp_in_tuser;

                if (up_xfcp_in_tdata == ID_REQ) begin
                    // ID packet
                    int_loop_tdata_next = ID_RESP;
                    int_loop_tlast_next = 1'b0;
                    down_state_next = DOWN_STATE_ID;
                end else begin
                    // something else
                    int_loop_tlast_next = 1'b1;
                    int_loop_tuser_next = 1'b1;
                    down_state_next = DOWN_STATE_IDLE;
                end
            end else begin
                down_state_next = DOWN_STATE_PKT;
            end
        end
        DOWN_STATE_ID: begin
            // send ID

            up_xfcp_in_tready_next = down_frame_next;

            if (int_loop_tready) begin
                int_loop_tdata_next = id_rom[id_ptr_reg];
                int_loop_tvalid_next = 1'b1;
                int_loop_tlast_next = 1'b0;
                int_loop_tuser_next = 1'b0;

                id_ptr_next = id_ptr_reg + 1;
                if (id_ptr_reg == ID_ROM_SIZE-1) begin
                    int_loop_tlast_next = 1'b1;
                    down_state_next = DOWN_STATE_IDLE;
                end else begin
                    down_state_next = DOWN_STATE_ID;
                end
            end else begin
                down_state_next = DOWN_STATE_ID;
            end
        end
    endcase
end

// upstream control logic
wire [PORTS+1-1:0] request;
wire [PORTS+1-1:0] acknowledge;
wire [PORTS+1-1:0] grant;
wire grant_valid;
wire [CL_PORTS_P1-1:0] grant_encoded;

// arbiter instance
arbiter #(
    .PORTS(PORTS+1),
    .ARB_TYPE_ROUND_ROBIN(1),
    .ARB_BLOCK(1),
    .ARB_BLOCK_ACK(1),
    .ARB_LSB_HIGH_PRIORITY(1)
)
arb_inst (
    .clk(clk),
    .rst(rst),
    .request(request),
    .acknowledge(acknowledge),
    .grant(grant),
    .grant_valid(grant_valid),
    .grant_encoded(grant_encoded)
);

assign request = {int_loop_tvalid_reg, down_xfcp_in_tvalid} & ~grant;
assign acknowledge = grant & {int_loop_tvalid_reg, down_xfcp_in_tvalid} & {int_loop_tready, down_xfcp_in_tready} & {int_loop_tlast_reg, down_xfcp_in_tlast};

always @* begin
    up_state_next = UP_STATE_IDLE;

    up_select_next = up_select_reg;
    up_frame_next = up_frame_reg;

    down_xfcp_in_tready_next = {PORTS{1'b0}};

    int_loop_tready = 1'b0;
    int_loop_tready_early = 1'b0;

    up_xfcp_out_tdata_int = current_input_tdata;
    up_xfcp_out_tvalid_int = current_input_tvalid && current_input_tready && up_frame_reg;
    up_xfcp_out_tlast_int = current_input_tlast;
    up_xfcp_out_tuser_int = current_input_tuser;

    if (current_input_tready && current_input_tvalid) begin
        if (current_input_tlast) begin
            // end of frame detection
            up_frame_next = 1'b0;
        end
    end

    case (up_state_reg)
        UP_STATE_IDLE: begin
            // wait for incoming downstream packet
            if (grant_valid && up_xfcp_out_tready_int_reg) begin
                up_frame_next = 1'b1;
                up_select_next = grant_encoded;
                up_state_next = UP_STATE_TRANSFER;

                if (up_select_next == PORTS) begin
                    // internal loop; don't add port
                end else begin
                    // prepend port to packet
                    up_xfcp_out_tdata_int = grant_encoded;
                    up_xfcp_out_tvalid_int = 1'b1;
                    up_xfcp_out_tlast_int = 1'b0;
                    up_xfcp_out_tuser_int = 1'b0;
                end
            end else begin
                up_state_next = UP_STATE_IDLE;
            end
        end
        UP_STATE_TRANSFER: begin
            // transfer downstream packet out through upstream port
            if (current_input_tvalid && current_input_tready) begin
                if (current_input_tlast) begin
                    up_frame_next = 1'b0;
                    up_state_next = UP_STATE_IDLE;
                end else begin
                    up_state_next = UP_STATE_TRANSFER;
                end
            end else begin
                up_state_next = UP_STATE_TRANSFER;
            end
        end
    endcase

    // generate ready signal on selected port
    if (up_select_next == PORTS) begin
        int_loop_tready_early = up_xfcp_out_tready_int_early && up_frame_next;
        int_loop_tready = up_xfcp_out_tready_int_reg && up_frame_reg;
    end else begin
        down_xfcp_in_tready_next = (up_xfcp_out_tready_int_early && up_frame_next) << up_select_next;
    end
end

always @(posedge clk) begin
    down_state_reg <= down_state_next;
    up_state_reg <= up_state_next;

    id_ptr_reg <= id_ptr_next;

    down_select_reg <= down_select_next;
    down_frame_reg <= down_frame_next;
    down_enable_reg <= down_enable_next;

    up_select_reg <= up_select_next;
    up_frame_reg <= up_frame_next;

    up_xfcp_in_tready_reg <= up_xfcp_in_tready_next;
    down_xfcp_in_tready_reg <= down_xfcp_in_tready_next;

    int_loop_tdata_reg <= int_loop_tdata_next;
    int_loop_tvalid_reg <= int_loop_tvalid_next;
    int_loop_tlast_reg <= int_loop_tlast_next;
    int_loop_tuser_reg <= int_loop_tuser_next;

    if (rst) begin
        down_state_reg <= DOWN_STATE_IDLE;
        up_state_reg <= UP_STATE_IDLE;
        down_select_reg <= {CL_PORTS{1'b0}};
        down_frame_reg <= 1'b0;
        down_enable_reg <= 1'b0;
        up_select_reg <= {CL_PORTS_P1{1'b0}};
        up_frame_reg <= 1'b0;
        up_xfcp_in_tready_reg <= 1'b0;
        down_xfcp_in_tready_reg <= {PORTS{1'b0}};
        int_loop_tvalid_reg <= 1'b0;
    end
end

// upstream output datapath logic
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
assign up_xfcp_out_tready_int_early = up_xfcp_out_tready || (!temp_up_xfcp_tvalid_reg && (!up_xfcp_out_tvalid_reg || !up_xfcp_out_tvalid_int));

always @* begin
    // transfer sink ready state to source
    up_xfcp_out_tvalid_next = up_xfcp_out_tvalid_reg;
    temp_up_xfcp_tvalid_next = temp_up_xfcp_tvalid_reg;

    store_up_xfcp_int_to_output = 1'b0;
    store_up_xfcp_int_to_temp = 1'b0;
    store_up_xfcp_temp_to_output = 1'b0;

    if (up_xfcp_out_tready_int_reg) begin
        // input is ready
        if (up_xfcp_out_tready || !up_xfcp_out_tvalid_reg) begin
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

// downstream output datapath logic
reg [7:0]       down_xfcp_out_tdata_reg = 8'd0;
reg [PORTS-1:0] down_xfcp_out_tvalid_reg = {PORTS{1'b0}}, down_xfcp_out_tvalid_next;
reg             down_xfcp_out_tlast_reg = 1'b0;
reg             down_xfcp_out_tuser_reg = 1'b0;

reg [7:0]       temp_down_xfcp_out_tdata_reg = 8'd0;
reg [PORTS-1:0] temp_down_xfcp_out_tvalid_reg = {PORTS{1'b0}}, temp_down_xfcp_out_tvalid_next;
reg             temp_down_xfcp_out_tlast_reg = 1'b0;
reg             temp_down_xfcp_out_tuser_reg = 1'b0;

// datapath control
reg store_down_xfcp_int_to_output;
reg store_down_xfcp_int_to_temp;
reg store_down_xfcp_temp_to_output;

assign down_xfcp_out_tdata = {PORTS{down_xfcp_out_tdata_reg}};
assign down_xfcp_out_tvalid = down_xfcp_out_tvalid_reg;
assign down_xfcp_out_tlast = {PORTS{down_xfcp_out_tlast_reg}};
assign down_xfcp_out_tuser = {PORTS{down_xfcp_out_tuser_reg}};

// enable ready input next cycle if output is ready or the temp reg will not be filled on the next cycle (output reg empty or no input)
assign down_xfcp_out_tready_int_early = (down_xfcp_out_tready & down_xfcp_out_tvalid) || (!temp_down_xfcp_out_tvalid_reg && (!down_xfcp_out_tvalid || !down_xfcp_out_tvalid_int));

always @* begin
    // transfer sink ready state to source
    down_xfcp_out_tvalid_next = down_xfcp_out_tvalid_reg;
    temp_down_xfcp_out_tvalid_next = temp_down_xfcp_out_tvalid_reg;

    store_down_xfcp_int_to_output = 1'b0;
    store_down_xfcp_int_to_temp = 1'b0;
    store_down_xfcp_temp_to_output = 1'b0;

    if (down_xfcp_out_tready_int_reg) begin
        // input is ready
        if ((down_xfcp_out_tready & down_xfcp_out_tvalid) || !down_xfcp_out_tvalid) begin
            // output is ready or currently not valid, transfer data to output
            down_xfcp_out_tvalid_next = down_xfcp_out_tvalid_int;
            store_down_xfcp_int_to_output = 1'b1;
        end else begin
            // output is not ready, store input in temp
            temp_down_xfcp_out_tvalid_next = down_xfcp_out_tvalid_int;
            store_down_xfcp_int_to_temp = 1'b1;
        end
    end else if (down_xfcp_out_tready & down_xfcp_out_tvalid) begin
        // input is not ready, but output is ready
        down_xfcp_out_tvalid_next = temp_down_xfcp_out_tvalid_reg;
        temp_down_xfcp_out_tvalid_next = {PORTS{1'b0}};
        store_down_xfcp_temp_to_output = 1'b1;
    end
end

always @(posedge clk) begin
    if (rst) begin
        down_xfcp_out_tvalid_reg <= {PORTS{1'b0}};
        down_xfcp_out_tready_int_reg <= 1'b0;
        temp_down_xfcp_out_tvalid_reg <= {PORTS{1'b0}};
    end else begin
        down_xfcp_out_tvalid_reg <= down_xfcp_out_tvalid_next;
        down_xfcp_out_tready_int_reg <= down_xfcp_out_tready_int_early;
        temp_down_xfcp_out_tvalid_reg <= temp_down_xfcp_out_tvalid_next;
    end

    // datapath
    if (store_down_xfcp_int_to_output) begin
        down_xfcp_out_tdata_reg <= down_xfcp_out_tdata_int;
        down_xfcp_out_tlast_reg <= down_xfcp_out_tlast_int;
        down_xfcp_out_tuser_reg <= down_xfcp_out_tuser_int;
    end else if (store_down_xfcp_temp_to_output) begin
        down_xfcp_out_tdata_reg <= temp_down_xfcp_out_tdata_reg;
        down_xfcp_out_tlast_reg <= temp_down_xfcp_out_tlast_reg;
        down_xfcp_out_tuser_reg <= temp_down_xfcp_out_tuser_reg;
    end

    if (store_down_xfcp_int_to_temp) begin
        temp_down_xfcp_out_tdata_reg <= down_xfcp_out_tdata_int;
        temp_down_xfcp_out_tlast_reg <= down_xfcp_out_tlast_int;
        temp_down_xfcp_out_tuser_reg <= down_xfcp_out_tuser_int;
    end
end

endmodule
