// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** CPU/MMU/PPNX                                                          **
** PPN TO IDB                                                            **
** SHEET 28 of 50                                                        **
**                                                                       ** 
** Last reviewed: 14-FEB-2024                                            **
** Ronny Hansen                                                          **
***************************************************************************/

module CPU_MMU_PPNX_28( 
   input EIPL_n,
   input EIPUR_n,
   input EIPU_n,
   input ESTOF_n,

   input  [15:0] IDB_15_0_IN,
   output [15:0] IDB_15_0_OUT,

   input  [15:0] PPN_25_10_IN,
   output [15:0] PPN_25_10_OUT
);   


wire DIR = ESTOF_n;
wire OE_U_n = EIPU_n;
wire OE_L_n = EIPL_n;

reg [15:0] PPN_reg;
reg [15:0] IDB_reg;

always @(*) begin
   IDB_reg = IDB_15_0_IN;
   PPN_reg = PPN_25_10_IN;

   if (EIPUR_n==0)
   begin
      PPN_reg[15:8] = {7'b0,IDB_15_0_IN[8]};
      PPN_reg[7:0] = PPN_25_10_IN[7:0]; 
   end


// 2x 74245 (CHIP 10B (UPPER) and 9B (LOWER))
//always @(*) begin
   

   // Upper 8 bits - CHIP 10B
   if (EIPU_n==0)
   begin
      if (DIR) begin
         // Data flows from A to B
         IDB_reg[15:8] = PPN_reg[15:8]; 
      end else begin
         // Data flows from B to A

         if (EIPUR_n==0) begin
            PPN_reg[15:8] = {7'b0,IDB_15_0_IN[8]};
         end else begin
            PPN_reg[15:8] = IDB_15_0_IN[15:8]; 
         end
      end
   /*end else begin
       PPN_reg[15:8] = PPN_25_10[15:8];
       IDB_reg[15:8] = IDB_15_0[15:8];
   */
   end

   // Lower 8 bits - CHIP 9B
   if (EIPL_n==0)
   begin
      if (DIR) begin
         IDB_reg[7:0] = PPN_reg[7:0]; // Data flows from A to B
      end else begin
         PPN_reg[7:0] = IDB_15_0_IN[7:0]; // Data flows from B to A
      end
   /*
   end else begin
       PPN_reg[7:0] = PPN_25_10[7:0];
       IDB_reg[7:0] = IDB_15_0[7:0];
   */
   end   
end

// Assign the bidirectional bus with respect to OE
assign IDB_15_0_OUT  = IDB_reg;
assign PPN_25_10_OUT = PPN_reg;


// Output to A when receiving from B with respect to OE (OE_n==1 means "isolated". Don't write to A or B)
//assign A = (OE_n == 0 && DIR == 0) ? internalBus : 8'b0;


endmodule
