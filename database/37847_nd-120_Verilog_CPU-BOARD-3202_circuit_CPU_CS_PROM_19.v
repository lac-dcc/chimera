// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** CPU/CS/PROM                                                           **
** PROMS                                                                 **
** SHEET 19 of 50                                                        **
**                                                                       ** 
** Last reviewed: 21-APRIL-2024                                          **
** Ronny Hansen                                                          **               
***************************************************************************/


module CPU_CS_PROM_19( 
                       input BLCS_n,         // Set to 0 to enable the output to IDB
                       input [1:0]  RF_1_0,  // Selects which of the 4 16 bit's of the microcoe to fetch
                       input [12:0] LUA_12_0, // Address of the microcode to fetch
                       
                       output [15:0] IDB_15_0_OUT // The 16 bit microcode word
                       );


   wire [14:0] s_Address;
   wire [15:0] s_databus;

   assign s_Address = {LUA_12_0, RF_1_0};  // Concatenate the bits to form a 15-bit address

    // AM27256_45132L = Contains the LO 8 bits (0-7) AM27256_45133L = Contains the HI 8 bits (8-15)


    (* ROM_STYLE="BLOCK" *)
    reg [7:0] rom_lo [32767:0]; // 32K x 8 bit ROM (LO 8 bits)
    initial $readmemh("AM27256_45132L.hex", rom_lo, 0, 32767);


    (* ROM_STYLE="BLOCK" *)
    reg [7:0] rom_hi [32767:0]; // 32K x 8 bit ROM (HI 8 bits)    
    initial $readmemh("AM27256_45133L.hex", rom_hi, 0, 32767);

    assign s_databus[7:0]  = rom_lo[s_Address];
    assign s_databus[15:8] = rom_hi[s_Address];

    // Controlled Buffer
    assign IDB_15_0_OUT = (BLCS_n) ? 16'b0 : s_databus;


endmodule
