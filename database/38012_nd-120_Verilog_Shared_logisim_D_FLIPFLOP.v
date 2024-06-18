// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : D_FLIPFLOP                                                   **
 **                                                                          **
 *****************************************************************************/

module D_FLIPFLOP( clock,
                   d,
                   preset,
                   q,
                   qBar,
                   reset,
                   tick );

   /*******************************************************************************
   ** Here all module parameters are defined with a dummy value                  **
   *******************************************************************************/
   parameter invertClockEnable = 1;

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input clock;
   input d;
   input preset;
   input reset;
   input tick;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output q;
   output qBar;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire s_clock;
   wire s_nextState;

   /*******************************************************************************
   ** The registers are defined here                                             **
   *******************************************************************************/
   reg s_currentState;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here the output signals are defined                                        **
   *******************************************************************************/
   assign q        = s_currentState;
   assign qBar     = ~(s_currentState);
   assign s_clock  = (invertClockEnable == 0) ? clock : ~clock;

   /*******************************************************************************
   ** Here the initial register value is defined; for simulation only            **
   *******************************************************************************/
   initial
   begin
      s_currentState = 0;
   end

   /*******************************************************************************
   ** Here the update logic is defined                                           **
   *******************************************************************************/
   assign s_nextState  =  d;

   /*******************************************************************************
   ** Here the actual state register is defined                                  **
   *******************************************************************************/
   /* ASYNC RESET NOT REALLY WORKING IN FPGA
   always @(posedge reset or posedge preset or posedge s_clock)
   begin
      if (reset) 
         s_currentState <= 1'b0;
      else if (preset)
         s_currentState <= 1'b1;
      else if (tick) 
         s_currentState <= s_nextState;
   end
   */

   always @(posedge s_clock)
   begin
      if (preset)  
        s_currentState <= 1'b1; // priority to pre-set
      else if (reset)
         s_currentState <= 1'b0;      
      else if (tick)
         s_currentState <= s_nextState;
   end

endmodule
