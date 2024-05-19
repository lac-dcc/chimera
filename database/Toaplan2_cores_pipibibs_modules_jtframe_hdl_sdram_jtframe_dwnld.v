// This program was cloned from: https://github.com/atrac17/Toaplan2
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
    Date: 02-5-2020 */

// Produces the right signals for jtframe_sdram to get the ROM data
// A prom_we signal is used for the second half of the ROM byte stream

// For system simulation, it is useful sometimes to be able to load the
// PROM data quickly at the beginning of the simulation. If the PROM
// modules are isolated, this can be done manually typing the path to
// each rom file in the jtframe_prom instantiation. However, sometimes
// the hierarchy will not allow it or the code may get messy.
// jtframe_dwnld can load PROMs only during simulation when the
// macro JTFRAME_DWNLD_PROM_ONLY is defined.

module jtframe_dwnld(
    input                clk,
    input                downloading,
    input      [24:0]    ioctl_addr,
    input      [ 7:0]    ioctl_dout,
    input                ioctl_wr,
    output reg [21:0]    prog_addr,
    output     [15:0]    prog_data,
    output reg [ 1:0]    prog_mask, // active low
    output reg           prog_we,
    `ifdef JTFRAME_SDRAM_BANKS
    output               prog_rd,
    output reg [ 1:0]    prog_ba,
    `endif

    output reg           prom_we,
    output reg           header,
    input                sdram_ack
);

parameter        SIMFILE   = "rom.bin";
parameter [24:0] PROM_START= ~25'd0;
parameter [24:0] BA1_START = ~25'd0,
                 BA2_START = ~25'd0,
                 BA3_START = ~25'd0,
                 HEADER    = 0,
                 SWAB      = 0; // swap every pair of input bytes (SDRAM only)

localparam       BA_EN     = (BA1_START!=~25'd0 || BA2_START!=~25'd0 || BA3_START!=~25'd0);
localparam       PROM_EN   = PROM_START!=~25'd0;

reg  [ 7:0] data_out;
wire        is_prom;
reg  [24:0] part_addr;

assign is_prom   = PROM_EN && part_addr>=PROM_START;
assign prog_data = {2{data_out}};

`ifdef JTFRAME_SDRAM_BANKS
assign prog_rd   = 0;
`endif

`ifdef LOADROM
`undef JTFRAME_DWNLD_PROM_ONLY
`endif

always @(*) begin
    header    = HEADER!=0 && ioctl_addr < HEADER && downloading;
    part_addr = ioctl_addr-HEADER;
end

`ifndef JTFRAME_DWNLD_PROM_ONLY
/////////////////////////////////////////////////
// Normal operation
reg  [ 1:0] bank;
reg  [24:0] offset;
reg  [24:0] eff_addr;

always @(*) begin
    bank = !BA_EN ? 2'd0 : (
            part_addr >= BA3_START ? 2'd3 : (
            part_addr >= BA2_START ? 2'd2 : (
            part_addr >= BA1_START ? 2'd1 : 2'd0 )));
    case( bank )
        2'd0: offset = 25'd0;
        2'd1: offset = BA1_START;
        2'd2: offset = BA2_START;
        2'd3: offset = BA3_START;
        default: offset = 0;
    endcase // bank
    eff_addr = part_addr-offset;
end

always @(posedge clk) begin
    if ( ioctl_wr && downloading && !header ) begin
        if( is_prom ) begin
            prog_addr <= part_addr[21:0];
            prom_we   <= 1;
            prog_we   <= 0;
        end else begin
            prog_addr <= eff_addr[22:1];
            prom_we   <= 0;
            prog_we   <= 1;
            `ifdef JTFRAME_SDRAM_BANKS
            prog_ba   <= bank;
            `endif
        end
        data_out  <= ioctl_dout;
        prog_mask <= (eff_addr[0]^SWAB[0]) ? 2'b10 : 2'b01;
    end
    else begin
        if(!downloading || sdram_ack) prog_we <= 0;
        if(!downloading) prom_we <= 0;
    end
end

`else
////////////////////////////////////////////////////////
// Load only PROMs directly from file in simulation
/* verilator lint_off WIDTH */

parameter [31:0] GAME_ROM_LEN = `GAME_ROM_LEN;

integer          f, readcnt, dumpcnt;
reg       [ 7:0] mem[0:`GAME_ROM_LEN];

initial begin
    dumpcnt = PROM_START+HEADER;
    if( SIMFILE != "" && PROM_EN ) begin
        f=$fopen(SIMFILE,"rb");
        if( f != 0 ) begin
            readcnt=$fread( mem, f );
            $display("INFO: PROM download: %6X bytes loaded from file (%m)", readcnt, SIMFILE);
            $fclose(f);
            if( dumpcnt >= readcnt ) begin
                $display("WARNING: PROM_START (%X) is set beyond the end of the file (%X)", PROM_START, dumpcnt);
                $display("         GAME_ROM_LEN=%X",GAME_ROM_LEN);
            end else begin
                $display("INFO: fast PROM download from %X to %X", dumpcnt, GAME_ROM_LEN);
            end
        end else begin
            $display("WARNING: %m cannot open %s", SIMFILE);
            dumpcnt = GAME_ROM_LEN; // stop the download process
        end
    end else begin
        $display("INFO: PROM download skipped because PROM_START was not defined.");
    end
end

// The PROM starts downloading at the same time that
// the test_harness sends the first 32 bytes of ROM
// the data from the harness is ignored here, but
// the header output is set to 1 if HEADER is defined,
// so these data can be read externally if checked for ioctrl_wr/ioctrl_data
reg start_ok=0;
initial prog_we=0;

always @(posedge clk) begin
    if( downloading ) start_ok<=1;
    if( dumpcnt < GAME_ROM_LEN && start_ok ) begin
        prom_we   <= 1;
        prog_we   <= 0;
        prog_mask <= 2'b11;
        data_out  <= mem[dumpcnt];
        prog_addr <= dumpcnt[21:0]-HEADER;
        dumpcnt   <= dumpcnt+1;
    end else begin
        prom_we <= 0;
    end
end
/* verilator lint_on WIDTH */
`endif

endmodule
