////////////////////////////////////////////////////////////////////////////////
// Company:     Ridotech
// Engineer:    Juan Manuel Rico
// Create Date: 29/03/2020
// Module Name: soundCard.v
//
// Description: A 'sound card' with three diferents tones.
//
// Dependencies: 
//
// Revisions: 
//     0.01 - File created.
//
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////
module soundCard (
    input  wire       snd_clk,    // Sound clock.
    input  wire [1:0] channel,    // Channels of sound.
    input  wire [1:0] sound,      // Type of sound.
    output wire       right_o,    // Channel right.
    output wire       left_o      // Channel left.
);

  // Type sounds.
  localparam ping = 2'd1;
  localparam pong = 2'd2;
  localparam goal = 2'd3;

  // Channels of sound.
  localparam none  = 2'd0;
  localparam right = 2'd1;
  localparam left  = 2'd2;
  localparam both  = 2'd3;

  // Counter.
  reg [19:0] divcounter;

  // Wave sound.
  reg tick_sound;

  // Balance channels.
  assign right_o = ((channel == right) || (channel == both)) ? tick_sound : 1'b0;
  assign left_o = ((channel == left) || (channel == both)) ? tick_sound : 1'b0;

  // Generate and assign output tones.
  always @(posedge snd_clk)
  begin
    // New tick sound.
    divcounter <= divcounter + 1;

    // Check type of sound.
    case (sound)
      ping: tick_sound <= divcounter[15]; 
      pong: tick_sound <= divcounter[17]; 
      goal: tick_sound <= divcounter[18]; 
    endcase
  end

endmodule
