// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

 /******************************************************************************
** RAM CHIP 1 MBYTE (1024KB)                                                  **
**                                                                            ** 
** This ram has PARITY bit..                                                  **
** THM91020 - http://norsk-data.com/library/libother/extern/THM91020.pdf      **
** THM91070 - http://norsk-data.com/library/libother/extern/THM91070.pdf      **
**                                                                            **
** Last reviewed: 21-APRIL-2024                                               **
** Ronny Hansen                                                               **               
********************************************************************************/

// TODO: Implement access to real RAM inside FPGA

module SIP1M9( 

// Input signals
input sysclk,      // System clock in FPGA
input sys_rst_n,   // System reset in FPGA

input [9:0] ADDRESS, // Address input
input       CAS9_n,  // Column address strobe
input       CAS_n,   // Column address strobe
input       RAS_n,   // Row address strobe
input       W_n,     // Read/Write signal


// IN and OUT signals
input  [7:0] D8, // DATA INPUT
output [7:0] Q8, // DATA OUTPUT

// Output signals
output       D9, // DATA INPUT
output       Q9, // DATA OUTPUT
output       PRD_n

);

   
   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [9:0] s_address;
   
   wire [7:0] s_D_7_0; // DATA IN
   wire [7:0] s_Q_7_0; // DATA OUT (Q)

   wire       s_d9;
   wire       s_q9;

   wire       s_cas_n;
   wire       s_ras_n;
   wire       s_cas9_n;
   wire       s_W_n;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_address[9:0] = ADDRESS;
   assign s_cas_n        = CAS_n;
   assign s_ras_n        = RAS_n;
   assign s_cas9_n       = CAS9_n;
   assign s_W_n          = W_n;
   assign s_D_7_0        = D8;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign D9        = s_d9;
   assign Q9        = s_q9;

   // TODO: Assign Q8 from some PSRAM or other RAM
   assign Q8        = W_n ? 0 : 8'b0ZZZZZZZ; // Data out is not valid when writing

   assign PRD_n     = 1; // Not connected?
   

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Ground
   assign  s_q9  =  1'b0;


endmodule
