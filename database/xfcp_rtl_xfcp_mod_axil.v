/*

Copyright (c) 2019 Alex Forencich

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
 * XFCP AXI lite module
 */
module xfcp_mod_axil #
(
    parameter XFCP_ID_TYPE = 16'h0001,
    parameter XFCP_ID_STR = "AXIL Master",
    parameter XFCP_EXT_ID = 0,
    parameter XFCP_EXT_ID_STR = "",
    parameter COUNT_SIZE = 16,
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 32,
    parameter STRB_WIDTH = (DATA_WIDTH/8)
)
(
    input  wire                   clk,
    input  wire                   rst,

    /*
     * XFCP upstream interface
     */
    input  wire [7:0]             up_xfcp_in_tdata,
    input  wire                   up_xfcp_in_tvalid,
    output wire                   up_xfcp_in_tready,
    input  wire                   up_xfcp_in_tlast,
    input  wire                   up_xfcp_in_tuser,

    output wire [7:0]             up_xfcp_out_tdata,
    output wire                   up_xfcp_out_tvalid,
    input  wire                   up_xfcp_out_tready,
    output wire                   up_xfcp_out_tlast,
    output wire                   up_xfcp_out_tuser,

    /*
     * AXI lite master interface
     */
    output wire [ADDR_WIDTH-1:0]  m_axil_awaddr,
    output wire [2:0]             m_axil_awprot,
    output wire                   m_axil_awvalid,
    input  wire                   m_axil_awready,
    output wire [DATA_WIDTH-1:0]  m_axil_wdata,
    output wire [STRB_WIDTH-1:0]  m_axil_wstrb,
    output wire                   m_axil_wvalid,
    input  wire                   m_axil_wready,
    input  wire [1:0]             m_axil_bresp,
    input  wire                   m_axil_bvalid,
    output wire                   m_axil_bready,
    output wire [ADDR_WIDTH-1:0]  m_axil_araddr,
    output wire [2:0]             m_axil_arprot,
    output wire                   m_axil_arvalid,
    input  wire                   m_axil_arready,
    input  wire [DATA_WIDTH-1:0]  m_axil_rdata,
    input  wire [1:0]             m_axil_rresp,
    input  wire                   m_axil_rvalid,
    output wire                   m_axil_rready
);

// for interfaces that are more than one word wide, disable address lines
parameter VALID_ADDR_WIDTH = ADDR_WIDTH - $clog2(STRB_WIDTH);
// width of data port in words
parameter WORD_WIDTH = STRB_WIDTH;
// size of words
parameter WORD_SIZE = DATA_WIDTH/WORD_WIDTH;

parameter WORD_PART_ADDR_WIDTH = $clog2(WORD_SIZE/8);

parameter ADDR_WIDTH_ADJ = ADDR_WIDTH+WORD_PART_ADDR_WIDTH;

parameter COUNT_WORD_WIDTH = (COUNT_SIZE+8-1)/8;
parameter ADDR_WORD_WIDTH = (ADDR_WIDTH_ADJ+8-1)/8;

// bus width assertions
initial begin
    if (WORD_WIDTH * WORD_SIZE != DATA_WIDTH) begin
        $error("Error: AXI data width not evenly divisble");
        $finish;
    end

    if (2**$clog2(WORD_WIDTH) != WORD_WIDTH) begin
        $error("Error: AXI word width must be even power of two");
        $finish;
    end

    if (8*2**$clog2(WORD_SIZE/8) != WORD_SIZE) begin
        $error("Error: AXI word size must be a power of two multiple of 8");
        $finish;
    end
end

