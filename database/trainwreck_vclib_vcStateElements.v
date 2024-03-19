//**************************************************************************
// Verilog Components: State Elements
//--------------------------------------------------------------------------
// $Id: vcStateElements.v,v 1.1.1.1 2006/02/17 23:57:17 cbatten Exp $
//

//--------------------------------------------------------------------------
// Postive-edge triggered flip-flop 
//--------------------------------------------------------------------------

module vcDFF_pf #( parameter W = 1 ) 
(
  input              clk,      // Clock input 
  input      [W-1:0] d_p,      // Data input (sampled on rising clk edge)
  output reg [W-1:0] q_np      // Data output
);   

  always @( posedge clk ) 
    q_np <= d_p;

endmodule 

//--------------------------------------------------------------------------
// Postive-edge triggered flip-flop with reset 
//--------------------------------------------------------------------------

module vcRDFF_pf #( parameter W = 1, parameter RESET_VALUE = 0 ) 
(
  input              clk,      // Clock input 
  input              reset_p,  // Synchronous reset input (sampled on rising edge)
  input      [W-1:0] d_p,      // Data input (sampled on rising clk edge)
  output reg [W-1:0] q_np      // Data output
);   

  always @( posedge clk )
    if ( reset_p )
      q_np <= RESET_VALUE;
    else
      q_np <= d_p;

endmodule

//--------------------------------------------------------------------------
// Postive-edge triggered flip-flop with enable
//--------------------------------------------------------------------------

module vcEDFF_pf #( parameter W = 1 ) 
(
  input              clk,     // Clock input
  input      [W-1:0] d_p,     // Data input (sampled on rising clk edge)
  input              en_p,    // Enable input (sampled on rising clk edge)
  output reg [W-1:0] q_np     // Data output
);   

  always @( posedge clk )
    if ( en_p ) q_np <= d_p;

endmodule

//--------------------------------------------------------------------------
// Postive-edge triggered flip-flop with enable and reset
//--------------------------------------------------------------------------

module vcERDFF_pf #( parameter W = 1, parameter RESET_VALUE = 0 ) 
(
  input              clk,     // Clock input
  input              reset_p, // Synchronous reset input (sampled on rising edge)
  input      [W-1:0] d_p,     // Data input (sampled on rising clk edge)
  input              en_p,    // Enable input (sampled on rising clk edge)
  output reg [W-1:0] q_np     // Data output
);   

  always @( posedge clk )
    if ( reset_p )
      q_np <= RESET_VALUE;
    else if ( en_p ) 
      q_np <= d_p;

endmodule

//--------------------------------------------------------------------------
// Negative-edge triggered flip-flop 
//--------------------------------------------------------------------------

module vcDFF_nf #( parameter W = 1 ) 
(
  input              clk,     // Clock input 
  input      [W-1:0] d_p,     // Data input (sampled on rising clk edge)
  output reg [W-1:0] q_np     // Data output (sampled on rising clk edge)
);   

  always @( posedge clk ) 
    q_np <= d_p;
  
endmodule

//--------------------------------------------------------------------------
// Negative-edge triggered flip-flop with enable
//--------------------------------------------------------------------------

module vcEDFF_nf #( parameter W = 1 ) 
(
  input              clk,    // Clock input
  input      [W-1:0] d_n,    // Data input (sampled on falling clk edge)
  input              en_n,   // Enable input (sampled on falling clk edge)
  output reg [W-1:0] q_pn    // Data output  
);   

  always @( posedge clk )
    if ( en_n ) q_pn <= d_n;
  
endmodule

//--------------------------------------------------------------------------
// Level-High Latch
//--------------------------------------------------------------------------

module vcLatch_hl #( parameter W = 1 ) 
(
  input              clk,    // Clock input  
  input      [W-1:0] d_n,    // Data input (sampled on falling clk edge)
  output reg [W-1:0] q_np    // Data output
);                           

  always @(*)
    if ( clk ) q_np <= d_n;
  
endmodule

//--------------------------------------------------------------------------
// Level-High Latch with Enable
//--------------------------------------------------------------------------

module vcELatch_hl #( parameter W = 1 ) 
(
  input              clk,    // Clock input
  input              en_p,   // Enable input (sampled on rising clk edge)
  input      [W-1:0] d_n,    // Data input (sampled on falling clk edge)
  output reg [W-1:0] q_np    // Data output
);   

  // We latch the enable signal with a level-low latch to make sure
  // that it is stable for the entire time clock is high.
  
  reg en_latched_pn;
  always @(*)
    if ( ~clk ) en_latched_pn <= en_p;

  always @(*)
     if ( clk && en_latched_pn ) q_np <= d_n;
  
endmodule

//--------------------------------------------------------------------------
// Level-Low Latch
//--------------------------------------------------------------------------

module vcLatch_ll #( parameter W = 1 ) 
(
  input              clk,    // Clock input  
  input      [W-1:0] d_p,    // Data input (sampled on rising clk edge)
  output reg [W-1:0] q_pn    // Data output
);                           

  always @(*)
    if ( ~clk ) q_pn <= d_p;
  
endmodule

//--------------------------------------------------------------------------
// Level-Low Latch with Enable
//--------------------------------------------------------------------------

module vcELatch_ll #( parameter W = 1 ) 
(
  input              clk,    // Clock input
  input              en_n,   // Enable input (sampled on falling clk edge)
  input      [W-1:0] d_p,    // Data input (sampled on rising clk edge)
  output reg [W-1:0] q_pn    // Data output
);   

  // We latch the enable signal with a level-high latch to make sure
  // that it is stable for the entire time clock is low.
  
  reg en_latched_np;
  always @(*)
    if ( clk ) en_latched_np <= en_n;

  always @(*)
     if ( ~clk && en_latched_np ) q_pn <= d_p;
  
endmodule

