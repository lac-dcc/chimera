/*
 * Copyright 2019 International Business Machines
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
`timescale 1ns/1ps

`include "snap_global_vars.v"

module brdg_partial_sequencer (
                          input             clk              ,
                          input             rst_n            ,
                          input             partial_en       ,
                          input      [63:0] strobe           ,
                          input             strobe_valid     ,
                          output reg [02:0] partial_len      ,
                          output reg [05:0] partial_ea       ,
                          output            partial_valid    ,
                          output reg [04:0] partial_cnt      ,
                          output            partial_done   
                          );


 reg  [08:0] cstate, nstate;
 reg  [63:0] sub_strb;
 wire        part_cmd_match;
 wire        part_all_nil;
 reg  [05:0] part_cmd_cyc;
 wire [63:0] partial_32B_done_mask;
 wire [63:0] partial_16B_done_mask;
 wire [63:0] partial_8B_done_mask;
 wire [63:0] partial_4B_done_mask;
 wire [63:0] partial_2B_done_mask;
 wire [63:0] partial_1B_done_mask;
 reg         partial_valid_pre1;
 reg         partial_valid_pre2;
 reg         partial_valid_pending;


// states
 parameter IDLE        = 9'h001, 
           CHK_PART_XB = 9'h002,    
           WR_CMD_XB   = 9'h004,          
           WR_VLD_XB   = 9'h008,          
           WR_RSP_XB   = 9'h010,    
           CYC_UPDATE  = 9'h020,          
           DONE        = 9'h040,
           RETRY       = 9'h080,
           FAILED      = 9'h100;



//-----------------------------------------------------------------------------------------------------------------
// ALL-ONES SECTION DECODE
// * Filter out all-ones in 2's power aligned sections of the strobe signal.
// * As long as the decoded signal is not all-zero, partial write/read can be done with corresponding partial length.
//   e.g. if m_32B = 2'b0; m_16B = 4'b0; m_8B = 8'd7; m_4B = 16'd0; m_2B = 32'h0001_0fff; m_1B = ...., the next 
//        partial write/read length would be 8B.
//-----------------------------------------------------------------------------------------------------------------

 wire[63:00] m_1B;
 wire[31:00] m_2B;
 wire[15:00] m_4B;
 wire[07:00] m_8B;
 wire[03:00] m_16B;
 wire[01:00] m_32B;

 genvar i;
 generate
   for(i = 0; i < 64; i = i+1)
     begin : gen_all_ones
                       assign m_1B[i]       =   sub_strb[i];
       if (i%2  == 0)  assign m_2B[(i/2)]   =   &(sub_strb[i+1:i]  & 2'h3)          ;//: m_2B[(i/2)]   ;
       if (i%4  == 0)  assign m_4B[(i/4)]   =   &(sub_strb[i+3:i]  & 4'hF)          ;//: m_4B[(i/4)]   ;
       if (i%8  == 0)  assign m_8B[(i/8)]   =   &(sub_strb[i+7:i]  & 8'hFF)         ;//: m_8B[(i/8)]   ;
       if (i%16 == 0)  assign m_16B[(i/16)] =   &(sub_strb[i+15:i] & 16'hFFFF)      ;//: m_16B[(i/16)] ;
       if (i%32 == 0)  assign m_32B[(i/32)] =   &(sub_strb[i+31:i] & 32'hFFFF_FFFF) ;//: m_32B[(i/32)] ;
     end
 endgenerate

 wire m_32B_all_1 = |m_32B;
 wire m_16B_all_1 = |m_16B;
 wire m_8B_all_1  = |m_8B;
 wire m_4B_all_1  = |m_4B;
 wire m_2B_all_1  = |m_2B;
 wire m_1B_all_1  = |m_1B;

 wire[5:0] strb_struct = {
                          m_32B_all_1,
                          m_16B_all_1,
                          m_8B_all_1 ,
                          m_4B_all_1 ,
                          m_2B_all_1 ,
                          m_1B_all_1 
                          };

//-----------------------------------------------------------------------------------------------------------------
// STATEMACHINE for partial command sequencing
// * Each 2's power aligned subsection in strobe is checked.
// * An arbitrary strobe is divided into multiple partial write/read processes.
// * Command with larger width comes out first.
//   32B -> 16B -> 8B (-> 8B...) -> 4B (-> 4B...) -> 2B (-> 2B) -> 1B (-> 1B...)
//-----------------------------------------------------------------------------------------------------------------

 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     cstate <= IDLE;
   else
     cstate <= nstate;

 always@(*)
   case(cstate)
     IDLE        :
                    if(strobe_valid)
                      nstate = CHK_PART_XB;
                    else
                      nstate = IDLE;

     // generate 32B to 1B partial command
     CHK_PART_XB :
                   if(part_cmd_match)
                     nstate = WR_CMD_XB;
                   else
                     nstate = CYC_UPDATE;

     WR_CMD_XB   :    
                     nstate = WR_VLD_XB;

     WR_VLD_XB   :    
                   if(partial_en)    // wait for enable to continue with the command sending
                     nstate = CHK_PART_XB;
                   else
                     nstate = WR_VLD_XB;

     CYC_UPDATE  :    
                   if(part_cmd_cyc[0] || part_all_nil)
                     nstate = DONE;
                   else 
                     nstate = CHK_PART_XB;
                     
     // finalizing
     DONE        : 
                   if(partial_en)    // wait for enable to continue with finishing
                     nstate = IDLE;
                   else
                     nstate = DONE;
     default     : 
                   nstate = IDLE;
   endcase

//---- cycling shift register that indicates bytes number ----
// bit5: 32B
// bit4: 16B
// bit3: 8B
// bit2: 4B
// bit1: 2B
// bit0: 1B
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     part_cmd_cyc <= 6'b100000;
   else if(cstate == IDLE)
     part_cmd_cyc <= 6'b100000;
   else if(cstate == CYC_UPDATE)
     part_cmd_cyc <= (part_cmd_cyc >> 1);

//---- match each byte number to corresponding cycling bit ----
 assign part_cmd_match = |(part_cmd_cyc & strb_struct);

//---- rest of the part is all zero ----
 assign part_all_nil = ~|(sub_strb);



//-----------------------------------------------------------------------------------------------------------------
//
// SUB-STROBE UPDATE
//
// * Partial length with each command is organized in such order that data in larger section comes first; and data
//    in the furthest right section comes first.
//   e.g. if m_32B = 2'b0; m_16B = 4'b0; m_8B = 8'b0000_1010; m_4B = 16'd0; m_2B = 32'h0001_f0f0; m_1B = ...., the next 
//        partial write/read data is in the section pointed by m_8B[1], i.e. data[15:8]; and then the next one is m_8B[3].
//    
// * Strobe signal is updated after each partial command issue, the last issued section in strobe is cleared out.
//   Taking the above example, after section m_8B[1] is issued, strobe[15:8]=0, it turns out m_8B = 8'b0000_1000.
//
// Steps 
// 1) SINGLE OUT DECODE
//   Find the first all-ones section to the right and leave others zero.
// 2) EXPAND BITS
//    Expand the first 2's power aligned section on the right so as to mask the current strobe section ----
// 3) MASK strobe with the expanded decode to clean up the required setion

//-----------------------------------------------------------------------------------------------------------------


//---- single out the far right bit ---------------------------------------------------------------------
//     True table: (e.g. mapping m_8B to s_8B)
//         m_8B       s_8B
//       xxxxxxx1   00000001
//       xxxxxx10   00000010
//       xxxxx100   00000100
//       xxxx1000   00001000
//       xxx10000   00010000
//       xx100000   00100000
//       x1000000   01000000
//       10000000   10000000
//
//   Rule: 
//    if r=0, s_xB[r] = m_xB[r]
//    else s_xB[r] = m_xB[r]&~(|m_xB[r-1:0]) // when m_xB[r] is 1, s_xB[r] is 1 only when m_xB[r-1:0]=0.
//-------------------------------------------------------------------------------------------------------

 wire[63:00] so_1B;
 wire[31:00] so_2B;
 wire[15:00] so_4B;
 wire[07:00] so_8B;
 wire[03:00] so_16B;
 wire[01:00] so_32B;
 reg [63:00] s_1B;
 reg [31:00] s_2B;
 reg [15:00] s_4B;
 reg [07:00] s_8B;
 reg [03:00] s_16B;
 reg [01:00] s_32B;

 genvar j;
 generate
     for(j = 0; j < 64; j = j+1)
       begin : gen_single_one
         if(j == 0) 
           begin
             assign so_1B[j]  = m_1B[j];
             assign so_2B[j]  = m_2B[j];
             assign so_4B[j]  = m_4B[j];
             assign so_8B[j]  = m_8B[j];
             assign so_16B[j] = m_16B[j];
             assign so_32B[j] = m_32B[j];
           end
         else 
           begin
                        assign so_1B[j]     = m_1B[j]     & ~(|m_1B[j-1:0]);
             if(j > 1)  assign so_2B[j/2]   = m_2B[j/2]   & ~(|m_2B[j/2-1:0]);
             if(j > 3)  assign so_4B[j/4]   = m_4B[j/4]   & ~(|m_4B[j/4-1:0]);
             if(j > 7)  assign so_8B[j/8]   = m_8B[j/8]   & ~(|m_8B[j/8-1:0]);
             if(j > 15) assign so_16B[j/16] = m_16B[j/16] & ~(|m_16B[j/16-1:0]);
             if(j > 31) assign so_32B[j/32] = m_32B[j/32] & ~(|m_32B[j/32-1:0]);
           end
       end
 endgenerate
 
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     begin
       s_1B  <= 64'd0;
       s_2B  <= 32'd0;
       s_4B  <= 16'd0;
       s_8B  <= 8'd0;
       s_16B <= 4'd0;
       s_32B <= 2'd0;
     end
   else
     begin
       s_1B  <= so_1B ; 
       s_2B  <= so_2B ; 
       s_4B  <= so_4B ; 
       s_8B  <= so_8B ; 
       s_16B <= so_16B; 
       s_32B <= so_32B; 
     end
 


//---- expand the singled out decode to 64b -------------------------------------------------------------------
// e.g. s_4B :                  0____0____0____0____0____0____0____0____1____0____0____0____0____0____0____0
//      partial_4B_done_mask : 0000_0000_0000_0000_0000_0000_0000_0000_1111_0000_0000_0000_0000_0000_0000_0000
//-------------------------------------------------------------------------------------------------------------

 assign partial_32B_done_mask = {{32{s_32B[1]}},{32{s_32B[0]}}};
 assign partial_16B_done_mask = {{16{s_16B[3]}},{16{s_16B[2]}},{16{s_16B[1]}},{16{s_16B[0]}}};
 assign partial_8B_done_mask  = {{8{s_8B[07]}}, {8{s_8B[06]}}, {8{s_8B[05]}}, {8{s_8B[04]}}, {8{s_8B[03]}}, {8{s_8B[02]}}, {8{s_8B[01]}}, {8{s_8B[00]}}};
 assign partial_4B_done_mask  = {{4{s_4B[15]}}, {4{s_4B[14]}}, {4{s_4B[13]}}, {4{s_4B[12]}}, {4{s_4B[11]}}, {4{s_4B[10]}}, {4{s_4B[09]}}, {4{s_4B[08]}},
                                 {4{s_4B[07]}}, {4{s_4B[06]}}, {4{s_4B[05]}}, {4{s_4B[04]}}, {4{s_4B[03]}}, {4{s_4B[02]}}, {4{s_4B[01]}}, {4{s_4B[00]}}};
 assign partial_2B_done_mask  = {{2{s_2B[31]}}, {2{s_2B[30]}}, {2{s_2B[29]}}, {2{s_2B[28]}}, {2{s_2B[27]}}, {2{s_2B[26]}}, {2{s_2B[25]}}, {2{s_2B[24]}},
                                 {2{s_2B[23]}}, {2{s_2B[22]}}, {2{s_2B[21]}}, {2{s_2B[20]}}, {2{s_2B[19]}}, {2{s_2B[18]}}, {2{s_2B[17]}}, {2{s_2B[16]}},
                                 {2{s_2B[15]}}, {2{s_2B[14]}}, {2{s_2B[13]}}, {2{s_2B[12]}}, {2{s_2B[11]}}, {2{s_2B[10]}}, {2{s_2B[09]}}, {2{s_2B[08]}},
                                 {2{s_2B[07]}}, {2{s_2B[06]}}, {2{s_2B[05]}}, {2{s_2B[04]}}, {2{s_2B[03]}}, {2{s_2B[02]}}, {2{s_2B[01]}}, {2{s_2B[00]}}};
 assign partial_1B_done_mask  = s_1B;


//---- update strobe ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     sub_strb <= 64'd0;
   else if(strobe_valid)
     sub_strb <= strobe;
   else if(cstate == WR_CMD_XB)
     case(part_cmd_cyc)
       6'b100000 : sub_strb <= sub_strb & ~partial_32B_done_mask;
       6'b010000 : sub_strb <= sub_strb & ~partial_16B_done_mask;
       6'b001000 : sub_strb <= sub_strb & ~partial_8B_done_mask;
       6'b000100 : sub_strb <= sub_strb & ~partial_4B_done_mask;
       6'b000010 : sub_strb <= sub_strb & ~partial_2B_done_mask;
       6'b000001 : sub_strb <= sub_strb & ~partial_1B_done_mask;
       default:;
     endcase
 
 
//-----------------------------------------------------------------------------------------------------------------
//
// EFFECTIVE ADDRESS 
// 
// * Calculate lower 6 bits effective address that matches the setion to be issued for partial writing. 
// * Use simplified gate-circuit instead of if-else for clarity.
//
//   e.g.  if partial length is 8B
//   
//   True Table:
//   s_8B : b7 b6 b5 b4 b3 b2 b1 b0   partial_ea: b2 b1 b0
//          0  0  0  0  0  0  0  1                0  0  0
//          0  0  0  0  0  0  1  0                0  0  1
//          0  0  0  0  0  1  0  0                0  1  0
//          0  0  0  0  1  0  0  0                0  1  1
//          0  0  0  1  0  0  0  0                1  0  0
//          0  0  1  0  0  0  0  0                1  0  1
//          0  1  0  0  0  0  0  0                1  1  0
//          1  0  0  0  0  0  0  0                1  1  1
//   Circuit:
//     partial_ea[2] = s_8B[4] | s_8B[5] | s_8B[6] | s_8B[7]  // |X|X|X|X|O|O|O|O|
//     partial_ea[1] = s_8B[2] | s_8B[3] | s_8B[6] | s_8B[7]  // |X|X|O|O|X|X|O|O|
//     partial_ea[0] = s_8B[1] | s_8B[3] | s_8B[5] | s_8B[7]  // |X|O|X|O|X|O|X|O|
//
//-----------------------------------------------------------------------------------------------------------------

 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     partial_ea <= 6'd0;
   else if(cstate == WR_CMD_XB)
     case(part_cmd_cyc)
       6'b100000 :  partial_ea <= {~s_32B[0],  //b5
                                   5'd0};
       6'b010000 :  partial_ea <= {(s_16B[3]|s_16B[2]),  //b5
                                   (s_16B[3]|s_16B[1]),  //b4
                                   4'd0};
       6'b001000 :  partial_ea <= {(s_8B[7]|s_8B[6]|s_8B[5]|s_8B[4]), //b5
                                   (s_8B[7]|s_8B[6]|s_8B[3]|s_8B[2]), //b4
                                   (s_8B[7]|s_8B[5]|s_8B[3]|s_8B[1]), //b3
                                   3'd0};
       6'b000100 :  partial_ea <= {|s_4B[15:8],  //b5
                                   (|s_4B[15:12])|(|s_4B[7:4]),  //b4
                                   (s_4B[15]|s_4B[14]|s_4B[11]|s_4B[10]|s_4B[7]|s_4B[6]|s_4B[3]|s_4B[2]),  //b3
                                   (s_4B[15]|s_4B[13]|s_4B[11]|s_4B[9]|s_4B[7]|s_4B[5]|s_4B[3]|s_4B[1]),  //b2
                                   2'd0};
       6'b000010 :  partial_ea <= {|s_2B[31:16],   //b5
                                   (|s_2B[31:24])|(|s_2B[15:8]),  //b4
                                   (|s_2B[31:28])|(|s_2B[23:20])|(|s_2B[15:12])|(|s_2B[7:4]),  //b3
                                   (|s_2B[31:30])|(|s_2B[27:26])|(|s_2B[23:22])|(|s_2B[19:18])|
                                   (|s_2B[15:14])|(|s_2B[11:10])|(|s_2B[7:6])|(|s_2B[3:2]),  //b2
                                   (s_2B[31]|s_2B[29]|s_2B[27]|s_2B[25]|s_2B[23]|s_2B[21]|s_2B[19]|s_2B[17]|
                                    s_2B[15]|s_2B[13]|s_2B[11]|s_2B[9]|s_2B[7]|s_2B[5]|s_2B[3]|s_2B[1]),  //b1
                                   1'd0};
       6'b000001 :  partial_ea <= {|s_1B[63:32],  //b5
                                   (|s_1B[63:48])|(|s_1B[31:16]),  //b4
                                   (|s_1B[63:56])|(|s_1B[47:40])|(|s_1B[31:24])|(|s_1B[15:8]),  //b3
                                   (|s_1B[63:60])|(|s_1B[55:52])|(|s_1B[47:44])|(|s_1B[39:36])|
                                   (|s_1B[31:28])|(|s_1B[23:20])|(|s_1B[15:12])|(|s_1B[7:4]),  //b2
                                   (|s_1B[63:62])|(|s_1B[59:58])|(|s_1B[55:54])|(|s_1B[51:50])|
                                   (|s_1B[47:46])|(|s_1B[43:42])|(|s_1B[39:38])|(|s_1B[35:34])|
                                   (|s_1B[31:30])|(|s_1B[27:26])|(|s_1B[23:22])|(|s_1B[19:18])|
                                   (|s_1B[15:14])|(|s_1B[11:10])|(|s_1B[7:6])|(|s_1B[3:2]),    //b1
                                   (s_1B[63]|s_1B[61]|s_1B[59]|s_1B[57]|s_1B[55]|s_1B[53]|s_1B[51]|s_1B[49]|
                                    s_1B[47]|s_1B[45]|s_1B[43]|s_1B[41]|s_1B[39]|s_1B[37]|s_1B[35]|s_1B[33]|
                                    s_1B[31]|s_1B[29]|s_1B[27]|s_1B[25]|s_1B[23]|s_1B[21]|s_1B[19]|s_1B[17]|
                                    s_1B[15]|s_1B[13]|s_1B[11]|s_1B[9]|s_1B[7]|s_1B[5]|s_1B[3]|s_1B[1])};  //b0
       default:;
     endcase

 
 
//---- partial length ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     partial_len <= 3'd0;
   else if(cstate == WR_CMD_XB)
     case(part_cmd_cyc)
       6'b100000 : partial_len <= 3'b101;
       6'b010000 : partial_len <= 3'b100;
       6'b001000 : partial_len <= 3'b011;
       6'b000100 : partial_len <= 3'b010;
       6'b000010 : partial_len <= 3'b001;
       6'b000001 : partial_len <= 3'b000;
       default:;
     endcase
 
//---- partial effective address and length valid ----
// sync twice to align with partial_done if any
// make sure partial_valid align with partial_en, and deasserts when partial_en is 0
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     begin
       partial_valid_pre1 <= 1'b0;
       partial_valid_pre2 <= 1'b0;
     end
   else
     begin
       partial_valid_pre1 <= (cstate == WR_VLD_XB) && partial_en;
       partial_valid_pre2 <= partial_valid_pre1;
     end

 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     partial_valid_pending <= 1'b0;
   else if(partial_valid_pre1)
     partial_valid_pending <= 1'b1;
   else if(partial_en)
     partial_valid_pending <= 1'b0;

  assign partial_valid = partial_valid_pending && partial_en;

//---- counter for a single sequence of partial commands, used in afutag to distinguish individual partial command ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     partial_cnt <= 5'd0;
   else if(cstate == IDLE)
     partial_cnt <= 5'd0;
   else if(partial_valid)
     partial_cnt <= partial_cnt + 5'd1;

//---- current partial sequencing is done, synced with partial_valid ----
 assign partial_done = (cstate == CYC_UPDATE) && (part_cmd_cyc[0] || part_all_nil);


 // psl default clock = (posedge clk);

//==== PSL COVERAGE ==============================================================================
 // psl PARTIAL_1ST_32B : cover {strobe_valid; (m_32B_all_1)};
 // psl PARTIAL_1ST_16B : cover {strobe_valid; (~m_32B_all_1 && m_16B_all_1)};
 // psl PARTIAL_1ST_08B : cover {strobe_valid; (~m_32B_all_1 && ~m_16B_all_1 && m_8B_all_1)};
 // psl PARTIAL_1ST_04B : cover {strobe_valid; (~m_32B_all_1 && ~m_16B_all_1 && ~m_8B_all_1 && m_4B_all_1)};
 // psl PARTIAL_1ST_02B : cover {strobe_valid; (~m_32B_all_1 && ~m_16B_all_1 && ~m_8B_all_1 && ~m_4B_all_1 && m_2B_all_1)};
 // psl PARTIAL_1ST_01B : cover {strobe_valid; (~m_32B_all_1 && ~m_16B_all_1 && ~m_8B_all_1 && ~m_4B_all_1 && ~m_2B_all_1 && m_1B_all_1)};
//==== PSL COVERAGE ==============================================================================

//==== PSL ASSERTION ==============================================================================
 // psl PARTIAL_CNT_OVERFLOW : assert never (partial_valid && (&partial_cnt)) report "decomposed partial commands number exceeds partial counter limit!";
//==== PSL ASSERTION ==============================================================================

endmodule
