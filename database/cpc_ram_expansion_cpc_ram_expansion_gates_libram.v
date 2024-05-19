// This program was cloned from: https://github.com/revaldinho/cpc_ram_expansion
// License: GNU General Public License v3.0

/*
 * libram.v
 * 
 * Verilog models for simulation of RAM/ROM ICs
 * 
 */


`ifdef DELAY_SIM
  `define OUTPUT_DELAY 55
  `define HOLD_DELAY    5
`else
  `define OUTPUT_DELAY 0
  `define HOLD_DELAY   0
`endif





// bs62lv4006 512Kx8 SRAM
module bs62lv4006 (
                   web,
                   oeb,
                   csb,                   
                   a18,
                   a17,  
                   a16,  
                   a15,   
                   a14,
                   a13,  
                   a12,  
                   a11,
                   a10,                      
                   a9,   
                   a8,   
                   a7,   
                   a6,   
                   a5,   
                   a4,   
                   a3,   
                   a2,   
                   a1,   
                   a0,
                   d7,
                   d6,
                   d5,
                   d4,                   
                   d3,                   
                   d2,   
                   d1,   
                   d0,   
                   vss,
                   vcc,
                   );
  
  input web;
  input oeb;
  input csb;
  input a18,a17,a16,a15,a14,a13,a12,a11,a10,a9,a8;
  input a7,a6,a5,a4,a3,a2,a1,a0;                  
  input vss;
  input vcc;
  inout d7,d6,d5,d4,d3,d2,d1,d0;
  
  reg [7:0] mem [ 524288:0 ] ;
  reg [7:0] dout;
  
  
  wire [18:0] addr  = {a18,a17,a16,a15,a14,a13,a12,a11,a10,a9,a8,a7,a6,a5,a4,a3,a2,a1,a0};
   
  assign {d7,d6,d5,d4,d3,d2,d1,d0} =  (!csb && !oeb)? mem[addr]: 8'bz ;    

  always @ ( * )
    if (!web && !csb )
      mem[addr] <= {d7,d6,d5,d4,d3,d2,d1,d0} ;

endmodule
