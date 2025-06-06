// This program was cloned from: https://github.com/jotego/jtcores
// License: GNU General Public License v3.0

/*  This file is part of JTFRAME.
    JTFRAME program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JTFRAME program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JTFRAME.  If not, see <http://www.gnu.org/licenses/>.

    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.0
    Date: 1-12-2020 */

// SDRAM access multiplexer, 2 -> 1

module jtframe_ram1_2slots #(parameter
    SDRAMW = 22,
    ERASE  = 1, // erase memory contents after a reset
    SLOT0_DW =16, SLOT1_DW = 8, SLOT2_DW = 8,
    SLOT0_AW = 8, SLOT1_AW = 8, SLOT2_AW = 8,

    SLOT1_LATCH  = 0,
    SLOT1_DOUBLE = 0,

    SLOT1_OKLATCH= 1,

    CACHE1_SIZE = 0,
/* verilator lint_off WIDTH */
    parameter [SDRAMW-1:0] SLOT1_OFFSET = 0,
/* verilator lint_on WIDTH */

    parameter REF_FILE="sdram_bank3.hex"
)(
    input               rst,
    input               clk,

    input  [SLOT0_AW-1:0] slot0_addr,
    input  [SLOT1_AW-1:0] slot1_addr,

    //  output data
    output [SLOT0_DW-1:0] slot0_dout,
    output [SLOT1_DW-1:0] slot1_dout,

    input    [SDRAMW-1:0] slot0_offset,

    input               slot0_cs,
    input               slot1_cs,

    output              slot0_ok,
    output              slot1_ok,

    // Slot 0 accepts 16-bit writes
    input               slot0_wen,
    input  [SLOT0_DW-1:0] slot0_din,
    input  [1:0]        slot0_wrmask,
    output              hold_rst,     // signals a busy state so the game is kept in reset

    // Slot 1 cache can be cleared
    input               slot1_clr,

    // SDRAM controller interface
    input               sdram_ack,
    output              sdram_rd,
    output              sdram_wr,
    output  [SDRAMW-1:0] sdram_addr,
    input               data_rdy,
    input               data_dst,
    input       [15:0]  data_read,
    output      [15:0]  data_write,  // only 16-bit writes
    output      [ 1:0]  sdram_wrmask // each bit is active low
);

localparam SW=2;

wire [SW-1:0] req, slot_ok;
wire [SW-1:0] slot_sel;
wire          req_rnw; // slot 0

wire [SDRAMW-1:0] slot0_addr_req,
                  slot1_addr_req;

assign slot0_ok = slot_ok[0];
assign slot1_ok = slot_ok[1];

jtframe_ram_rq #(.SDRAMW(SDRAMW),.AW(SLOT0_AW),.DW(SLOT0_DW),.ERASE(ERASE)) u_slot0(
    .rst       ( rst                    ),
    .clk       ( clk                    ),
    .addr      ( slot0_addr             ),
    .addr_ok   ( slot0_cs               ),
    .offset    ( slot0_offset           ),
    .wrdata    ( slot0_din              ),
    .wrin      ( slot0_wen              ),
    .req_rnw   ( req_rnw                ),
    .sdram_addr( slot0_addr_req         ),
    .din       ( data_read              ),
    .din_ok    ( data_rdy               ),
    .dst       ( data_dst               ),
    .dout      ( slot0_dout             ),
    .req       ( req[0]                 ),
    .data_ok   ( slot_ok[0]             ),
    .we        ( slot_sel[0]            ),
    .erase_bsy ( hold_rst               )
);

jtframe_romrq #(.SDRAMW(SDRAMW),.AW(SLOT1_AW),.DW(SLOT1_DW),
    .LATCH(SLOT1_LATCH),.DOUBLE(SLOT1_DOUBLE),.OKLATCH(SLOT1_OKLATCH),
    .CACHE_SIZE(CACHE1_SIZE))
u_slot1(
    .rst       ( rst                    ),
    .clk       ( clk                    ),
    .clr       ( slot1_clr              ),
    .offset    ( SLOT1_OFFSET           ),
    .addr      ( slot1_addr             ),
    .addr_ok   ( slot1_cs               ),
    .sdram_addr( slot1_addr_req         ),
    .din       ( data_read              ),
    .din_ok    ( data_rdy               ),
    .dout      ( slot1_dout             ),
    .dst       ( data_dst               ),
    .req       ( req[1]                 ),
    .data_ok   ( slot_ok[1]             ),
    .we        ( slot_sel[1]            )
);

jtframe_ramslot_ctrl #(
    .SDRAMW     (SDRAMW     ),
    .SW         ( SW        ),
    .DW0        ( SLOT0_DW  )
)u_ctrl(
    .rst            ( rst       ),
    .clk            ( clk       ),
    .req            ( req       ),
    .slot_addr_req  ({ slot1_addr_req, slot0_addr_req }),
    .req_rnw        ( req_rnw   ),        // only for slot0
    .slot_din       ( slot0_din ),
    .wrmask        (slot0_wrmask),   // only used if DW!=8
    .slot_sel       ( slot_sel  ),
    // SDRAM controller interface
    .sdram_ack      ( sdram_ack     ),
    .sdram_rd       ( sdram_rd      ),
    .sdram_wr       ( sdram_wr      ),
    .sdram_addr     ( sdram_addr    ),
    .data_rdy       ( data_rdy      ),
    .data_write     ( data_write    ),
    .sdram_wrmask   ( sdram_wrmask  ),
    .erase_bsy      ( hold_rst      )
);

`ifdef JTFRAME_SDRAM_CHECK

reg [15:0] mem[0:4*1024*1024];

initial begin
    $readmemh( REF_FILE, mem );
end

reg [15:0] expected;
reg [31:0] expected32;
reg        was_a_wr;

always @(*) begin
    expected   = mem[sdram_addr];
    expected32 = { mem[sdram_addr+1], mem[sdram_addr] };
end

always @( posedge clk ) begin
    if( sdram_ack ) begin
        if( sdram_wr ) begin
            mem[ sdram_addr ] <= {
                slot0_wrmask[1] ? expected[15:8] : slot0_din[15:8],
                slot0_wrmask[0] ? expected[ 7:0] : slot0_din[ 7:0] };
        end
        was_a_wr <= sdram_wr;
    end
    if( data_rdy ) begin
        if( !slot_sel ) begin
            $display("ERROR: SDRAM data received but it had not been requested at time %t - %m\n", $time);
            $finish;
        end else if(((slot_sel[0] && (expected   !== data_read[15:0])) ||
                     (slot_sel[1] && (expected32 !== data_read      )) )
                && !was_a_wr ) begin
            $display("ERROR: Wrong data read at time %t - %m", $time);
            $display("       at address %X (slot %d)", sdram_addr, slot_sel-2'd1 );
            $display("       expecting %X_%X - Read %X_%X\n",
                    expected32[31:16], expected32[15:0], data_read[31:16], data_read[15:0]);
            $finish;
        end
    end
end

`endif

endmodule
