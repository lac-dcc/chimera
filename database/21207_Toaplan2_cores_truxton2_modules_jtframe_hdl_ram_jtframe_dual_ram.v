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
    Date: 27-10-2017 */

// Generic dual port RAM with clock enable
// parameters:
//      dw      => Data bit width, 8 for byte-based memories
//      aw      => Address bit width, 10 for 1kB
//      simfile => binary file to load during simulation
//      simhexfile => hexadecimal file to load during simulation
//      synfile => hexadecimal file to load for synthesis

/* verilator lint_off MULTIDRIVEN */

module jtframe_dual_ram #(parameter dw=8, aw=10,
    simfile="", simhexfile="",
    synfile="",
    ascii_bin=0,  // set to 1 to read the ASCII file as binary
    dumpfile="dump.hex"
)(
    // Port 0
    input   clk0,
    input   [dw-1:0] data0,
    input   [aw-1:0] addr0,
    input   we0,
    output  [dw-1:0] q0,
    // Port 1
    input   clk1,
    input   [dw-1:0] data1,
    input   [aw-1:0] addr1,
    input   we1,
    output  [dw-1:0] q1
    `ifdef JTFRAME_DUAL_RAM_DUMP
    ,input dump
    `endif
);

    jtframe_dual_ram_cen #(
        .dw         ( dw        ),
        .aw         ( aw        ),
        .simfile    ( simfile   ),
        .simhexfile ( simhexfile),
        .synfile    ( synfile   ),
        .ascii_bin  ( ascii_bin ),
        .dumpfile   ( dumpfile  )
    ) u_ram (
        .clk0   ( clk0  ),
        .cen0   ( 1'b1  ),
        .clk1   ( clk1  ),
        .cen1   ( 1'b1  ),
        // Port 0
        .data0  ( data0 ),
        .addr0  ( addr0 ),
        .we0    ( we0   ),
        .q0     ( q0    ),
        // Port 1
        .data1  ( data1 ),
        .addr1  ( addr1 ),
        .we1    ( we1   ),
        .q1     ( q1    )
        `ifdef JTFRAME_DUAL_RAM_DUMP
        ,.dump  ( dump  )
        `endif
    );
endmodule



module jtframe_dual_ram_cen #(parameter dw=8, aw=10,
    simfile="", simhexfile="",
    synfile="",
    ascii_bin=0,  // set to 1 to read the ASCII file as binary
    dumpfile="dump.hex"
)(
    input   clk0,
    input   cen0,
    input   clk1,
    input   cen1,
    // Port 0
    input   [dw-1:0] data0,
    input   [aw-1:0] addr0,
    input   we0,
    output reg [dw-1:0] q0,
    // Port 1
    input   [dw-1:0] data1,
    input   [aw-1:0] addr1,
    input   we1,
    output reg [dw-1:0] q1
    `ifdef JTFRAME_DUAL_RAM_DUMP
    ,input dump
    `endif
);

(* ramstyle = "no_rw_check" *) reg [dw-1:0] mem[0:(2**aw)-1];

/* verilator lint_off WIDTH */
`ifdef SIMULATION
integer f, readcnt;
initial begin
    for( f=0; f<(2**aw)-1;f=f+1) begin
        mem[f] = 0;
    end
    if( simfile != "" ) begin
        f=$fopen(simfile,"rb");
        if( f != 0 ) begin
            readcnt=$fread( mem, f );
            $display("INFO: Read %14s (%4d bytes/%2d%%) for %m",
                simfile, readcnt, readcnt*100/(2**aw));
            if( readcnt != 2**aw )
                $display("      the memory was not filled by the file data");
            $fclose(f);
        end else begin
            $display("WARNING: %m cannot open file: %s", simfile);
        end
        end
    else begin
        if( simhexfile != "" ) begin
            $readmemh(simhexfile,mem);
            $display("INFO: Read %14s (hex) for %m", simhexfile);
        end else begin
            if( synfile!= "" ) begin
                if( ascii_bin==1 )
                    $readmemb(synfile,mem);
                else
                    $readmemh(synfile,mem);
                $display("INFO: Read %14s (hex) for %m", synfile);
            end else
                for( readcnt=0; readcnt<2**aw; readcnt=readcnt+1 )
                    mem[readcnt] = {dw{1'b0}};
        end
    end
end
`else
// file for synthesis:
initial if(synfile!="" ) begin
    if( ascii_bin==1 )
        $readmemb(synfile,mem);
    else
        $readmemh(synfile,mem);
end
`endif

always @(posedge clk0) if(cen0) begin
    q0 <= mem[addr0];
    if(we0) mem[addr0] <= data0;
end

always @(posedge clk1) if(cen1) begin
    q1 <= mem[addr1];
    if(we1) mem[addr1] <= data1;
end

// Content dump for simulation debugging
`ifdef JTFRAME_DUAL_RAM_DUMP
integer fdump=0, dumpcnt;

always @(posedge dump) begin
    $display("INFO: contents dumped to %s", dumpfile );
    if( fdump==0 )begin
        fdump=$fopen(dumpfile,"w");
    end
    for( dumpcnt=0; dumpcnt<2**aw; dumpcnt=dumpcnt+1 )
        $fdisplay(fdump,"%X", mem[dumpcnt]);
end
`endif
/* verilator lint_on WIDTH */
endmodule
/* verilator lint_on MULTIDRIVEN */