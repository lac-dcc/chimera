// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** CPU/CS/ACAL                                                           **
** MICRO ADDR CALC UNIT                                                  **
** SHEET 17 of 50                                                        **
**                                                                       ** 
** Last reviewed: 14-APRIL-2024                                          **
** Ronny Hansen                                                          **               
***************************************************************************/


module CPU_CS_ACAL_17( 
   input         CLK,
   input [12:0]  CSA_12_0,
   input [9:0]   CSCA_9_0,
   input         MACLK,
   input         PD1,
   output [12:0] LUA_12_0,
   output [11:0] UUA_11_0
);
   

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [9:0]  s_UUA_chip_31g;
   wire [9:0]  s_UUA_chip_32g;
   wire [9:0]  s_CSCA_9_0;
   wire [7:0]  q_lua_12_7; // output from Q_7_0 on chip 30H
   wire [12:0] s_CSA_12_0;
   wire [12:0] s_LUA;
   wire [11:0] s_UUA;
   wire [7:0]  s_D_chip30h;
   wire        s_PD1;
   wire        s_LUA12;
   wire        s_LUA12_n;
   wire        s_CLK;
   wire        s_MACLK;
   

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all wiring is defined                                                 **
   *******************************************************************************/

   /*** Outputs from Chip 30H  ***/
   assign s_LUA[12] = q_lua_12_7[0];
   assign s_LUA[11] = q_lua_12_7[1];
   assign s_LUA[10] = q_lua_12_7[2];
   //assign s_LUA[9:0] =  (outputs from Chip 31F)
   
   
   assign s_UUA[11] = q_lua_12_7[5];
   assign s_UUA[10] = q_lua_12_7[6];   
   assign s_UUA[9:0] = s_LUA12 ? s_UUA_chip_32g[9:0] : s_UUA_chip_31g[9:0];

   /*** Outputs from Chip 30H  ***/

   /* Input data for chip 30H */
   assign s_D_chip30h[0] = s_CSA_12_0[12];
   assign s_D_chip30h[1] = s_CSA_12_0[11];
   assign s_D_chip30h[2] = s_CSA_12_0[10];
   assign s_D_chip30h[3] = 0;
   assign s_D_chip30h[4] = 0;
   assign s_D_chip30h[5] = s_CSA_12_0[11] | s_LUA12_n;
   assign s_D_chip30h[6] = s_CSA_12_0[10] | s_LUA12_n;
   assign s_D_chip30h[7] = 0;

   assign s_LUA12            = q_lua_12_7[0];
   assign s_LUA12_n          = ~s_LUA12; // negated

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_CSCA_9_0[9:0]   = CSCA_9_0;
   assign s_CSA_12_0[12:0]  = CSA_12_0;
   assign s_PD1             = PD1;
   assign s_MACLK           = MACLK;
   assign s_CLK             = CLK;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign LUA_12_0 = s_LUA[12:0];
   assign UUA_11_0 = s_UUA[11:0];

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/



   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/
   


   TTL_74373   CHIP_30H (.C(s_MACLK), 
                         .D(s_D_chip30h[7:0]),
                         .OC_n(s_PD1),
                         .Q(q_lua_12_7[7:0]));

   AM29841   CHIP_31F (.D(s_CSA_12_0[9:0]),
                       .LE(s_MACLK),  
                       .OE_n(s_PD1),
                       .Y(s_LUA[9:0]));

   AM29841   CHIP_32G (.D(s_CSA_12_0[9:0]),
                       .LE(s_MACLK),
                       .OE_n(s_LUA12_n),
                       .Y(s_UUA_chip_32g[9:0]));

   AM29841   CHIP_31G (.D(s_CSCA_9_0[9:0]),
                       .LE(s_CLK), 
                       .OE_n(s_LUA12),
                       .Y(s_UUA_chip_31g[9:0]));

endmodule
