// This program was cloned from: https://github.com/MiSTeX-devel/MiSTeX-ports
// License: BSD 3-Clause "New" or "Revised" License

/*  This file is part of JTCORES.
    JTCORES program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JTCORES program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JTCORES.  If not, see <http://www.gnu.org/licenses/>.

    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.0
    Date: 20-10-2023 */

module jtshouse_cus116_mmr(
    input             rst,
    input             clk,

    input             cs,
    input       [3:0] addr,
    input             rnw,
    input       [7:0] din, 
    output reg  [7:0] dout,
    
    output    [8:0] left,
    output    [8:0] right,
    output    [8:0] top,
    output    [8:0] bottom,
    output    [15:0] hirq,
    output    [15:0] virq,

    // IOCTL dump
    input      [3:0] ioctl_addr,
    output reg [7:0] ioctl_din,
    // Debug
    input      [7:0] debug_bus,
    output reg [7:0] st_dout
);

parameter SIMFILE="rest.bin",
          SEEK=0;

localparam SIZE=16;

reg  [ 7:0] mmr[0:SIZE-1];
integer     i;

assign left = { 
    mmr[0][0],
    mmr[1][7:0], {0{1'b0}}  // finish off without a comma
    };

assign right = { 
    mmr[2][0],
    mmr[3][7:0], {0{1'b0}}  // finish off without a comma
    };

assign top = { 
    mmr[4][0],
    mmr[5][7:0], {0{1'b0}}  // finish off without a comma
    };

assign bottom = { 
    mmr[6][0],
    mmr[7][7:0], {0{1'b0}}  // finish off without a comma
    };

assign hirq = { 
    mmr[8][7:0],
    mmr[9][7:0], {0{1'b0}}  // finish off without a comma
    };

assign virq = { 
    mmr[10][7:0],
    mmr[11][7:0], {0{1'b0}}  // finish off without a comma
    };


always @(posedge clk, posedge rst) begin
    if( rst ) begin
    `ifndef SIMULATION
        // no mechanism for default values yet
        mmr[0] <= 0;
        mmr[1] <= 0;
        mmr[2] <= 0;
        mmr[3] <= 0;
        mmr[4] <= 0;
        mmr[5] <= 0;
        mmr[6] <= 0;
        mmr[7] <= 0;
        mmr[8] <= 0;
        mmr[9] <= 0;
        mmr[10] <= 0;
        mmr[11] <= 0;
        mmr[12] <= 0;
        mmr[13] <= 0;
        mmr[14] <= 0;
        mmr[15] <= 0;
    `else
        for(i=0;i<SIZE;i++) mmr[i] <= mmr_init[i];
    `endif 
    dout <= 0;
    end else begin
        dout      <= mmr[addr];
        st_dout   <= mmr[debug_bus[3:0]];
        ioctl_din <= mmr[ioctl_addr];
        if( cs & ~rnw ) begin
            mmr[addr]<=din;
        end
    end
end

`ifdef SIMULATION
/* verilator tracing_off */
integer f, fcnt, err;
reg [7:0] mmr_init[0:SIZE-1];
initial begin
    f=$fopen(SIMFILE,"rb");
    err=$fseek(f,SEEK,0);
    if( f!=0 && err!=0 ) begin
        $display("Cannot seek file rest.bin to offset 0x%0X (%0d)",SEEK,SEEK);
    end
    if( f!=0 ) begin
        fcnt=$fread(mmr_init,f);
        $display("MMR %m - read %0d bytes from offset %0d",fcnt,SEEK);
        if( fcnt!=SIZE ) begin
            $display("WARNING: Missing %d bytes for %m.mmr",SIZE-fcnt);
        end else begin
            $display("\tleft = %X",{  mmr[0][0], mmr[1][7:0],{0{1'b0}}});
            $display("\tright = %X",{  mmr[2][0], mmr[3][7:0],{0{1'b0}}});
            $display("\ttop = %X",{  mmr[4][0], mmr[5][7:0],{0{1'b0}}});
            $display("\tbottom = %X",{  mmr[6][0], mmr[7][7:0],{0{1'b0}}});
            $display("\thirq = %X",{  mmr[8][7:0], mmr[9][7:0],{0{1'b0}}});
            $display("\tvirq = %X",{  mmr[10][7:0], mmr[11][7:0],{0{1'b0}}});
        end
    end
    $fclose(f);
end
`endif

endmodule
