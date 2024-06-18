// This program was cloned from: https://github.com/sparkletron/mini_colecovision
// License: MIT License

//******************************************************************************
/// file:   porta_glue_coleco.v
/// author: Jay Convertino (electrobs@gmail.com)
/// date:   2023/27/12
/// brief:  TTL Glue logic of the coleco reduced for a 2 player portable.
/// details: Support added for super game module
///
/// @TODO
///  - Cleanup code
///
/// @license mit
///
/// Copyright 2024 Johnathan Convertino
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
/// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
/// IN THE SOFTWARE.
///*****************************************************************************

`define DEF_RESET_DELAY_BIT       15
`define DEF_VDP_RESET_DELAY_BIT   4
`define DEF_FB_MONOSTABLE_COUNT   4000
`define DEF_IRQ_MONOSTABLE_COUNT  80

module porta_glue_coleco
  (
    input         clk,
    input [15:0]  A,
    input         C1P1,
    input         C1P2,
    input         C1P3,
    input         C1P4,
    input         C1P6,
    input         C1P7,
    input         C1P9,
    input         C2P1,
    input         C2P2,
    input         C2P3,
    input         C2P4,
    input         C2P6,
    input         C2P7,
    input         C2P9,
    input         MREQn,
    input         IORQn,
    input         RFSHn,
    input         M1n,
    input         WRn,
    input         RESETn_SW,
    input         RDn,
    inout [7:0]   D,
    output        CP5_ARM,
    output        CP8_FIRE,
    output        CS_h8000n,
    output        CS_hA000n,
    output        CS_hC000n,
    output        CS_hE000n,
    output        SND_ENABLEn,
    output        ROM_ENABLEn,
    output        RAM_CSn,
    output        RAM_OEn,
    output        CSWn,
    output        CSRn,
    output        WAITn,
    output        RESETn,
    output        VDP_RESETn,
    output        INTn,
    output        AS,
    output        AY_SND_ENABLEn
  );

  //wires
  //decoder logic
  wire s_enable_u5;
  wire s_enable_u6;
  wire s_ctrl_en_1n;
  wire s_ctrl_en_2n;
  wire s_ctrl_readn;
  wire s_ram_csn;
  wire s_ram0_csn;
  wire s_ram1_csn;
  wire s_ram2_csn;
  wire s_y0_seln;

  //int logic
  wire s_int_p1;
  wire s_int_p2;

  //registers
  //sgm
  reg [ 7:0]  r_24k_ena         = 0;
  reg [ 7:0]  r_swap_ena        = 8'h0F;
  //sound cache last write
  reg [ 7:0]  r_snd_cache       = 0;

  //int trigger
  reg         r_int_p1          = 1'b0;
  reg         r_int_p2          = 1'b0;
  //wait d flip flop
  reg         r_wait            = 1'b0;

  //timed reset circuit counter
  reg [15:0]  r_reset_counter   = 0;
  reg         r_resetn          = 0;
  reg         r_vdp_resetn      = 0;

  //monostable circuit counters
  reg [11:0]  r_mono_count_p1     = 0;
  reg [11:0]  r_mono_count_p2     = 0;
  reg [ 6:0]  r_mono_count_int_p1 = 0;
  reg [ 6:0]  r_mono_count_int_p2 = 0;
  //reg for feedback signal
  reg         r_mono_p1       = 1'b1;
  reg         r_mono_p2       = 1'b1;

  //filters for controller input
  reg [7:0] r_c1p9   = ~0;
  reg [7:0] r_c2p9   = ~0;

  //emulate feedback nand circuit
  reg         r_ctrl_fire     = 1'b0;
  reg         r_ctrl_arm      = 1'b1;

  //****************************************************************************
  /// RAM Output enable when read is requested.
  //****************************************************************************
  assign s_ram_csn = (s_y0_seln | r_swap_ena[1]) & (s_ram2_csn  | ~r_24k_ena[0]) & (s_ram1_csn | ~r_24k_ena[0]) & s_ram0_csn;

  assign RAM_OEn = RDn | s_ram_csn;
  assign RAM_CSn = s_ram_csn;

  //****************************************************************************
  // Disable BIOS ROM when requested and use ram instead.
  //****************************************************************************
  assign ROM_ENABLEn = (s_y0_seln | ~r_swap_ena[1]);

  //****************************************************************************
  /// decoder for address selection.
  /// No clock, based on AND from TI 74138 datasheet.
  //****************************************************************************

  //AUX_DECODE always 1, RFSH is a double inversion on coleco (inverter + 138 internal)
  assign s_enable_u5 = (RFSHn & ~MREQn);

  assign s_y0_seln      = ~(s_enable_u5 & ~A[15] & ~A[14] & ~A[13]); //Y0
  assign s_ram2_csn     = ~(s_enable_u5 & ~A[15] & ~A[14] &  A[13]); //Y1
  assign s_ram1_csn     = ~(s_enable_u5 & ~A[15] &  A[14] & ~A[13]); //Y2
  assign s_ram0_csn     = ~(s_enable_u5 & ~A[15] &  A[14] &  A[13]); //Y3
  assign CS_h8000n      = ~(s_enable_u5 &  A[15] & ~A[14] & ~A[13]); //Y4
  assign CS_hA000n      = ~(s_enable_u5 &  A[15] & ~A[14] &  A[13]); //Y5
  assign CS_hC000n      = ~(s_enable_u5 &  A[15] &  A[14] & ~A[13]); //Y6
  assign CS_hE000n      = ~(s_enable_u5 &  A[15] &  A[14] &  A[13]); //Y7

  assign s_enable_u6 = (A[7] & ~IORQn);

  assign s_ctrl_en_2n   = ~(s_enable_u6 & ~A[6] & ~A[5] & ~WRn); //Y0, FIRE
  // assign NOTHING     = ~(s_enable_u6 & ~A6 & ~A5 &  WRn); //Y1, NOT USED IN COLECO
  assign CSWn           = ~(s_enable_u6 & ~A[6] &  A[5] & ~WRn); //Y2
  assign CSRn           = ~(s_enable_u6 & ~A[6] &  A[5] &  WRn); //Y3
  assign s_ctrl_en_1n   = ~(s_enable_u6 &  A[6] & ~A[5] & ~WRn); //Y4, ARM
  // assign NOTHING     = ~(s_enable_u6 &  A6 & ~A5 &  WRn); //Y5, NOT USED IN COLECO
  assign SND_ENABLEn    = ~(s_enable_u6 &  A[6] &  A[5] & ~WRn); //Y6
  assign s_ctrl_readn   = ~(s_enable_u6 &  A[6] &  A[5] &  WRn); //Y7

  //****************************************************************************
  /// decoder for super game module
  //****************************************************************************

  //0 for address, 1 for data
  assign AS             = (A[7:0] == 8'h50 & ~IORQn & ~WRn      ? 1'b0 : 1'b1);
  //match both h50 and h51 by ignoring bit 0. Enable AY sound chip.
  assign AY_SND_ENABLEn = (A[7:1] == 7'b0101000 & ~IORQn & ~WRn ? 1'b0 : 1'b1);
  //read cached register from previous write (AY emulation).
  assign D              = (A[7:0] == 8'h52 & ~IORQn & WRn       ? r_snd_cache : 8'bzzzzzzzz);

  //IO registers
  //This logic is registered
  always @(negedge clk)
  begin
    r_24k_ena   <= r_24k_ena;
    r_swap_ena  <= r_swap_ena;
    r_snd_cache <= r_snd_cache;

    if(~IORQn & ~WRn)
    begin
      case (A[7:0])
        // on write to sound chip, cache data.
        8'h51: r_snd_cache <= D;
        //exapand ram to 24k by setting bit 0 to 1
        8'h53: r_24k_ena  <= D;
        //swap out bios for ram by setting bit 1 to 0
        8'h7F: r_swap_ena <= D;
        default:
        begin
        end
      endcase
    end
  end

  //****************************************************************************
  /// wait generate
  /// D flip flop used to generate wait. Original uses a inverted clock in
  /// reference to the original. using a negedge will emulate the same without
  /// generating a new inverted clock.
  //****************************************************************************
  assign WAITn = (r_wait ? ~r_wait : 1'bz);

  always @(negedge clk)
  begin
    r_wait <= ~r_wait;

    //when not in machine cycle 1, hold r_wait at 0.
    if(M1n)
    begin
      r_wait <= 1'b0;
    end
  end

  //****************************************************************************
  /// Reset circuit based on number of cycle count, replace cap/resistor.
  //****************************************************************************
  assign RESETn     = r_resetn;
  assign VDP_RESETn = r_vdp_resetn;

  always @(negedge clk)
  begin

    r_reset_counter <= r_reset_counter + 1;

    if(r_reset_counter[`DEF_VDP_RESET_DELAY_BIT] == 1'b1)
    begin
      r_vdp_resetn <= 1'b1;
    end

    if(r_reset_counter[`DEF_RESET_DELAY_BIT] == 1'b1)
    begin
      r_resetn        <= 1'b1;
      r_reset_counter <= r_reset_counter;
    end

    //when 0, reset is asserted
    if(~RESETn_SW)
    begin
      r_resetn        <= 1'b0;
      r_vdp_resetn    <= 1'b0;
      r_reset_counter <= 0;
    end
  end

  //****************************************************************************
  /// Controller Player 1 and 2
  /// Player 1 and 2, tested with roller controller and standard gamepads only.
  //****************************************************************************

  // 1st player and 2nd player use the same lines
  assign CP5_ARM   = r_ctrl_arm;
  assign CP8_FIRE  = r_ctrl_fire;

  //data lines asserted when controller port read requested
  //player 1
  assign D[0] = (~s_ctrl_readn & ~A[1] ? C1P1       : 1'bz);
  assign D[1] = (~s_ctrl_readn & ~A[1] ? C1P4       : 1'bz);
  assign D[2] = (~s_ctrl_readn & ~A[1] ? C1P2       : 1'bz);
  assign D[3] = (~s_ctrl_readn & ~A[1] ? C1P3       : 1'bz);
  assign D[4] = (~s_ctrl_readn & ~A[1] ? r_mono_p1  : 1'bz);
  assign D[5] = (~s_ctrl_readn & ~A[1] ? C1P7       : 1'bz);
  assign D[6] = (~s_ctrl_readn & ~A[1] ? C1P6       : 1'bz);
  assign D[7] = (~s_ctrl_readn & ~A[1] ? s_int_p1   : 1'bz);

  //int used in data port and mono trigger to cpu.
  assign s_int_p1 = ~(r_mono_p1 & &r_c1p9) & r_resetn;

  //player 2
  assign D[0] = (~s_ctrl_readn & A[1] ? C2P1      : 1'bz);
  assign D[1] = (~s_ctrl_readn & A[1] ? C2P4      : 1'bz);
  assign D[2] = (~s_ctrl_readn & A[1] ? C2P2      : 1'bz);
  assign D[3] = (~s_ctrl_readn & A[1] ? C2P3      : 1'bz);
  assign D[4] = (~s_ctrl_readn & A[1] ? r_mono_p2 : 1'bz);
  assign D[5] = (~s_ctrl_readn & A[1] ? C2P7      : 1'bz);
  assign D[6] = (~s_ctrl_readn & A[1] ? C2P6      : 1'bz);
  assign D[7] = (~s_ctrl_readn & A[1] ? s_int_p2  : 1'bz);

  //int used in data port and mono trigger to cpu.
  assign s_int_p2 = ~(r_mono_p2 & &r_c2p9) & r_resetn;

  //INTn is generated by monostable circuit based on NAND outputs.
  assign INTn = ~(r_int_p1 | r_int_p2);

  //****************************************************************************
  /// int is only held low for a small amount of time. int for p1 and p2 are
  /// seperate monostable circuits.
  //****************************************************************************
  //player 1 int
  always @(negedge clk)
  begin
    r_mono_count_int_p1 <= 0;
    r_int_p1 <= 1'b0;

    if(s_int_p1)
    begin
      r_mono_count_int_p1 <= r_mono_count_int_p1 + 1;
      r_int_p1 <= 1'b1;

      if(r_mono_count_int_p1 >= `DEF_IRQ_MONOSTABLE_COUNT)
      begin
        r_mono_count_int_p1 <= r_mono_count_int_p1;
        r_int_p1 <= 1'b0;
      end
    end
  end

  //player 2 int
  always @(negedge clk)
  begin
    r_mono_count_int_p2 <= 0;
    r_int_p2 <= 1'b0;

    if(s_int_p2)
    begin
      r_mono_count_int_p2 <= r_mono_count_int_p2 + 1;
      r_int_p2 <= 1'b1;

      if(r_mono_count_int_p2 >= `DEF_IRQ_MONOSTABLE_COUNT)
      begin
        r_mono_count_int_p2 <= r_mono_count_int_p2;
        r_int_p2 <= 1'b0;
      end
    end
  end

  //****************************************************************************
  /// Controller, original was a NAND circuit that would keep the last selection
  /// enabled till the other controller select is enabled.
  /// emulation of feedback nand, hold last state by default.
  /// 00 is a invalid state.
  //****************************************************************************
  always @(negedge clk)
  begin
    r_ctrl_arm  <= r_ctrl_arm;
    r_ctrl_fire <= r_ctrl_fire;

    if(s_ctrl_en_1n ^ s_ctrl_en_2n)
    begin
      r_ctrl_arm  <= ~s_ctrl_en_1n;
      r_ctrl_fire <= ~s_ctrl_en_2n;
    end
  end

  //****************************************************************************
  ///emulation of monostable transistor ciruit for controller port NAND feedback.
  //****************************************************************************
  //player 1
  always @(negedge clk)
  begin
    r_mono_count_p1 <= 0;
    r_mono_p1 <= ~s_int_p1;

    if(s_int_p1)
    begin
      r_mono_count_p1 <= r_mono_count_p1 + 1;
      if(r_mono_count_p1 >= `DEF_FB_MONOSTABLE_COUNT)
      begin
        r_mono_count_p1 <= r_mono_count_p1;
        r_mono_p1 <= 1'b1;
      end
    end
  end

  //player 2
  always @(negedge clk)
  begin
    r_mono_count_p2 <= 0;
    r_mono_p2 <= ~s_int_p2;

    if(s_int_p2)
    begin
      r_mono_count_p2 <= r_mono_count_p2 + 1;
      if(r_mono_count_p2 >= `DEF_FB_MONOSTABLE_COUNT)
      begin
        r_mono_count_p2 <= r_mono_count_p2;
        r_mono_p2 <= 1'b1;
      end
    end
  end

  //filter for controller input p1 and p2
  always @(negedge clk)
  begin
    r_c1p9  <= {C1P9, r_c1p9[7:1]};
    r_c2p9  <= {C2P9, r_c2p9[7:1]};
  end

endmodule
