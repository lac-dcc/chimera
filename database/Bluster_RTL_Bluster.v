/*

BUSTIN' MAKES ME FEEL GOOD!

Bluster - CPLD Replacement for Amiga 2000's Buster
Copyright 2021 Matthew Harlum

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

*/

//`define badbuster // Emulate 1st rev of Buster that had a bug requiring buster tower

module Bluster(
  input [5:1] BR,
  input [5:1] SLV,
  input [23:19] ADDR,
  input UDSn,
  input LDSn,
  input READ,
  input BGn,
  input BOSSn,
  input OVRn,
  input OWNn,
  input ASn,
  input RESETn,
  input CDACn,
  input C1,
  input C3,
  inout BEERn,
  inout CBRn,
  inout CBGn,
  output DOE,
  output DBOEn,
  output D2Pn,
  output GBGn,
  output reg BRn,
  output reg [5:1] BG,
  output reg C4n,
  output reg C2n
  );

// Clocks
wire C7M;

assign C7M = !(C1 ^ C3);

always @(posedge CDACn)
begin
  C2n <= !C1;
end

always @(negedge CDACn)
begin
  C4n <= !C3;
end

// Collision
wire nocollision;
wire mainboard;

// Reserved address ranges
// Buster triggers a bus error if a PIC answers to these addresses (unless it asserts OVR)
assign mainboard = (
  ADDR[23:21] == 3'b000   |  // $000000-0FFFFF - Chip RAM
  ADDR[23:21] == 3'b101   |  // $A00000-BFFFFF - RESERVED
  ADDR[23:21] == 3'b110   |  // $C00000-DFFFFF - Pseudo-Fast RAM
  ADDR[23:19] == 5'b11100 |  // $E00000-E7FFFF - RESERVED
  ADDR[23:19] == 5'b11111    // $F80000-FFFFFF - Kickstart ROM
  ) & !ASn & RESETn & OVRn;

// If more than one PIC answers at the same time throw a bus error.
assign nocollision = (!SLV[5] ^ !SLV[4] ^ !SLV[3] ^ !SLV[2] ^ !SLV[1] ^ mainboard) | (SLV[5] & SLV[4] & SLV[3] & SLV[2] & SLV[1] & !mainboard);
assign BEERn = (!nocollision & RESETn) ? 1'b0 : 1'bZ;

/// Steering


// Dirty hack
// Add a delay to ASn so that DBOE/DOE are held a little longer into S7
(*KEEP = "true" *) BUF ASn_buf1 (.I(ASn),.O(DASn));

// Delayed ASn needed for buffer control and DOE
// Based on the circuitry of the German A2000
// ASn/DOE/DBOE Delayed until we're in the correct phase with the custom chips

reg ASnd1; // ASn delayed until C2
reg ASnd2; // ASnd1 delayed until C7M


//always @(negedge C2n or posedge ASn)
always @(negedge C2n or posedge DASn)
begin
  if (DASn) begin
    ASnd1 <= 1;
  end else begin
    ASnd1 <= ASn;
  end
end

always @(posedge C7M or posedge DASn)
begin
  if (DASn) begin
    ASnd2 <= 1;
  end else begin
    ASnd2 <= ASnd1;
  end
end

assign DOE = !ASnd2;

// Data buffer direction control
assign D2Pn = !(
  OWNn & READ & (!SLV[1]|!SLV[2]|!SLV[3]|!SLV[4]|!SLV[5])    | // CPU reading from Zorro card
  !OWNn & !READ & SLV[1] & SLV[2] & SLV[3] & SLV[4] & SLV[5] // Zorro master writing to mainboard
`ifndef badbuster
  | !OWNn & (!SLV[1] | !SLV[2] | !SLV[3] | !SLV[4] | !SLV[5])    // Zorro to Zorro 
`endif
);

// Need to double-check this against real Buster, initial look seems to always enable the buffer for every access. need to confirm...
// Data buffer output enable
assign DBOEn = !(
/*  // Based on pal equations in A500/2000 TRM
  !ASn & !READ & BEERn & OWNn                                                              | // CPU writing to Zorro
  (!UDSn|!LDSn) & READ & !ASnd2 & BEERn & OWNn                                              | // CPU reading from Zorro
  !ASn & !READ & BEERn & !OWNn & SLV[1] & SLV[2] & SLV[3] & SLV[4] & SLV[5]                | // Zorro DMA to mainboard
  (!UDSn|!LDSn) & READ & !ASnd2 & BEERn & !OWNn & SLV[1] & SLV[2] & SLV[3] & SLV[4] & SLV[5]  // Zorro DMA from mainboard
*/
  // Observed behavior on Rev 4.4 B2000
  !DASn & !READ & BEERn
  | (!UDSn|!LDSn) & READ & !ASnd2 & BEERn   
);



// Arbitration

reg BGOLDn;
reg COPBG;
wire BGRANT;

// If BOSS asserted, switch the direction of CBG and CBR
//
// When BOSSn is not true (68K owns the bus)
//   CBR is an input  - Coprocessor signals it's bus request to Buster
//   CBG is an output - Buster signals the bus grant back to the Coprocessor
//
// When BOSSn is true (Copro has taken over)
//   CBR is an output - Bus requests are sent to the Coprocessor
//   CBG is an input  - Coprocessor signals the bus grant to Buster
//
//
assign CBGn = (BOSSn) ? COPBG : 1'bZ;
assign CBRn = (!BOSSn) ? BRn  : 1'bZ;

assign BGRANT = (BOSSn) ? BGn : CBGn;
assign GBGn   = (BOSSn) ? BGn : CBGn;


always @(posedge C7M)
begin
  BGOLDn <= BGRANT; // Store old state of BG
  
  // Generate requests & hold grants
  // Coprocessor has highest priority
  COPBG = !(( RESETn & !BGRANT & BGOLDn & BOSSn & !CBRn ) | (RESETn & !BGn & !COPBG));
  BG[1] = !(( RESETn & !BGRANT & BGOLDn & (CBRn | !BOSSn) & !BR[1] ) | (RESETn & !BGRANT & !BG[1]));
  BG[2] = !(( RESETn & !BGRANT & BGOLDn & (CBRn | !BOSSn) & BR[1] & !BR[2] ) | (RESETn & !BGRANT & !BG[2]));
  BG[3] = !(( RESETn & !BGRANT & BGOLDn & (CBRn | !BOSSn) & BR[1] & BR[2] & !BR[3] ) | (RESETn & !BGRANT & !BG[3]));
  BG[4] = !(( RESETn & !BGRANT & BGOLDn & (CBRn | !BOSSn) & BR[1] & BR[2] & BR[3] & !BR[4] ) | (RESETn & !BGRANT & !BG[4]));
  BG[5] = !(( RESETn & !BGRANT & BGOLDn & (CBRn | !BOSSn) & BR[1] & BR[2] & BR[3] & BR[4] & !BR[5] ) | (RESETn & !BGRANT & !BG[5]));
 
  BRn <= (!RESETn | ((CBRn | !BOSSn) & BR[1] & BR[2] & BR[3] & BR[4] & BR[5]));
end
endmodule
