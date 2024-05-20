// This program was cloned from: https://github.com/Qubitbytesltd/tt06-its-alive
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Qubitbytes Ltd
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none


module sound_processor (
    input wire clk,
    input wire rst,
    input wire [15:0] ticks_per_milli,
    input wire [9:0] freq,
    output reg sound
);
  reg [31:0] tick_counter;
  wire [31:0] ticks_per_second = ticks_per_milli * 1000;

  always @(posedge clk) begin
    if (rst) begin
      tick_counter <= 0;
      sound <= 0;
    end else if (freq == 0) begin
      sound <= 0;
    end else begin
        tick_counter <= tick_counter + {22'b0,freq};
      if (tick_counter >= (ticks_per_second >> 1)) begin
        sound <= !sound;
        tick_counter <= tick_counter + {22'b0,freq} - (ticks_per_second >> 1);
      end
    end
  end

endmodule

module music_processor (
    input wire clk,
    input wire rst,
    input wire [15:0] ticks_per_milli,
    output reg [7:0] led,
    output reg sound
);

  reg [9:0] notelength;
  wire [9:0] beatlength; // determines tempo
  assign beatlength = 100;

  reg [5:0] a; // part index
  reg [5:0] b; // song index

// // Parts 1 and 2 (Intro) - notes
wire [5:0]  Part_1_2;
assign Part_1_2 = 12;

wire [9:0] song1_intro_melody[12:0];
// Assign each element of melody array
assign song1_intro_melody[0] = 554;   // c5s
assign song1_intro_melody[1] = 622;   // e5f
assign song1_intro_melody[2] = 622;   // e5f
assign song1_intro_melody[3] = 698;   // f5
assign song1_intro_melody[4] = 831;   // a5f
assign song1_intro_melody[5] = 740;   // f5s
assign song1_intro_melody[6] = 698;   // f5
assign song1_intro_melody[7] = 622;   // e5f
assign song1_intro_melody[8] = 554;   // c5s
assign song1_intro_melody[9] = 622;   // e5f
assign song1_intro_melody[10] = 0;   // rest
assign song1_intro_melody[11] = 415;  // a4f
assign song1_intro_melody[12] = 415;  // a4f

wire [9:0] SONG1_INTRO_RHYTHM[12:0];
assign SONG1_INTRO_RHYTHM[0] = 6;
assign SONG1_INTRO_RHYTHM[1] = 10;
assign SONG1_INTRO_RHYTHM[2] = 6;
assign SONG1_INTRO_RHYTHM[3] = 6;
assign SONG1_INTRO_RHYTHM[4] = 1;
assign SONG1_INTRO_RHYTHM[5] = 1;
assign SONG1_INTRO_RHYTHM[6] = 1;
assign SONG1_INTRO_RHYTHM[7] = 1;
assign SONG1_INTRO_RHYTHM[8] = 6;
assign SONG1_INTRO_RHYTHM[9] = 10;
assign SONG1_INTRO_RHYTHM[10] = 4;
assign SONG1_INTRO_RHYTHM[11] = 2;
assign SONG1_INTRO_RHYTHM[12] = 10;

// Parts 3 or 5 (Verse 1)
wire [5:0]  Part_3_5;
assign Part_3_5 = 62;


wire [9:0] song1_verse1_melody[62:0];
// Assign each element of melody array
assign song1_verse1_melody[0]  = 0;    // rest
assign song1_verse1_melody[1]  = 277;   // c4s
assign song1_verse1_melody[2]  = 277;   // c4s
assign song1_verse1_melody[3]  = 277;   // c4s
assign song1_verse1_melody[4]  = 277;   // c4s
assign song1_verse1_melody[5]  = 311;   // e4f
assign song1_verse1_melody[6]  = 0;    // rest
assign song1_verse1_melody[7]  = 261;   // c4
assign song1_verse1_melody[8]  = 233;   // b3f
assign song1_verse1_melody[9]  = 208;   // a3f
assign song1_verse1_melody[10] = 0;    // rest
assign song1_verse1_melody[11] = 233;   // b3f
assign song1_verse1_melody[12] = 233;   // b3f
assign song1_verse1_melody[13] = 261;   // c4
assign song1_verse1_melody[14] = 277;   // c4s
assign song1_verse1_melody[15] = 208;   // a3f
assign song1_verse1_melody[16] = 415;   // a4f
assign song1_verse1_melody[17] = 415;   // a4f
assign song1_verse1_melody[18] = 311;   // e4f
assign song1_verse1_melody[19] = 0;    // rest
assign song1_verse1_melody[20] = 233;   // b3f
assign song1_verse1_melody[21] = 233;   // b3f
assign song1_verse1_melody[22] = 261;   // c4
assign song1_verse1_melody[23] = 277;   // c4s
assign song1_verse1_melody[24] = 233;   // b3f
assign song1_verse1_melody[25] = 277;   // c4s
assign song1_verse1_melody[26] = 311;   // e4f
assign song1_verse1_melody[27] = 0;    // rest
assign song1_verse1_melody[28] = 261;   // c4
assign song1_verse1_melody[29] = 233;   // b3f
assign song1_verse1_melody[30] = 233;   // b3f
assign song1_verse1_melody[31] = 208;   // a3f
assign song1_verse1_melody[32] = 0;    // rest
assign song1_verse1_melody[33] = 233;   // b3f
assign song1_verse1_melody[34] = 233;   // b3f
assign song1_verse1_melody[35] = 261;   // c4
assign song1_verse1_melody[36] = 277;   // c4s
assign song1_verse1_melody[37] = 208;   // a3f
assign song1_verse1_melody[38] = 208;   // a3f
assign song1_verse1_melody[39] = 311;   // e4f
assign song1_verse1_melody[40] = 311;   // e4f
assign song1_verse1_melody[41] = 311;   // e4f
assign song1_verse1_melody[42] = 349;   // f4
assign song1_verse1_melody[43] = 311;   // e4f
assign song1_verse1_melody[44] = 277;   // c4s
assign song1_verse1_melody[45] = 311;   // e4f
assign song1_verse1_melody[46] = 349;   // f4
assign song1_verse1_melody[47] = 277;   // c4s
assign song1_verse1_melody[48] = 311;   // e4f
assign song1_verse1_melody[49] = 311;   // e4f
assign song1_verse1_melody[50] = 311;   // e4f
assign song1_verse1_melody[51] = 349;   // f4
assign song1_verse1_melody[52] = 311;   // e4f
assign song1_verse1_melody[53] = 208;   // a3f
assign song1_verse1_melody[54] = 0;    // rest
assign song1_verse1_melody[55] = 233;   // b3f
assign song1_verse1_melody[56] = 261;   // c4
assign song1_verse1_melody[57] = 277;   // c4s
assign song1_verse1_melody[58] = 208;   // a3f
assign song1_verse1_melody[59] = 0;    // rest
assign song1_verse1_melody[60] = 311;   // e4f
assign song1_verse1_melody[61] = 349;   // f4
assign song1_verse1_melody[62] = 311;   // e4f

wire [9:0] song1_verse1_rhythm[62:0];
// Assign each element of rhythm array
assign song1_verse1_rhythm[0] = 6;
assign song1_verse1_rhythm[1] = 1;
assign song1_verse1_rhythm[2] = 1;
assign song1_verse1_rhythm[3] = 1;
assign song1_verse1_rhythm[4] = 1;
assign song1_verse1_rhythm[5] = 2;
assign song1_verse1_rhythm[6] = 1;
assign song1_verse1_rhythm[7] = 1;
assign song1_verse1_rhythm[8] = 1;
assign song1_verse1_rhythm[9] = 5;
assign song1_verse1_rhythm[10] = 1;
assign song1_verse1_rhythm[11] = 1;
assign song1_verse1_rhythm[12] = 1;
assign song1_verse1_rhythm[13] = 1;
assign song1_verse1_rhythm[14] = 3;
assign song1_verse1_rhythm[15] = 1;
assign song1_verse1_rhythm[16] = 2;
assign song1_verse1_rhythm[17] = 1;
assign song1_verse1_rhythm[18] = 5;
assign song1_verse1_rhythm[19] = 1;
assign song1_verse1_rhythm[20] = 1;
assign song1_verse1_rhythm[21] = 1;
assign song1_verse1_rhythm[22] = 1;
assign song1_verse1_rhythm[23] = 1;
assign song1_verse1_rhythm[24] = 1;
assign song1_verse1_rhythm[25] = 1;
assign song1_verse1_rhythm[26] = 2;
assign song1_verse1_rhythm[27] = 1;
assign song1_verse1_rhythm[28] = 1;
assign song1_verse1_rhythm[29] = 1;
assign song1_verse1_rhythm[30] = 1;
assign song1_verse1_rhythm[31] = 3;
assign song1_verse1_rhythm[32] = 1;
assign song1_verse1_rhythm[33] = 1;
assign song1_verse1_rhythm[34] = 1;
assign song1_verse1_rhythm[35] = 1;
assign song1_verse1_rhythm[36] = 2;
assign song1_verse1_rhythm[37] = 1;
assign song1_verse1_rhythm[38] = 1;
assign song1_verse1_rhythm[39] = 1;
assign song1_verse1_rhythm[40] = 1;
assign song1_verse1_rhythm[41] = 1;
assign song1_verse1_rhythm[42] = 1;
assign song1_verse1_rhythm[43] = 4;
assign song1_verse1_rhythm[44] = 5;
assign song1_verse1_rhythm[45] = 1;
assign song1_verse1_rhythm[46] = 1;
assign song1_verse1_rhythm[47] = 1;
assign song1_verse1_rhythm[48] = 1;
assign song1_verse1_rhythm[49] = 1;
assign song1_verse1_rhythm[50] = 1;
assign song1_verse1_rhythm[51] = 1;
assign song1_verse1_rhythm[52] = 2;
assign song1_verse1_rhythm[53] = 2;
assign song1_verse1_rhythm[54] = 2;
assign song1_verse1_rhythm[55] = 1;
assign song1_verse1_rhythm[56] = 1;
assign song1_verse1_rhythm[57] = 1;
assign song1_verse1_rhythm[58] = 3;
assign song1_verse1_rhythm[59] = 1;
assign song1_verse1_rhythm[60] = 1;
assign song1_verse1_rhythm[61] = 1;
assign song1_verse1_rhythm[62] = 3;



// Parts 4 or 6 (Chorus)
wire [5:0]  Part_4_6;
assign Part_4_6 = 58;

wire [9:0] song1_chorus_melody[58:0];
// Assign each element of melody array
assign song1_chorus_melody[0]  = 466;  // b4f
assign song1_chorus_melody[1]  = 466;  // b4f
assign song1_chorus_melody[2]  = 415;  // a4f
assign song1_chorus_melody[3]  = 415;  // a4f
assign song1_chorus_melody[4]  = 698;  // f5
assign song1_chorus_melody[5]  = 698;  // f5
assign song1_chorus_melody[6]  = 622;  // e5f
assign song1_chorus_melody[7]  = 466;  // b4f
assign song1_chorus_melody[8]  = 466;  // b4f
assign song1_chorus_melody[9]  = 415;  // a4f
assign song1_chorus_melody[10] = 415;  // a4f
assign song1_chorus_melody[11] = 622;  // e5f
assign song1_chorus_melody[12] = 622;  // e5f
assign song1_chorus_melody[13] = 554;  // c5s
assign song1_chorus_melody[14] = 523;  // c5
assign song1_chorus_melody[15] = 466;  // b4f
assign song1_chorus_melody[16] = 554;  // c5s
assign song1_chorus_melody[17] = 554;  // c5s
assign song1_chorus_melody[18] = 554;  // c5s
assign song1_chorus_melody[19] = 554;  // c5s
assign song1_chorus_melody[20] = 554;  // c5s
assign song1_chorus_melody[21] = 622;  // e5f
assign song1_chorus_melody[22] = 523;  // c5
assign song1_chorus_melody[23] = 466;  // b4f
assign song1_chorus_melody[24] = 415;  // a4f
assign song1_chorus_melody[25] = 415;  // a4f
assign song1_chorus_melody[26] = 415;  // a4f
assign song1_chorus_melody[27] = 622;  // e5f
assign song1_chorus_melody[28] = 554;  // c5s
assign song1_chorus_melody[29] = 466;  // b4f
assign song1_chorus_melody[30] = 466;  // b4f
assign song1_chorus_melody[31] = 415;  // a4f
assign song1_chorus_melody[32] = 415;  // a4f
assign song1_chorus_melody[33] = 698;  // f5
assign song1_chorus_melody[34] = 698;  // f5
assign song1_chorus_melody[35] = 622;  // e5f
assign song1_chorus_melody[36] = 466;  // b4f
assign song1_chorus_melody[37] = 466;  // b4f
assign song1_chorus_melody[38] = 415;  // a4f
assign song1_chorus_melody[39] = 415;  // a4f
assign song1_chorus_melody[40] = 831;  // a5f
assign song1_chorus_melody[41] = 523;  // c5
assign song1_chorus_melody[42] = 554;  // c5s
assign song1_chorus_melody[43] = 523;  // c5
assign song1_chorus_melody[44] = 466;  // b4f
assign song1_chorus_melody[45] = 554;  // c5s
assign song1_chorus_melody[46] = 554;  // c5s
assign song1_chorus_melody[47] = 554;  // c5s
assign song1_chorus_melody[48] = 554;  // c5s
assign song1_chorus_melody[49] = 554;  // c5s
assign song1_chorus_melody[50] = 622;  // e5f
assign song1_chorus_melody[51] = 523;  // c5
assign song1_chorus_melody[52] = 466;  // b4f
assign song1_chorus_melody[53] = 415;  // a4f
assign song1_chorus_melody[54] = 0;   // rest
assign song1_chorus_melody[55] = 415;  // a4f
assign song1_chorus_melody[56] = 622;  // e5f
assign song1_chorus_melody[57] = 554;  // c5s
assign song1_chorus_melody[58] = 0;   // rest;

wire [9:0] song1_chorus_rhythm[58:0];
// Assign each element of rhythm array
assign song1_chorus_rhythm[0]  = 1;
assign song1_chorus_rhythm[1]  = 1;
assign song1_chorus_rhythm[2]  = 1;
assign song1_chorus_rhythm[3]  = 1;
assign song1_chorus_rhythm[4]  = 3;
assign song1_chorus_rhythm[5]  = 3;
assign song1_chorus_rhythm[6]  = 6;
assign song1_chorus_rhythm[7]  = 1;
assign song1_chorus_rhythm[8]  = 1;
assign song1_chorus_rhythm[9]  = 1;
assign song1_chorus_rhythm[10] = 1;
assign song1_chorus_rhythm[11] = 3;
assign song1_chorus_rhythm[12] = 3;
assign song1_chorus_rhythm[13] = 3;
assign song1_chorus_rhythm[14] = 1;
assign song1_chorus_rhythm[15] = 2;
assign song1_chorus_rhythm[16] = 1;
assign song1_chorus_rhythm[17] = 1;
assign song1_chorus_rhythm[18] = 1;
assign song1_chorus_rhythm[19] = 1;
assign song1_chorus_rhythm[20] = 3;
assign song1_chorus_rhythm[21] = 3;
assign song1_chorus_rhythm[22] = 3;
assign song1_chorus_rhythm[23] = 1;
assign song1_chorus_rhythm[24] = 2;
assign song1_chorus_rhythm[25] = 2;
assign song1_chorus_rhythm[26] = 2;
assign song1_chorus_rhythm[27] = 4;
assign song1_chorus_rhythm[28] = 8;
assign song1_chorus_rhythm[29] = 1;
assign song1_chorus_rhythm[30] = 1;
assign song1_chorus_rhythm[31] = 1;
assign song1_chorus_rhythm[32] = 1;
assign song1_chorus_rhythm[33] = 3;
assign song1_chorus_rhythm[34] = 3;
assign song1_chorus_rhythm[35] = 6;
assign song1_chorus_rhythm[36] = 1;
assign song1_chorus_rhythm[37] = 1;
assign song1_chorus_rhythm[38] = 1;
assign song1_chorus_rhythm[39] = 1;
assign song1_chorus_rhythm[40] = 3;
assign song1_chorus_rhythm[41] = 3;
assign song1_chorus_rhythm[42] = 3;
assign song1_chorus_rhythm[43] = 1;
assign song1_chorus_rhythm[44] = 2;
assign song1_chorus_rhythm[45] = 1;
assign song1_chorus_rhythm[46] = 1;
assign song1_chorus_rhythm[47] = 1;
assign song1_chorus_rhythm[48] = 1;
assign song1_chorus_rhythm[49] = 3;
assign song1_chorus_rhythm[50] = 3;
assign song1_chorus_rhythm[51] = 3;
assign song1_chorus_rhythm[52] = 1;
assign song1_chorus_rhythm[53] = 2;
assign song1_chorus_rhythm[54] = 2;
assign song1_chorus_rhythm[55] = 2;
assign song1_chorus_rhythm[56] = 4;
assign song1_chorus_rhythm[57] = 8;
assign song1_chorus_rhythm[58] = 4;



  reg  [1:0] delay;
  reg  [15:0] tick_counter;
  reg  [9:0] millis_counter;
  reg  [9:0] sound_freq;


  sound_processor sound_processor (
      .clk(clk),
      .rst(rst),
      .ticks_per_milli(ticks_per_milli),
      .freq(sound_freq),
      .sound(sound)
  );

  always @(posedge clk) begin
    if (rst) begin
      tick_counter <= 0;
      millis_counter <= 0;
      sound_freq <= 0;
      a <= 4;
      b <= 0;
      notelength <= 0;
      delay <= 0;
    end else begin
      tick_counter <= tick_counter + 1;

      if (tick_counter == ticks_per_milli) begin
        tick_counter   <= 0;
        millis_counter <= millis_counter + 1;
      end
        
          // part 1 and 2
        if (delay == 0) begin
          if (a == 1 || a == 2) begin
            notelength <= beatlength * SONG1_INTRO_RHYTHM[b[3:0]];
            if (song1_intro_melody[b[3:0]] >0) begin
              sound_freq <= song1_intro_melody[b[3:0]];
              delay <= 1;
            end
            b <= b + 1;
            if (b >= Part_1_2) begin
              a <= a + 1;
              b <= 0;
            end
          end
          // part 3 and 5
          else if (a == 3 || a == 5) begin
            notelength <= beatlength * 2 * song1_verse1_rhythm[b];
            if (song1_verse1_melody[b] > 0) begin
              sound_freq <= song1_verse1_melody[b];
              delay <= 1;
            end
            b <= b + 1;
            if (b >= Part_3_5) begin
              a <= a + 1;
              b <= 0;
            end
          end
          // part 4 and 6
          else if (a == 4 || a == 6) begin
            notelength <= beatlength * song1_chorus_rhythm[b];
            if (song1_chorus_melody[b] >0) begin
              sound_freq <= song1_chorus_melody[b];
              delay <= 1;
            end
            b <= b + 1;
            if (b >= Part_4_6) begin
              a <= a + 1;
              b <= 0;
            end
          end
          millis_counter <= 0;
         end
      

    if (millis_counter == notelength && delay == 1) begin
          delay <= 2;
          sound_freq <= 0;
          millis_counter <= 0;
    end
    else if (millis_counter == notelength / 3 && delay == 2) begin
      delay <= 0;   
    end

    if (a == 7) begin
            sound_freq <= 0;
            millis_counter <= 0;
            notelength <= 0;
            a <= 1;
          end    
    end   
 end
     // instantiate segment display
  seg7 seg7(.counter(a[3:0]), .segments(led[6:0]));
  segdot segdot (.enable(delay),.dot_segment(led[7]));
endmodule


// leg segment dot 
module segdot (
    input wire [1:0] enable,
    output reg dot_segment
);
always @(*) begin   
    if (enable == 1) begin
        dot_segment = 1'b1;
    end
    else begin
        dot_segment = 1'b0;
    end
end
endmodule
     
               

// led segment
/*
      -- 1 --
     |       |
     6       2
     |       |
      -- 7 --
     |       |
     5       3
     |       |
      -- 4 --
*/


module seg7 (
    input wire [3:0] counter,
    output reg [6:0] segments
);

    always @(*) begin
        case(counter)
            //                7654321
            0:  segments = 7'b0111111;
            1:  segments = 7'b0000110;
            2:  segments = 7'b1011011;
            3:  segments = 7'b1001111;
            4:  segments = 7'b1100110;
            5:  segments = 7'b1101101;
            6:  segments = 7'b1111100;
            7:  segments = 7'b0000111;
            8:  segments = 7'b1111111;
            9:  segments = 7'b1100111;
            default:    
                segments = 7'b0000000;
        endcase
    end

endmodule
