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

// Generic RAM with clock enable
// parameters:
//      dw      => Data bit width, 8 for byte-based memories
//      aw      => Address bit width, 10 for 1kB
//      simfile => binary file to load during simulation
//      simhexfile => hexadecimal file to load during simulation
//      synfile => hexadecimal file to load for synthesis
//      cen_rd  => Use clock enable for reading too, by default it is used
//                 only for writting.


module jtframe_ram #(parameter dw=8, aw=10,
        simfile="", simhexfile="",
        synfile="", synbinfile="",
        cen_rd=0)(
    input   clk,
    input   cen /* direct_enable */,
    input   [dw-1:0] data,
    input   [aw-1:0] addr,
    input   we,
    output reg [dw-1:0] q
);

(* ramstyle = "no_rw_check" *) reg [dw-1:0] mem[0:(2**aw)-1];

`ifdef SIMULATION
integer f, readcnt;
initial
if( simfile != 0 ) begin
    f=$fopen(simfile,"rb");
    if( f != 0 ) begin
        readcnt=$fread( mem, f );
        $display("INFO: Read %14s (%4d bytes) for %m",simfile, readcnt);
        $fclose(f);
    end else begin
        $display("WARNING: %m cannot open file: %s", simfile);
    end
    end
else begin
    if( simhexfile != 0 ) begin
        $readmemh(simhexfile,mem);
        $display("INFO: Read %14s (hex) for %m", simhexfile);
    end else begin
        if( synfile != 0 ) begin
            $readmemh(synfile,mem);
            $display("INFO: Read %14s for %m", synfile);
        end else
            for( readcnt=0; readcnt<(2**aw)-1; readcnt=readcnt+1 )
                mem[readcnt] = {dw{1'b0}};
    end
end
`else
// file for synthesis:
initial if(synfile!=0 )$readmemh(synfile,mem);
initial if(synbinfile!=0 )$readmemb(synbinfile,mem);
`endif

always @(posedge clk) begin
    if( !cen_rd || cen ) q <= mem[addr];
    if( cen && we) mem[addr] <= data;
end

endmodule