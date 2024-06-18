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
    Date: 20-5-2021 */

/*

    Generates the standard /DTACK signal expected by the CPU,
    i.e. there is an idle cycle for each bus cycle

    If there is a special bus access, marked by bus_cs, and
    it takes longer to complete than one cycle, the extra time
    will be recovered for later. If bus_legit is high, the time
    will not be recovered as it is identified as legitim wait
    in the original system

    DSn -and not just ASn- must be used so read-modify-write
    instructions have a second /DTACK signal generated for
    the write cycle

    Note that if jtframe_ramrq is used, then DSn must also
    gate the SDRAM requests so you get a cs toggle in the
    middle of the read-modify-write cycles

    DSn goes low one cycle after ASn under some conditions, so
    if ASn | DSn is used to set DTACKn, it will take one more
    cycle than expected on those occasions. Both CPS and S16
    use only ASn to generate DTACKn.

*/

module jtframe_68kdtack
#(parameter W=5,
            RECOVERY=1,
            WD=6,
            MFREQ=48_000  // clk input frequency in kHz
)(
    input         rst,
    input         clk,
    output   reg  cpu_cen,
    output   reg  cpu_cenb,
    input         bus_cs,
    input         bus_busy,
    input         bus_legit,
    input         ASn,  // DTACKn set low at the next cpu_cen after ASn goes low
    input [1:0]   DSn,  // If DSn goes high, DTACKn is reset high
    input [W-2:0] num,  // numerator
    input [W-1:0] den,  // denominator

    output reg    DTACKn,
    output reg [15:0] fave, // average cpu_cen frequency in kHz
    output reg [15:0] fworst, // average cpu_cen frequency in kHz
    input             frst
);
/* verilator lint_off WIDTH */

localparam CW=W+WD;

reg [CW-1:0] cencnt=0;
reg wait1, halt=0, aux=0;
wire [W-1:0] num2 = { num, 1'b0 }; // num x 2
wire over = (cencnt>den-num2)
            && !cpu_cen /*&& !aux*/ && (!halt || RECOVERY==0);
reg  DSnl;
reg  cen_act=0, risefall=0;
wire DSn_posedge = &DSn & ~DSnl;

`ifdef SIMULATION
real rnum = num2;
real rden = den;
initial begin
    if( rnum/rden<=4 ) begin
        $display("Error: num2/den must be 4 or more, otherwise recovery won't work (%m)");
        $finish;
    end
end
`endif

always @(posedge clk) begin : dtack_gen
    if( rst ) begin
        DTACKn <= 1;
        wait1  <= 1;
        halt   <= 0;
    end else begin
        DSnl <= &DSn;
        if( ASn || DSn_posedge ) begin // DSn is needed for read-modify-write cycles
            DTACKn <= 1;
            wait1  <= 1;
            halt   <= 0;
        end else if( !ASn ) begin
            if( cpu_cen  ) wait1 <= 0;
            if( !wait1 || cpu_cen ) begin
                if( !bus_cs || (bus_cs && !bus_busy) ) begin
                    DTACKn <= 0;
                    halt <= 0;
                end else begin
                    halt <= !bus_legit;
                end
            end
        end
    end
end

always @(posedge clk) begin
    cencnt  <= over ? (cencnt+num2-den) : (cencnt+num2);
    if( over && !halt) begin
        cpu_cen  <= risefall;
        cpu_cenb <= ~risefall;
        risefall <= ~risefall;
    end else begin
        cpu_cen  <= 0;
        cpu_cenb <= 0;
    end
    aux <= cpu_cen; // forces a blank after cpu_cen,
    // so the shortest sequence is cpu_cen, blank, cpu_cenb
    // note that cpu_cen can follow cpu_cenb without a blank
end
/* verilator lint_on WIDTH */

// Frequency reporting
reg [15:0] freq_cnt=0, fout_cnt;
initial fworst = 16'hffff;

always @(posedge clk) begin
    freq_cnt <= freq_cnt + 1'd1;
    if(cpu_cen) fout_cnt<=fout_cnt+1'd1;
    if( freq_cnt == MFREQ-1 ) begin
        freq_cnt <= 0;
        fout_cnt <= 0;
        fave <= fout_cnt;
        if( fworst > fout_cnt ) fworst <= fout_cnt;
    end
    if( frst ) fworst <= 16'hffff;
end

endmodule