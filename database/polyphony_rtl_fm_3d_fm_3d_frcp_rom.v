// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_frcp_rom.v
//
// Abstract:
//   floating point 1/x rom table
//  Created:
//    30 September 2008
//
// Copyright (c) 2008  Kenji Ishimaru, All rights reserved.
//
//======================================================================
//
// Copyright (c) 2020, Kenji Ishimaru
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
//  -Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
//  -Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
// THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
// CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
// OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
// OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
// EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

module fm_3d_frcp_rom (
  clk_core,
  i_a,
  o_c
);

////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input  [6:0]  i_a;
    output [31:0] o_c;

////////////////////////////
// reg
////////////////////////////
(*rom_style="distributed" *) reg    [31:0] r_c;
////////////////////////////
// assign
////////////////////////////
    assign o_c = r_c;
///////////////////////////////////////////
//  always statement
///////////////////////////////////////////
    always @(posedge clk_core) begin
(* parallel_case *) case (i_a)
            7'd0:   r_c <= 32'h800001fc;
            7'd1:   r_c <= 32'h7f0101f4;
            7'd2:   r_c <= 32'h7e0701ec;
            7'd3:   r_c <= 32'h7d1101e5;
            7'd4:   r_c <= 32'h7c1f01dd;
            7'd5:   r_c <= 32'h7b3001d6;
            7'd6:   r_c <= 32'h7a4401cf;
            7'd7:   r_c <= 32'h795c01c8;
            7'd8:   r_c <= 32'h787801c2;
            7'd9:   r_c <= 32'h779701bb;
            7'd10:  r_c <= 32'h76b901b5;
            7'd11:  r_c <= 32'h75de01af;
            7'd12:  r_c <= 32'h750701a8;
            7'd13:  r_c <= 32'h743201a2;
            7'd14:  r_c <= 32'h7361019d;
            7'd15:  r_c <= 32'h72920197;
            7'd16:  r_c <= 32'h71c70191;
            7'd17:  r_c <= 32'h70fe018c;
            7'd18:  r_c <= 32'h70380186;
            7'd19:  r_c <= 32'h6f740181;
            7'd20:  r_c <= 32'h6eb3017c;
            7'd21:  r_c <= 32'h6df50177;
            7'd22:  r_c <= 32'h6d3a0172;
            7'd23:  r_c <= 32'h6c80016d;
            7'd24:  r_c <= 32'h6bca0168;
            7'd25:  r_c <= 32'h6b150164;
            7'd26:  r_c <= 32'h6a63015f;
            7'd27:  r_c <= 32'h69b4015a;
            7'd28:  r_c <= 32'h69060156;
            7'd29:  r_c <= 32'h685b0152;
            7'd30:  r_c <= 32'h67b2014d;
            7'd31:  r_c <= 32'h670b0149;
            7'd32:  r_c <= 32'h66660145;
            7'd33:  r_c <= 32'h65c30141;
            7'd34:  r_c <= 32'h6522013d;
            7'd35:  r_c <= 32'h64830139;
            7'd36:  r_c <= 32'h63e70136;
            7'd37:  r_c <= 32'h634c0132;
            7'd38:  r_c <= 32'h62b2012e;
            7'd39:  r_c <= 32'h621b012a;
            7'd40:  r_c <= 32'h61860127;
            7'd41:  r_c <= 32'h60f20123;
            7'd42:  r_c <= 32'h60600120;
            7'd43:  r_c <= 32'h5fd0011d;
            7'd44:  r_c <= 32'h5f410119;
            7'd45:  r_c <= 32'h5eb40116;
            7'd46:  r_c <= 32'h5e290113;
            7'd47:  r_c <= 32'h5d9f0110;
            7'd48:  r_c <= 32'h5d17010d;
            7'd49:  r_c <= 32'h5c90010a;
            7'd50:  r_c <= 32'h5c0b0107;
            7'd51:  r_c <= 32'h5b870104;
            7'd52:  r_c <= 32'h5b050101;
            7'd53:  r_c <= 32'h5a8400fe;
            7'd54:  r_c <= 32'h5a0500fb;
            7'd55:  r_c <= 32'h598700f9;
            7'd56:  r_c <= 32'h590b00f6;
            7'd57:  r_c <= 32'h588f00f3;
            7'd58:  r_c <= 32'h581600f1;
            7'd59:  r_c <= 32'h579d00ee;
            7'd60:  r_c <= 32'h572600ec;
            7'd61:  r_c <= 32'h56b000e9;
            7'd62:  r_c <= 32'h563b00e7;
            7'd63:  r_c <= 32'h55c700e4;
            7'd64:  r_c <= 32'h555500e2;
            7'd65:  r_c <= 32'h54e400e0;
            7'd66:  r_c <= 32'h547400dd;
            7'd67:  r_c <= 32'h540500db;
            7'd68:  r_c <= 32'h539700d9;
            7'd69:  r_c <= 32'h532a00d7;
            7'd70:  r_c <= 32'h52bf00d4;
            7'd71:  r_c <= 32'h525400d2;
            7'd72:  r_c <= 32'h51eb00d0;
            7'd73:  r_c <= 32'h518300ce;
            7'd74:  r_c <= 32'h511b00cc;
            7'd75:  r_c <= 32'h50b500ca;
            7'd76:  r_c <= 32'h505000c8;
            7'd77:  r_c <= 32'h4fec00c6;
            7'd78:  r_c <= 32'h4f8800c4;
            7'd79:  r_c <= 32'h4f2600c2;
            7'd80:  r_c <= 32'h4ec400c0;
            7'd81:  r_c <= 32'h4e6400bf;
            7'd82:  r_c <= 32'h4e0400bd;
            7'd83:  r_c <= 32'h4da600bb;
            7'd84:  r_c <= 32'h4d4800b9;
            7'd85:  r_c <= 32'h4ceb00b8;
            7'd86:  r_c <= 32'h4c8f00b6;
            7'd87:  r_c <= 32'h4c3400b4;
            7'd88:  r_c <= 32'h4bda00b2;
            7'd89:  r_c <= 32'h4b8000b1;
            7'd90:  r_c <= 32'h4b2700af;
            7'd91:  r_c <= 32'h4ad000ae;
            7'd92:  r_c <= 32'h4a7900ac;
            7'd93:  r_c <= 32'h4a2200aa;
            7'd94:  r_c <= 32'h49cd00a9;
            7'd95:  r_c <= 32'h497800a7;
            7'd96:  r_c <= 32'h492400a6;
            7'd97:  r_c <= 32'h48d100a4;
            7'd98:  r_c <= 32'h487e00a3;
            7'd99:  r_c <= 32'h482d00a2;
            7'd100: r_c <= 32'h47dc00a0;
            7'd101: r_c <= 32'h478b009f;
            7'd102: r_c <= 32'h473c009d;
            7'd103: r_c <= 32'h46ed009c;
            7'd104: r_c <= 32'h469e009b;
            7'd105: r_c <= 32'h46510099;
            7'd106: r_c <= 32'h46040098;
            7'd107: r_c <= 32'h45b80097;
            7'd108: r_c <= 32'h456c0095;
            7'd109: r_c <= 32'h45210094;
            7'd110: r_c <= 32'h44d70093;
            7'd111: r_c <= 32'h448d0092;
            7'd112: r_c <= 32'h44440091;
            7'd113: r_c <= 32'h43fb008f;
            7'd114: r_c <= 32'h43b3008e;
            7'd115: r_c <= 32'h436c008d;
            7'd116: r_c <= 32'h4325008c;
            7'd117: r_c <= 32'h42df008b;
            7'd118: r_c <= 32'h429a008a;
            7'd119: r_c <= 32'h42540088;
            7'd120: r_c <= 32'h42100087;
            7'd121: r_c <= 32'h41cc0086;
            7'd122: r_c <= 32'h41890085;
            7'd123: r_c <= 32'h41460084;
            7'd124: r_c <= 32'h41040083;
            7'd125: r_c <= 32'h40c20082;
            7'd126: r_c <= 32'h40810081;
            7'd127: r_c <= 32'h40400080;
            default: r_c <= 32'h0;
        endcase
    end


endmodule
