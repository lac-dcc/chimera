////////////////////////////////////////////////////////////////////////////////
// Company:     Ridotech
// Engineer:    Juan Manuel Rico
// Create Date: 29/03/2020
// Module Name: ctlButtons.v
//
// Description: Control player positions with buttons.
//
// Dependencies: 
//
// Revisions: 
//     0.01 - File created.
//
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////
module ctlButtons #(parameter speed = 1)
(
   input  wire       clk,
   input  wire       ply1_up,
   input  wire       ply1_down,
   input  wire       ply2_up,
   input  wire       ply2_down,
   output wire [9:0] pos_ply1,
   output wire [9:0] pos_ply2
);
   // Parameters for vertical players.
   parameter screen_height = 600;
   parameter tope_sup = 5;
   parameter tope_inf = screen_height - 10;

   // Memory positions.
   reg [9:0] reg1 = 100;
   reg [9:0] reg2 = 100;

   assign pos_ply1 = reg1;
   assign pos_ply2 = reg2;

   always @(posedge clk)
   begin
      if (ply1_up)   reg1 <= reg1 - speed;
      if (ply1_down) reg1 <= reg1 + speed;
      if (ply2_up)   reg2 <= reg2 - speed;
      if (ply2_down) reg2 <= reg2 + speed;
      if (reg1 < tope_sup) reg1 <= tope_sup; 
      if (reg2 < tope_sup) reg2 <= tope_sup;
      if (reg1 > tope_inf) reg1 <= tope_inf;
      if (reg2 > tope_inf) reg2 <= tope_inf;
   end

endmodule
