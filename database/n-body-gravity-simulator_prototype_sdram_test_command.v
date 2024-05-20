// This program was cloned from: https://github.com/aniketuppin/n-body-gravity-simulator
// License: Apache License 2.0

//--------------------------------------------------------------------
//
//  Author: Omkar Girish Kamath
//  Date: 11th October, 2023
//  Module: Command
//  Description: Provides command signals to the SDRAM controller
//               (ctrl.v)
//--------------------------------------------------------------------

module command (
                rst,
                clk,
                cmd,
                init_comp,
                cmd_done,
                switch,
                cmd_sent
                );

   input wire rst;
   input wire clk;
   input wire cmd_done;
   input wire init_comp;
   
   output wire [3:0] cmd;
   output reg       switch;
   output reg [1:0] cmd_sent;
   
   parameter COMMAND_LENGTH = 5;
   reg [3:0]        list [0:COMMAND_LENGTH]; // address COMMAND_LENGTH is for end nop func
   reg [3:0]        addr = 'b0;
   reg [1:0]        comp = 'b0 ;
   initial
     begin
        $readmemb("./command.bin",list);
     end
   always @(posedge init_comp or posedge clk)
     begin
        if (cmd_done == 'b1 && addr < COMMAND_LENGTH && comp != 2'b01)
          begin
             addr <= addr + 'b1;
             comp <= 2'b01;
          end
        else
          if (init_comp == 'b1 && comp == 'b0 &&addr != COMMAND_LENGTH)
            begin
               addr <= 'b0;
               comp <= 2'b10;
            end
          else
            begin
               comp <= 2'b10;
            end
     end
   
   always @(posedge clk or negedge rst)
     begin
        if (rst == 'b0)
          begin
             switch <= 'b0;
          end
        else
          begin
             switch <= 'b1;
          end
     end // always @ (posedge clk or negedge rst)

   always @(posedge clk or negedge rst)
     begin
        if (rst == 'b0)
          begin
             cmd_sent <= 2'b10;
          end
        else
          begin
             if ((cmd_done == 'b1 && cmd_sent == 2'b10) || (cmd_done == 'b0 && init_comp == 'b1 && cmd_sent == 2'b10))
               begin
                  cmd_sent <= 2'b01;
               end
             else if (cmd_sent <= 2'b01 && cmd_done == 'b0)
               begin
                  cmd_sent <= 2'b10;
               end
             else
               begin
               end
          end
     end
        
   assign cmd = list[addr];
   //assign cmd_sent = () ? ;
   
   wire debug;
   assign debug = (addr < COMMAND_LENGTH) ? 'b1:'b0;
   
endmodule
