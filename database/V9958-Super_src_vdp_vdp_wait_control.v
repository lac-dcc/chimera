// This program was cloned from: https://github.com/dinoboards/V9958-Super
// License: BSD 3-Clause "New" or "Revised" License

// converted from vdp_wait_control.vhd
//   VDP wait controller for VDP command
//   Revision 1.00
//
// Copyright (c) 2008 Takayuki Hara
// All rights reserved.
//
// Redistribution and use of this source code or any derivative works, are
// permitted provided that the following conditions are met:
//
// 1. Redistributions of source code must retain the above copyright notice,
//    this list of conditions and the following disclaimer.
// 2. Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in the
//    documentation and/or other materials provided with the distribution.
// 3. Redistributions may not be sold, nor may they be used in a commercial
//    product or activity without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
// CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
// OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
// OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
// ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

module VDP_WAIT_CONTROL (
    input wire RESET,
    input wire CLK21M,
    input wire [7:4] VDP_COMMAND,
    input wire VDPR9PALMODE,
    input wire REG_R1_DISP_ON,
    input wire REG_R8_SP_OFF,
    input wire REG_R9_Y_DOTS,
    input wire VDPSPEEDMODE,
    input wire DRIVE,
    output wire ACTIVE
);

  // 0=60Hz (NTSC), 1=50Hz (PAL)
  // 0=Display Off, 1=Display On
  // 0=Sprite On, 1=Sprite Off
  // 0=192 Lines, 1=212 Lines

  reg [15:0] FF_WAIT_CNT;

  // -------------------------------------------------------------------------
  //    "STOP",  "XXXX",  "XXXX",  "XXXX", "POINT",  "PSET",  "SRCH",  "LINE",
  //    "LMMV",  "LMMM",  "LMCM",  "LMMC",  "HMMV",  "HMMM",  "YMMM",  "HMMC"
  // -------------------------------------------------------------------------

  // Sprite On, 212 Lines, 50Hz
  parameter [15:0] C_WAIT_TABLE_501[0:15] = {
    16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h132C, 16'h0B3F, 16'h0C91, 16'h0DB9, 16'h8000, 16'h8000, 16'h0D0A, 16'h12CD, 16'h0FF8, 16'h8000
  };

  // Sprite On, 192 Lines, 50Hz
  parameter [15:0] C_WAIT_TABLE_502[0:15] = {
    16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h125A, 16'h0ABD, 16'h0BEB, 16'h0D1C, 16'h8000, 16'h8000, 16'h0C5B, 16'h11FB, 16'h0F9C, 16'h8000
  };

  // Sprite Off, 212 Lines, 50Hz
  parameter [15:0] C_WAIT_TABLE_503[0:15] = {
    16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h10A3, 16'h0773, 16'h098B, 16'h0C58, 16'h8000, 16'h8000, 16'h095F, 16'h1045, 16'h0FA5, 16'h8000
  };

  // Sprite Off, 192 Lines, 50Hz
  parameter [15:0] C_WAIT_TABLE_504[0:15] = {
    16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h1015, 16'h0767, 16'h093B, 16'h0BD6, 16'h8000, 16'h8000, 16'h0927, 16'h0FB6, 16'h0F08, 16'h8000
  };

  // Blank, 50Hz (Test: Sprite On, 212 Lines)
  parameter [15:0] C_WAIT_TABLE_505[0:15] = {
    16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h0EA3, 16'h0689, 16'h0974, 16'h0AAB, 16'h8000, 16'h8000, 16'h0962, 16'h0E74, 16'h0DF7, 16'h8000
  };

  // Sprite On, 212 Lines, 60Hz
  parameter [15:0] C_WAIT_TABLE_601[0:15] = {
    16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h13D2, 16'h0C8B, 16'h0EB5, 16'h1012, 16'h8000, 16'h8000, 16'h0F66, 16'h1373, 16'h11E6, 16'h8000
  };

  // Sprite On, 192 Lines, 60Hz
  parameter [15:0] C_WAIT_TABLE_602[0:15] = {
    16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h126F, 16'h0BAA, 16'h0DAA, 16'h0EEA, 16'h8000, 16'h8000, 16'h0E24, 16'h1210, 16'h1105, 16'h8000
  };

  // Sprite Off, 212 Lines, 60Hz
  parameter [15:0] C_WAIT_TABLE_603[0:15] = {
    16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h10A0, 16'h07EA, 16'h0A78, 16'h0DD9, 16'h8000, 16'h8000, 16'h0A5B, 16'h1042, 16'h118D, 16'h8000
  };

  // Sprite Off, 192 Lines, 60Hz
  parameter [15:0] C_WAIT_TABLE_604[0:15] = {
    16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h0FD7, 16'h0797, 16'h09FC, 16'h0D16, 16'h8000, 16'h8000, 16'h09E1, 16'h0F78, 16'h10A6, 16'h8000
  };

  // Blank, 60Hz (Test: Sprite On, 212 Lines)
  parameter [15:0] C_WAIT_TABLE_605[0:15] = {
    16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h8000, 16'h0DAD, 16'h069E, 16'h09E1, 16'h0B18, 16'h8000, 16'h8000, 16'h09CA, 16'h0D4E, 16'h0EAF, 16'h8000
  };

  always_ff @(posedge RESET, posedge CLK21M) begin
    if ((RESET == 1'b1)) begin
      FF_WAIT_CNT <= {16{1'b0}};
    end else begin
      if ((DRIVE == 1'b1)) begin
        // 50Hz (PAL)
        if ((VDPR9PALMODE == 1'b1)) begin
          // Display On
          if ((REG_R1_DISP_ON == 1'b1)) begin
            // Sprite On
            if ((REG_R8_SP_OFF == 1'b0)) begin
              // 212 Lines
              if ((REG_R9_Y_DOTS == 1'b1)) begin
                FF_WAIT_CNT <= ({1'b0, FF_WAIT_CNT[14:0]}) + C_WAIT_TABLE_501[VDP_COMMAND];
                // 192 Lines
              end else begin
                FF_WAIT_CNT <= ({1'b0, FF_WAIT_CNT[14:0]}) + C_WAIT_TABLE_502[VDP_COMMAND];
              end
              // Sprite Off
            end else begin
              // 212 Lines
              if ((REG_R9_Y_DOTS == 1'b1)) begin
                FF_WAIT_CNT <= ({1'b0, FF_WAIT_CNT[14:0]}) + C_WAIT_TABLE_503[VDP_COMMAND];
                // 192 Lines
              end else begin
                FF_WAIT_CNT <= ({1'b0, FF_WAIT_CNT[14:0]}) + C_WAIT_TABLE_504[VDP_COMMAND];
              end
            end
            // Display Off (Blank)
          end else begin
            FF_WAIT_CNT <= ({1'b0, FF_WAIT_CNT[14:0]}) + C_WAIT_TABLE_505[VDP_COMMAND];
          end
          // 60Hz (NTSC)
        end else begin
          // Display On
          if ((REG_R1_DISP_ON == 1'b1)) begin
            // Sprite On
            if ((REG_R8_SP_OFF == 1'b0)) begin
              // 212 Lines
              if ((REG_R9_Y_DOTS == 1'b1)) begin
                FF_WAIT_CNT <= ({1'b0, FF_WAIT_CNT[14:0]}) + C_WAIT_TABLE_601[VDP_COMMAND];
                // 192 Lines
              end else begin
                FF_WAIT_CNT <= ({1'b0, FF_WAIT_CNT[14:0]}) + C_WAIT_TABLE_602[VDP_COMMAND];
              end
              // Sprite Off
            end else begin
              // 212 Lines
              if ((REG_R9_Y_DOTS == 1'b1)) begin
                FF_WAIT_CNT <= ({1'b0, FF_WAIT_CNT[14:0]}) + C_WAIT_TABLE_603[VDP_COMMAND];
                // 192 Lines
              end else begin
                FF_WAIT_CNT <= ({1'b0, FF_WAIT_CNT[14:0]}) + C_WAIT_TABLE_604[VDP_COMMAND];
              end
            end
            // Display Off (Blank)
          end else begin
            FF_WAIT_CNT <= ({1'b0, FF_WAIT_CNT[14:0]}) + C_WAIT_TABLE_605[VDP_COMMAND];
          end
        end
      end
    end
  end

  assign ACTIVE = FF_WAIT_CNT[15] | VDPSPEEDMODE;

endmodule
