// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** CPU/CS/TCV                                                            **
** CS TRANSCEIVERS                                                       **
** SHEET 20 of 50                                                        **
**                                                                       ** 
** Last reviewed: 14-APRIL-2024                                          **
** Ronny Hansen                                                          **               
***************************************************************************/

module CPU_CS_TCV_20(
                      input  [63:0] CSBITS,
                      output [63:0] CSBITS_OUT,

                      input  [15:0] IDB_15_0_IN,
                      output [15:0] IDB_15_0_OUT,

                      input         ECSL_n,
                      input         WCS_n,
                      input [3:0]   EW_3_0_n // output enable signals                                      
                      );

   

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   reg [63:0] regCSBITS;   
   reg [15:0] regIDB_out;

   
   // WCS_n decides is its DIR-ection of the data from CSBITS => IDB or CSBITS <= IDB
   wire DIR; //  DIR = H (A to B - CSBITS to IDB)  or DIR = L (B to A - IDB to CSBITS)
   assign DIR = WCS_n;
   
   always @(*) begin
      
      regIDB_out  = 0;
      regCSBITS = 0;

      if (EW_3_0_n[0] == 0) begin         
         if (DIR) begin 
            regIDB_out = regIDB_out | CSBITS[15:0];
         end else begin            
            regCSBITS[15:0]  = IDB_15_0_IN;
         end         
      end
      
      if (EW_3_0_n[1] == 0) begin    
         if (DIR) begin 
            regIDB_out = regIDB_out | CSBITS[31:16];            
         end else begin
            regCSBITS[31:16]  = IDB_15_0_IN;
         end         
      end 
      
      if (EW_3_0_n[2] == 0) begin         
         if (DIR) begin 
            regIDB_out = regIDB_out | CSBITS[47:32];
         end else begin
            regCSBITS[47:32]  = IDB_15_0_IN;            
         end         
      end 
      
      if (EW_3_0_n[3] == 0) begin         
         if (DIR) begin 
            regIDB_out = regIDB_out |CSBITS[63:48];
         end else begin
            regCSBITS[63:48] = IDB_15_0_IN;            
         end         
      end         
   
   end


   // Write to CSBITS from IDB
   //assign s_csbits_15_0  = (!WCS_n & !EW_3_0_n[0]) ? IDB_15_0_IN : CSBITS[15:0];
   //assign s_csbits_31_16 = (!WCS_n & !EW_3_0_n[1]) ? IDB_15_0_IN : CSBITS[31:16];
   //assign s_csbits_47_32 = (!WCS_n & !EW_3_0_n[2]) ? IDB_15_0_IN : CSBITS[47:32]; 
   //assign s_csbits_63_48 = (!WCS_n & !EW_3_0_n[3]) ? IDB_15_0_IN : CSBITS[63:48];

   

   // Write to IDB from CSBITS
   //assign regidb = EW_3_0_n[0] ? 16'b0 : CSBITS[15:0];   
   //assign regidb = EW_3_0_n[1] ? 16'b0 : CSBITS[31:16];   
   //assign regidb = EW_3_0_n[2] ? 16'b0 : CSBITS[47:32];
   //assign regidb = EW_3_0_n[3] ? 16'b0 : CSBITS[63:48];
 


   // ECSL_n decides if the data should be enabled out (on the IDB bus and the CSBITS output bus)
   //assign IDB_15_0_OUT = (ECSL_n & !WCS_n) ? 16'b0 : regIDB[15:0];   
   assign IDB_15_0_OUT = (ECSL_n | !WCS_n) ? 16'b0 : regIDB_out[15:0];   

   //assign CSBITS_OUT[63:0] = (ECSL_n & WCS_n) ? 64'b0 : regCSBITS[63:0];
   //assign CSBITS_OUT[63:0] = (WCS_n) ? 64'b0 : regCSBITS[63:0];
   assign CSBITS_OUT[63:0] = regCSBITS;
   

endmodule