localparam START_TAG = 8'hFF;
localparam RPATH_TAG = 8'hFE;
localparam READ_REQ = 8'h10;
localparam READ_RESP = 8'h11;
localparam WRITE_REQ = 8'h12;
localparam WRITE_RESP = 8'h13;
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
    {id_rom[1], id_rom[0]} = 16'h8000 | XFCP_ID_TYPE; // module type
    {id_rom[3], id_rom[2]} = ADDR_WIDTH; // address bus width
    {id_rom[5], id_rom[4]} = DATA_WIDTH; // data bus width
    {id_rom[7], id_rom[6]} = WORD_SIZE; // word size
    {id_rom[9], id_rom[8]} = COUNT_SIZE; // count size

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
    STATE_HEADER_3 = 4'd3,
    STATE_READ_1 = 4'd4,
    STATE_READ_2 = 4'd5,
    STATE_WRITE_1 = 4'd6,
    STATE_WRITE_2 = 4'd7,
    STATE_WAIT_LAST = 4'd8,
    STATE_ID = 4'd9;

reg [3:0] state_reg = STATE_IDLE, state_next;

reg [COUNT_SIZE-1:0] ptr_reg = {COUNT_SIZE{1'b0}}, ptr_next;
reg [7:0] count_reg = 8'd0, count_next;
reg last_cycle_reg = 1'b0;
reg write_reg = 1'b0, write_next;

reg [ADDR_WIDTH_ADJ-1:0] addr_reg = {ADDR_WIDTH_ADJ{1'b0}}, addr_next;
reg [DATA_WIDTH-1:0] data_reg = {DATA_WIDTH{1'b0}}, data_next;

reg up_xfcp_in_tready_reg = 1'b0, up_xfcp_in_tready_next;

reg m_axil_awvalid_reg = 1'b0, m_axil_awvalid_next;
reg [STRB_WIDTH-1:0] m_axil_wstrb_reg = {STRB_WIDTH{1'b0}}, m_axil_wstrb_next;
reg m_axil_wvalid_reg = 1'b0, m_axil_wvalid_next;
reg m_axil_bready_reg = 1'b0, m_axil_bready_next;
reg m_axil_arvalid_reg = 1'b0, m_axil_arvalid_next;
reg m_axil_rready_reg = 1'b0, m_axil_rready_next;

// internal datapath
reg [7:0]  up_xfcp_out_tdata_int;
reg        up_xfcp_out_tvalid_int;
reg        up_xfcp_out_tready_int_reg = 1'b0;
reg        up_xfcp_out_tlast_int;
reg        up_xfcp_out_tuser_int;
wire       up_xfcp_out_tready_int_early;

assign up_xfcp_in_tready = up_xfcp_in_tready_reg;

assign m_axil_awaddr = {addr_reg[ADDR_WIDTH_ADJ-1:ADDR_WIDTH_ADJ-VALID_ADDR_WIDTH], {ADDR_WIDTH-VALID_ADDR_WIDTH{1'b0}}};
assign m_axil_awprot = 3'b010;
assign m_axil_awvalid = m_axil_awvalid_reg;
assign m_axil_wdata = data_reg;
assign m_axil_wstrb = m_axil_wstrb_reg;
assign m_axil_wvalid = m_axil_wvalid_reg;
assign m_axil_bready = m_axil_bready_reg;
assign m_axil_araddr = {addr_reg[ADDR_WIDTH_ADJ-1:ADDR_WIDTH_ADJ-VALID_ADDR_WIDTH], {ADDR_WIDTH-VALID_ADDR_WIDTH{1'b0}}};
assign m_axil_arprot = 3'b010;
assign m_axil_arvalid = m_axil_arvalid_reg;
assign m_axil_rready = m_axil_rready_reg;

always @* begin
    state_next = STATE_IDLE;

    ptr_next = ptr_reg;
    count_next = count_reg;
    write_next = write_reg;

    id_ptr_next = id_ptr_reg;

    up_xfcp_in_tready_next = 1'b0;

    up_xfcp_out_tdata_int = 8'd0;
    up_xfcp_out_tvalid_int = 1'b0;
    up_xfcp_out_tlast_int = 1'b0;
    up_xfcp_out_tuser_int = 1'b0;

    addr_next = addr_reg;
    data_next = data_reg;

    m_axil_awvalid_next = m_axil_awvalid_reg && !m_axil_awready;
    m_axil_wstrb_next = m_axil_wstrb_reg;
    m_axil_wvalid_next = m_axil_wvalid_reg && !m_axil_wready;
    m_axil_bready_next = 1'b0;
    m_axil_arvalid_next = m_axil_arvalid_reg && !m_axil_arready;
    m_axil_rready_next = 1'b0;

    case (state_reg)
        STATE_IDLE: begin
            // idle, wait for start of packet
            up_xfcp_in_tready_next = up_xfcp_out_tready_int_early;
            id_ptr_next = 5'd0;

            if (up_xfcp_in_tready && up_xfcp_in_tvalid) begin
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

            if (up_xfcp_in_tready && up_xfcp_in_tvalid) begin
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

            if (up_xfcp_in_tready && up_xfcp_in_tvalid) begin
                if (up_xfcp_in_tdata == READ_REQ && !up_xfcp_in_tlast) begin
                    // start of read
                    up_xfcp_out_tdata_int = READ_RESP;
                    up_xfcp_out_tvalid_int = 1'b1;
                    up_xfcp_out_tlast_int = 1'b0;
                    up_xfcp_out_tuser_int = 1'b0;
                    write_next = 1'b0;
                    count_next = COUNT_WORD_WIDTH+ADDR_WORD_WIDTH-1;
                    state_next = STATE_HEADER_3;
                end else if (up_xfcp_in_tdata == WRITE_REQ && !up_xfcp_in_tlast) begin
                    // start of write
                    up_xfcp_out_tdata_int = WRITE_RESP;
                    up_xfcp_out_tvalid_int = 1'b1;
                    up_xfcp_out_tlast_int = 1'b0;
                    up_xfcp_out_tuser_int = 1'b0;
                    write_next = 1'b1;
                    count_next = COUNT_WORD_WIDTH+ADDR_WORD_WIDTH-1;
                    state_next = STATE_HEADER_3;
                end else if (up_xfcp_in_tdata == ID_REQ) begin
                    // identify
                    up_xfcp_out_tdata_int = ID_RESP;
                    up_xfcp_out_tvalid_int = 1'b1;
                    up_xfcp_out_tlast_int = 1'b0;
                    up_xfcp_out_tuser_int = 1'b0;
                    state_next = STATE_ID;
                end else begin
                    // invalid start of packet
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
        STATE_HEADER_3: begin
            // store address and length
            up_xfcp_in_tready_next = up_xfcp_out_tready_int_early;

            if (up_xfcp_in_tready && up_xfcp_in_tvalid) begin
                // pass through
                up_xfcp_out_tdata_int = up_xfcp_in_tdata;
                up_xfcp_out_tvalid_int = 1'b1;
                up_xfcp_out_tlast_int = 1'b0;
                up_xfcp_out_tuser_int = 1'b0;
                // store pointers
                if (count_reg < COUNT_WORD_WIDTH) begin
                    ptr_next[8*(COUNT_WORD_WIDTH-count_reg-1) +: 8] = up_xfcp_in_tdata;
                end else begin
                    addr_next[8*(ADDR_WORD_WIDTH-(count_reg-COUNT_WORD_WIDTH)-1) +: 8] = up_xfcp_in_tdata;
                end
                count_next = count_reg - 1;
                if (count_reg == 0) begin
                    // end of header
                    // set initial word offset
                    if (ADDR_WIDTH == VALID_ADDR_WIDTH && WORD_PART_ADDR_WIDTH == 0) begin
                        count_next = 0;
                    end else begin
                        count_next = addr_reg[ADDR_WIDTH_ADJ-VALID_ADDR_WIDTH-1:0];
                    end
                    m_axil_wstrb_next = {STRB_WIDTH{1'b0}};
                    data_next = {DATA_WIDTH{1'b0}};
                    if (write_reg) begin
                        // start writing
                        if (up_xfcp_in_tlast) begin
                            // end of frame in header
                            up_xfcp_out_tlast_int = 1'b1;
                            up_xfcp_out_tuser_int = 1'b1;
                            state_next = STATE_IDLE;
                        end else begin
                            up_xfcp_out_tlast_int = 1'b1;
                            state_next = STATE_WRITE_1;
                        end
                    end else begin
                        // start reading
                        up_xfcp_in_tready_next = !(last_cycle_reg || (up_xfcp_in_tvalid && up_xfcp_in_tlast));
                        m_axil_arvalid_next = 1'b1;
                        m_axil_rready_next = 1'b1;
                        state_next = STATE_READ_1;
                    end
                end else begin
                    if (up_xfcp_in_tlast) begin
                        // end of frame in header
                        up_xfcp_out_tlast_int = 1'b1;
                        up_xfcp_out_tuser_int = 1'b1;
                        state_next = STATE_IDLE;
                    end else begin
                        state_next = STATE_HEADER_3;
                    end
                end
            end else begin
                state_next = STATE_HEADER_3;
            end
        end
        STATE_READ_1: begin
            // wait for data
            m_axil_rready_next = 1'b1;

            // drop padding
            up_xfcp_in_tready_next = !(last_cycle_reg || (up_xfcp_in_tvalid && up_xfcp_in_tlast));

            if (m_axil_rready && m_axil_rvalid) begin
                // read cycle complete, store result
                m_axil_rready_next = 1'b0;
                data_next = m_axil_rdata;
                addr_next = addr_reg + (1 << (ADDR_WIDTH-VALID_ADDR_WIDTH+WORD_PART_ADDR_WIDTH));
                state_next = STATE_READ_2;
            end else begin
                state_next = STATE_READ_1;
            end
        end
        STATE_READ_2: begin
            // send data

            // drop padding
            up_xfcp_in_tready_next = !(last_cycle_reg || (up_xfcp_in_tvalid && up_xfcp_in_tlast));

            if (up_xfcp_out_tready_int_reg) begin
                // transfer word and update pointers
                up_xfcp_out_tdata_int = data_reg[8*count_reg +: 8];
                up_xfcp_out_tvalid_int = 1'b1;
                up_xfcp_out_tlast_int = 1'b0;
                up_xfcp_out_tuser_int = 1'b0;
                count_next = count_reg + 1;
                ptr_next = ptr_reg - 1;
                if (ptr_reg == 1) begin
                    // last word of read
                    up_xfcp_out_tlast_int = 1'b1;
                    if (!(last_cycle_reg || (up_xfcp_in_tvalid && up_xfcp_in_tlast))) begin
                        state_next = STATE_WAIT_LAST;
                    end else begin
                        up_xfcp_in_tready_next = up_xfcp_out_tready_int_early;
                        state_next = STATE_IDLE;
                    end
                end else if (count_reg == (STRB_WIDTH*WORD_SIZE/8)-1) begin
                    // end of stored data word; read the next one
                    count_next = 0;
                    m_axil_arvalid_next = 1'b1;
                    m_axil_rready_next = 1'b1;
                    state_next = STATE_READ_1;
                end else begin
                    state_next = STATE_READ_2;
                end
            end else begin
                state_next = STATE_READ_2;
            end
        end
        STATE_WRITE_1: begin
            // write data
            up_xfcp_in_tready_next = 1'b1;

            if (up_xfcp_in_tready && up_xfcp_in_tvalid) begin
                // store word
                data_next[8*count_reg +: 8] = up_xfcp_in_tdata;
                count_next = count_reg + 1;
                ptr_next = ptr_reg - 1;
                m_axil_wstrb_next[count_reg >> ((WORD_SIZE/8)-1)] = 1'b1;
                if (count_reg == (STRB_WIDTH*WORD_SIZE/8)-1 || ptr_reg == 1) begin
                    // have full word or at end of block, start write operation
                    count_next = 0;
                    up_xfcp_in_tready_next = 1'b0;
                    m_axil_awvalid_next = 1'b1;
                    m_axil_wvalid_next = 1'b1;
                    m_axil_bready_next = 1'b1;
                    state_next = STATE_WRITE_2;
                    if (up_xfcp_in_tlast) begin
                        // last asserted, nothing further to write
                        ptr_next = 0;
                    end
                end else if (up_xfcp_in_tlast) begin
                    // last asserted, return to idle
                    state_next = STATE_IDLE;
                end else begin
                    state_next = STATE_WRITE_1;
                end
            end else begin
                state_next = STATE_WRITE_1;
            end
        end
        STATE_WRITE_2: begin
            // wait for write completion
            m_axil_bready_next = 1'b1;

            if (m_axil_bready && m_axil_bvalid) begin
                // end of write operation
                data_next = {DATA_WIDTH{1'b0}};
                addr_next = addr_reg + (1 << (ADDR_WIDTH-VALID_ADDR_WIDTH+WORD_PART_ADDR_WIDTH));
                m_axil_bready_next = 1'b0;
                m_axil_wstrb_next = {STRB_WIDTH{1'b0}};
                if (ptr_reg == 0) begin
                    // done writing
                    if (!last_cycle_reg) begin
                        up_xfcp_in_tready_next = 1'b1;
                        state_next = STATE_WAIT_LAST;
                    end else begin
                        up_xfcp_in_tready_next = up_xfcp_out_tready_int_early;
                        state_next = STATE_IDLE;
                    end
                end else begin
                    // more to write
                    state_next = STATE_WRITE_1;
                end
            end else begin
                state_next = STATE_WRITE_2;
            end
        end
        STATE_ID: begin
            // send ID

            // drop padding
            up_xfcp_in_tready_next = !(last_cycle_reg || (up_xfcp_in_tvalid && up_xfcp_in_tlast));

            up_xfcp_out_tdata_int = id_rom[id_ptr_reg];
            up_xfcp_out_tvalid_int = 1'b1;
            up_xfcp_out_tlast_int = 1'b0;
            up_xfcp_out_tuser_int = 1'b0;

            if (up_xfcp_out_tready_int_reg) begin
                // increment pointer
                id_ptr_next = id_ptr_reg + 1;
                if (id_ptr_reg == ID_ROM_SIZE-1) begin
                    // read out whole ID
                    up_xfcp_out_tlast_int = 1'b1;
                    if (!(last_cycle_reg || (up_xfcp_in_tvalid && up_xfcp_in_tlast))) begin
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

            if (up_xfcp_in_tready && up_xfcp_in_tvalid) begin
                // wait for tlast
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

    ptr_reg <= ptr_next;
    count_reg <= count_next;
    write_reg <= write_next;

    if (up_xfcp_in_tready & up_xfcp_in_tvalid) begin
        last_cycle_reg <= up_xfcp_in_tlast;
    end

    addr_reg <= addr_next;
    data_reg <= data_next;

    up_xfcp_in_tready_reg <= up_xfcp_in_tready_next;

    m_axil_awvalid_reg <= m_axil_awvalid_next;
    m_axil_wstrb_reg <= m_axil_wstrb_next;
    m_axil_wvalid_reg <= m_axil_wvalid_next;
    m_axil_bready_reg <= m_axil_bready_next;
    m_axil_arvalid_reg <= m_axil_arvalid_next;
    m_axil_rready_reg <= m_axil_rready_next;

    if (rst) begin
        state_reg <= STATE_IDLE;
        up_xfcp_in_tready_reg <= 1'b0;
        m_axil_awvalid_reg <= 1'b0;
        m_axil_wvalid_reg <= 1'b0;
        m_axil_bready_reg <= 1'b0;
        m_axil_arvalid_reg <= 1'b0;
        m_axil_rready_reg <= 1'b0;
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

endmodule
