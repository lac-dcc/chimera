// This program was cloned from: https://github.com/pcornier/FM-7_MiSTer
// License: GNU General Public License v2.0

//
// YM-2149 / AY-3-8910 Complex Sound Generator
// Matthew Hagerty
// June 2020
// https://dnotq.io
//

// Released under the 3-Clause BSD License:
//
// Copyright 2020 Matthew Hagerty (matthew <at> dnotq <dot> io)
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// 1. Redistributions of source code must retain the above copyright notice,
// this list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright
// notice, this list of conditions and the following disclaimer in the
// documentation and/or other materials provided with the distribution.
//
// 3. Neither the name of the copyright holder nor the names of its
// contributors may be used to endorse or promote products derived from this
// software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

//
// This core is based mostly on the YM-2149 Programmable Sound Generator (PSG),
// which is an upgraded version of the AY-3-8913 PSG.  The main changes in the
// YM-2149 over the AY-3-8910 are:
//
//   * 5-bit envelope shape counter for smoother volume ramping, with 1.5dB
//     logarithmic steps.
//   * simplified host interface, i.e. no BC2 input.
//   * option to divide the input clock in half prior to further dividing.
//
//
// TODO: Currently the two external 8-bit I/O ports are not implemented.
// Their implementation should be easy enough, so it will probably happen in
// the future when a system that uses the I/O is implemented (they would need
// to be tested, and the SoC that this core was initially written for does not
// use the PSG's I/O ports).

// A huge amount of effort has gone into making this core as accurate as
// possible to the real IC, while at the same time making it usable in all-
// digital SoC designs, i.e. retro-computer and game systems, etc.  Design
// elements from the real IC were used and implemented when possible, with any
// work-around or changes noted along with the reasons.
//
// Synthesized and FPGA proven:
//
//   * Xilinx Spartan-6 LX16, SoC 25.0MHz system clock, 3.58MHz clock-enable.
//
//
// References:
//
//   * The AY-3-8910 die-shot and reverse engineered schematic.  This was the
//     most beneficial reference and greatly appreciated!  Removes any questions
//     about what the real IC does.
//     https://github.com/lvd2/ay-3-8910_reverse_engineered
//   * The YM-2149 and AY-3-8910 datasheets.
//   * Real YM-2149 IC.
//   * Chip quirks, use, and abuse details from friends and retro enthusiasts.
//
//
// Generates:
//
//   * Unsigned 12-bit output for each channel.
//   * Unsigned 14-bit summation of the channels.
//   * Signed 14-bit PCM summation of the channels, with each channel
//     converted to -/+ zero-centered level or -/+ full-range level.
//
// The tone counters are period-limited to prevent the very high frequency
// outputs that the original IC is capable of producing.  Frequencies above
// 20KHz cause problems in all-digital systems with sampling rates around
// 44.1KHz to 48KHz.  The primary use of these high frequencies was as a
// carrier for amplitude modulated (AM) audio.  The high frequency would be
// filtered out by external electronics, leaving only the low frequency audio.
//
// When the tone counters are limited, the normal square-wave is set to always
// output a '1', but the amplitude can still be changed, which allows the A.M.
// technique to still work in a digital Soc.
//

// Clock, Clock-enable, and Sel.
//
// The clk_i input should be the full-speed clock of the system, and
// en_clk_psg_i must be a strobe (single clk_i tick) at the PSG operating
// frequency.
//
// If the sel_n_i input is used to divide the en_clk_psg_i strobe, the host
// interface will continue to operate with the non-divided en_clk_psg_i strobe.
//
// sel_n_i          :    0       1
// en_clk_psg_i max :  4.0MHz  2.0MHz
//
// This core can use a much faster clock-enable than the original PSG, however
// the clock-enable frequency affects the output audio frequency directly.  If
// producing sounds similar to the original ICs is desired, then using an
// accurate input clock-enable is important.
//
// In circuits where these PSG ICs were used, the clocks tend to be derived
// from division of the video clock frequency, and generally fell very close to
// a frequency of 1.78MHz.
//
// Internally the PSG divides the clock by 3 or 4 to obtain a typical internal
// operating frequency of around 447KHz.  Some PSGs take this lower frequency
// directly, but most do clock division internally to reduce the external
// components needed by a designed using the PSG IC.
//
// Common frequencies found in retro systems:
//
//  Crystal        Pixel          CPU            PSG        other PSG
// 10.738MHz  /2 = 5.369MHz  /3 = 3.579MHz  /6 = 1.789MHz /24 = 447.437KHz
// 14.318MHz  /2 = 7.159MHz  /4 = 3.579MHz  /8 = 1.789MHz
// 21.477MHz  /2 =10.738MHz  /6 = 3.579MHz /12 = 1.789MHz
//
// A pixel clock of 5.369MHz is common for NTSC, and 7.159MHz is common for
// standard resolution arcade games.
//

// Basic host interface, uses the simplified form where BC2 is not used or
// exposed externally (AY-3-8913).
//
//   BDIR  BC1     State
//     0    0    Inactive
//     0    1    Read from PSG
//     1    0    Write to PSG
//     1    1    Latch address
//

//
// Version history:
//
// June 28 2020
//   V1.0.  Release.  SoC tested.
//


module ym2149_audio
  (input  clk_i,
   input  en_clk_psg_i,
   input  sel_n_i,
   input  reset_n_i,
   input  bc_i,
   input  bdir_i,
   input  [7:0] data_i,
   output [7:0] data_r_o,
   output [11:0] ch_a_o,
   output [11:0] ch_b_o,
   output [11:0] ch_c_o,
   output [13:0] mix_audio_o,
   output [13:0] pcm14s_o);
  reg [3:0] reg_addr_r;
  wire [3:0] reg_addr_x;
  reg [7:0] data_i_r;
  reg [7:0] data_o_r;
  reg [1:0] busctl_r;
  reg sel_n_r;
  reg sel_ff_r;
  wire sel_ff_x;
  wire en_int_clk_psg_s;
  reg [127:0] reg_file_ar;
  wire en_data_rd_s;
  wire en_data_wr_s;
  reg [11:0] ch_a_level_r;
  wire [11:0] ch_a_level_x;
  reg [11:0] ch_b_level_r;
  wire [11:0] ch_b_level_x;
  reg [11:0] ch_c_level_r;
  wire [11:0] ch_c_level_x;
  reg [11:0] ch_a_period_s;
  wire ch_a_tone_en_n_s;
  wire ch_a_noise_en_n_s;
  wire ch_a_mode_s;
  reg [11:0] ch_b_period_s;
  wire ch_b_tone_en_n_s;
  wire ch_b_noise_en_n_s;
  wire ch_b_mode_s;
  reg [11:0] ch_c_period_s;
  wire ch_c_tone_en_n_s;
  wire ch_c_noise_en_n_s;
  wire ch_c_mode_s;
  reg [4:0] noise_period_s;
  wire [15:0] env_period_s;
  wire env_continue_s;
  wire env_attack_s;
  wire env_alternate_s;
  wire env_hold_s;
  reg [2:0] clk_div8_r;
  wire [2:0] clk_div8_x;
  reg en_cnt_r;
  wire en_cnt_x;
  reg [11:0] ch_a_cnt_r;
  wire [11:0] ch_a_cnt_x;
  wire flatline_a_s;
  reg tone_a_r;
  wire tone_a_x;
  reg [11:0] ch_b_cnt_r;
  wire [11:0] ch_b_cnt_x;
  wire flatline_b_s;
  reg tone_b_r;
  wire tone_b_x;
  reg [11:0] ch_c_cnt_r;
  wire [11:0] ch_c_cnt_x;
  wire flatline_c_s;
  reg tone_c_r;
  wire tone_c_x;
  reg [4:0] noise_cnt_r;
  wire [4:0] noise_cnt_x;
  wire flatline_n_s;
  reg noise_ff_r;
  wire noise_ff_x;
  reg [16:0] noise_lfsr_r;
  wire [16:0] noise_lfsr_x;
  wire noise_fb_s;
  wire noise_s;
  wire mix_a_s;
  wire mix_b_s;
  wire mix_c_s;
  reg env_shape_wr_r;
  wire env_shape_wr_x;
  wire env_rst_s;
  reg [15:0] env_cnt_r;
  wire [15:0] env_cnt_x;
  reg env_ff_r;
  wire env_ff_x;
  reg [4:0] shape_cnt_r;
  wire [4:0] shape_cnt_x;
  reg continue_ff_r;
  wire continue_ff_x;
  reg attack_ff_r;
  wire attack_ff_x;
  reg hold_ff_r;
  wire hold_ff_x;
  wire env_sel_s;
  reg [4:0] env_out_s;
  wire [11:0] level_a_s;
  wire [11:0] level_b_s;
  wire [11:0] level_c_s;
  reg [11:0] dac_a_r;
  reg [11:0] dac_b_r;
  reg [11:0] dac_c_r;
  reg [13:0] sum_audio_r;
  reg dac_reg_bit0_s;
  wire [11:0] dac_reg_level_s;
  wire [11:0] dac_env_level_s;
  reg [383:0] dacrom_ar;
  reg [11:0] sign_a_r;
  wire [11:0] sign_a_x;
  wire [11:0] level_a_env_s;
  reg [11:0] sign_b_r;
  wire [11:0] sign_b_x;
  wire [11:0] level_b_env_s;
  reg [11:0] sign_c_r;
  wire [11:0] sign_c_x;
  wire [11:0] level_c_env_s;
  reg [13:0] pcm14s_r;
  wire [1:0] n52_o;
  wire n60_o;
  wire n62_o;
  wire n64_o;
  wire [3:0] n65_o;
  wire n67_o;
  wire [3:0] n68_o;
  wire [3:0] n69_o;
  wire [2:0] n70_o;
  reg [3:0] n71_o;
  reg n74_o;
  reg n78_o;
  wire n82_o;
  wire n83_o;
  wire [3:0] n86_o;
  wire n88_o;
  wire n89_o;
  wire [3:0] n91_o;
  wire [4:0] n92_o;
  wire [4:0] n95_o;
  wire n99_o;
  wire [11:0] n100_o;
  wire n102_o;
  wire [11:0] n103_o;
  wire n105_o;
  wire [11:0] n106_o;
  wire n110_o;
  wire [3:0] n129_o;
  wire [3:0] n134_o;
  wire [127:0] n137_o;
  wire [11:0] n138_o;
  wire [11:0] n139_o;
  wire [11:0] n140_o;
  wire [7:0] n141_o;
  wire [127:0] n142_o;
  wire [11:0] n143_o;
  wire [11:0] n144_o;
  wire [11:0] n145_o;
  wire [3:0] n146_o;
  wire n147_o;
  wire [127:0] n148_o;
  wire [11:0] n149_o;
  wire [11:0] n150_o;
  wire [11:0] n151_o;
  wire n152_o;
  wire [3:0] n154_o;
  wire [7:0] n156_o;
  wire [127:0] n157_o;
  wire [127:0] n158_o;
  wire [11:0] n160_o;
  wire [11:0] n162_o;
  wire [11:0] n164_o;
  wire n166_o;
  wire [3:0] n175_o;
  wire [7:0] n176_o;
  wire [11:0] n177_o;
  wire n178_o;
  wire n179_o;
  wire n180_o;
  wire [3:0] n181_o;
  wire [7:0] n182_o;
  wire [11:0] n183_o;
  wire n184_o;
  wire n185_o;
  wire n186_o;
  wire [3:0] n187_o;
  wire [7:0] n188_o;
  wire [11:0] n189_o;
  wire n190_o;
  wire n191_o;
  wire n192_o;
  wire [4:0] n193_o;
  wire [7:0] n194_o;
  wire [7:0] n195_o;
  wire [15:0] n196_o;
  wire n197_o;
  wire n198_o;
  wire n199_o;
  wire n200_o;
  wire n201_o;
  wire n202_o;
  wire n203_o;
  wire n204_o;
  wire [2:0] n212_o;
  wire n215_o;
  wire n216_o;
  wire n221_o;
  wire [2:0] n222_o;
  wire n223_o;
  wire [2:0] n225_o;
  wire n227_o;
  wire n232_o;
  wire n233_o;
  wire [11:0] n234_o;
  wire [11:0] n236_o;
  wire [11:0] n237_o;
  wire n240_o;
  wire n241_o;
  wire n244_o;
  wire n245_o;
  wire n246_o;
  wire n247_o;
  wire n248_o;
  wire n250_o;
  wire n251_o;
  wire [11:0] n252_o;
  wire [11:0] n254_o;
  wire [11:0] n255_o;
  wire n258_o;
  wire n259_o;
  wire n262_o;
  wire n263_o;
  wire n264_o;
  wire n265_o;
  wire n266_o;
  wire n268_o;
  wire n269_o;
  wire [11:0] n270_o;
  wire [11:0] n272_o;
  wire [11:0] n273_o;
  wire n276_o;
  wire n277_o;
  wire n280_o;
  wire n281_o;
  wire n282_o;
  wire n283_o;
  wire n284_o;
  wire n288_o;
  wire [11:0] n289_o;
  wire n290_o;
  wire [11:0] n291_o;
  wire n292_o;
  wire [11:0] n293_o;
  wire n294_o;
  wire [11:0] n296_o;
  wire n298_o;
  wire [11:0] n300_o;
  wire n302_o;
  wire [11:0] n304_o;
  wire n306_o;
  wire n315_o;
  wire n316_o;
  wire [4:0] n317_o;
  wire [4:0] n319_o;
  wire [4:0] n320_o;
  wire n323_o;
  wire n324_o;
  wire n327_o;
  wire n328_o;
  wire n329_o;
  wire n330_o;
  wire n331_o;
  wire n332_o;
  wire n333_o;
  wire n334_o;
  wire [15:0] n335_o;
  wire [16:0] n336_o;
  wire n337_o;
  wire n341_o;
  wire n342_o;
  wire n343_o;
  wire [16:0] n344_o;
  wire [4:0] n345_o;
  wire n346_o;
  wire n347_o;
  wire [4:0] n349_o;
  wire n351_o;
  wire [16:0] n353_o;
  wire n358_o;
  wire n359_o;
  wire n360_o;
  wire n361_o;
  wire n362_o;
  wire n363_o;
  wire n364_o;
  wire n365_o;
  wire n366_o;
  wire n368_o;
  wire n369_o;
  wire [15:0] n370_o;
  wire [15:0] n372_o;
  wire [15:0] n373_o;
  wire n374_o;
  wire n375_o;
  wire n376_o;
  wire n377_o;
  wire n378_o;
  wire n379_o;
  wire [4:0] n381_o;
  wire [4:0] n383_o;
  wire n387_o;
  wire n388_o;
  wire n389_o;
  wire [4:0] n390_o;
  wire [15:0] n391_o;
  wire n392_o;
  wire n393_o;
  wire [15:0] n395_o;
  wire n397_o;
  wire [4:0] n399_o;
  wire n405_o;
  wire n406_o;
  wire n407_o;
  wire n408_o;
  wire n409_o;
  wire n411_o;
  wire n412_o;
  wire n413_o;
  wire n415_o;
  wire n416_o;
  wire n418_o;
  wire [4:0] n419_o;
  wire [4:0] n420_o;
  wire n421_o;
  wire [4:0] n422_o;
  wire [4:0] n425_o;
  wire n431_o;
  wire n432_o;
  wire n433_o;
  wire n434_o;
  wire n435_o;
  wire n436_o;
  wire n437_o;
  wire n438_o;
  wire n439_o;
  wire n441_o;
  wire n443_o;
  wire n445_o;
  wire n451_o;
  wire [11:0] n452_o;
  wire n453_o;
  wire [11:0] n454_o;
  wire n456_o;
  wire [11:0] n457_o;
  wire n458_o;
  wire [11:0] n459_o;
  wire n461_o;
  wire [11:0] n462_o;
  wire n463_o;
  wire [11:0] n464_o;
  wire [13:0] n469_o;
  wire [13:0] n471_o;
  wire [13:0] n472_o;
  wire [13:0] n474_o;
  wire [13:0] n475_o;
  wire n485_o;
  wire [11:0] n486_o;
  wire n487_o;
  wire [11:0] n488_o;
  wire n489_o;
  wire [11:0] n490_o;
  wire [11:0] n492_o;
  wire n493_o;
  wire n494_o;
  wire n495_o;
  wire n496_o;
  wire n497_o;
  wire [11:0] n498_o;
  wire [10:0] n499_o;
  wire [10:0] n500_o;
  wire [11:0] n502_o;
  wire [11:0] n504_o;
  wire n505_o;
  wire [11:0] n506_o;
  wire [10:0] n507_o;
  wire [11:0] n509_o;
  wire [11:0] n511_o;
  wire n512_o;
  wire n513_o;
  wire n514_o;
  wire n515_o;
  wire n516_o;
  wire [11:0] n517_o;
  wire [10:0] n518_o;
  wire [10:0] n519_o;
  wire [11:0] n521_o;
  wire [11:0] n523_o;
  wire n524_o;
  wire [11:0] n525_o;
  wire [10:0] n526_o;
  wire [11:0] n528_o;
  wire [11:0] n530_o;
  wire n531_o;
  wire n532_o;
  wire n533_o;
  wire n534_o;
  wire n535_o;
  wire [11:0] n536_o;
  wire [10:0] n537_o;
  wire [10:0] n538_o;
  wire [11:0] n540_o;
  wire [11:0] n542_o;
  wire n543_o;
  wire [11:0] n544_o;
  wire [10:0] n545_o;
  wire [11:0] n547_o;
  wire n551_o;
  wire n552_o;
  wire [1:0] n553_o;
  wire [13:0] n554_o;
  wire n555_o;
  wire n556_o;
  wire [1:0] n557_o;
  wire [13:0] n558_o;
  wire [13:0] n559_o;
  wire n560_o;
  wire n561_o;
  wire [1:0] n562_o;
  wire [13:0] n563_o;
  wire [13:0] n564_o;
  reg [3:0] n574_q;
  reg [7:0] n575_q;
  reg [7:0] n576_q;
  reg [1:0] n577_q;
  reg n578_q;
  wire n579_o;
  reg n580_q;
  reg [127:0] n581_q;
  reg [11:0] n582_q;
  reg [11:0] n583_q;
  reg [11:0] n584_q;
  reg [2:0] n585_q;
  reg n586_q;
  reg [11:0] n587_q;
  reg n588_q;
  reg [11:0] n589_q;
  reg n590_q;
  reg [11:0] n591_q;
  reg n592_q;
  reg [4:0] n593_q;
  reg n594_q;
  reg [16:0] n595_q;
  reg n596_q;
  reg [15:0] n597_q;
  reg n598_q;
  reg [4:0] n599_q;
  reg n600_q;
  reg n601_q;
  reg n602_q;
  wire [11:0] n603_o;
  reg [11:0] n604_q;
  wire [11:0] n605_o;
  reg [11:0] n606_q;
  wire [11:0] n607_o;
  reg [11:0] n608_q;
  wire [13:0] n609_o;
  reg [13:0] n610_q;
  wire [11:0] n611_o;
  reg [11:0] n612_q;
  wire [11:0] n613_o;
  reg [11:0] n614_q;
  wire [11:0] n615_o;
  reg [11:0] n616_q;
  wire [13:0] n617_o;
  reg [13:0] n618_q;
  wire [11:0] n620_data; // mem_rd
  wire [11:0] n621_data; // mem_rd
  wire [7:0] n622_o;
  wire [7:0] n623_o;
  wire [7:0] n624_o;
  wire [7:0] n625_o;
  wire [7:0] n626_o;
  wire [7:0] n627_o;
  wire [7:0] n628_o;
  wire [7:0] n629_o;
  wire [7:0] n630_o;
  wire [7:0] n631_o;
  wire [7:0] n632_o;
  wire [7:0] n633_o;
  wire [7:0] n634_o;
  wire [7:0] n635_o;
  wire [7:0] n636_o;
  wire [7:0] n637_o;
  wire [1:0] n638_o;
  reg [7:0] n639_o;
  wire [1:0] n640_o;
  reg [7:0] n641_o;
  wire [1:0] n642_o;
  reg [7:0] n643_o;
  wire [1:0] n644_o;
  reg [7:0] n645_o;
  wire [1:0] n646_o;
  reg [7:0] n647_o;
  wire n648_o;
  wire n649_o;
  wire n650_o;
  wire n651_o;
  wire n652_o;
  wire n653_o;
  wire n654_o;
  wire n655_o;
  wire n656_o;
  wire n657_o;
  wire n658_o;
  wire n659_o;
  wire n660_o;
  wire n661_o;
  wire n662_o;
  wire n663_o;
  wire n664_o;
  wire n665_o;
  wire n666_o;
  wire n667_o;
  wire n668_o;
  wire n669_o;
  wire n670_o;
  wire n671_o;
  wire n672_o;
  wire n673_o;
  wire n674_o;
  wire n675_o;
  wire n676_o;
  wire n677_o;
  wire n678_o;
  wire n679_o;
  wire n680_o;
  wire n681_o;
  wire n682_o;
  wire n683_o;
  wire [7:0] n684_o;
  wire [7:0] n685_o;
  wire [7:0] n686_o;
  wire [7:0] n687_o;
  wire [7:0] n688_o;
  wire [7:0] n689_o;
  wire [7:0] n690_o;
  wire [7:0] n691_o;
  wire [7:0] n692_o;
  wire [7:0] n693_o;
  wire [7:0] n694_o;
  wire [7:0] n695_o;
  wire [7:0] n696_o;
  wire [7:0] n697_o;
  wire [7:0] n698_o;
  wire [7:0] n699_o;
  wire [7:0] n700_o;
  wire [7:0] n701_o;
  wire [7:0] n702_o;
  wire [7:0] n703_o;
  wire [7:0] n704_o;
  wire [7:0] n705_o;
  wire [7:0] n706_o;
  wire [7:0] n707_o;
  wire [7:0] n708_o;
  wire [7:0] n709_o;
  wire [7:0] n710_o;
  wire [7:0] n711_o;
  wire [7:0] n712_o;
  wire [7:0] n713_o;
  wire [7:0] n714_o;
  wire [7:0] n715_o;
  wire [127:0] n716_o;
  assign data_r_o = data_o_r;
  assign ch_a_o = dac_a_r;
  assign ch_b_o = dac_b_r;
  assign ch_c_o = dac_c_r;
  assign mix_audio_o = sum_audio_r;
  assign pcm14s_o = pcm14s_r;
  /* ym2149_audio.vhd:30:11  */
  always @*
    reg_addr_r = n574_q; // (isignal)
  initial
    reg_addr_r = 4'b0000;
  /* ym2149_audio.vhd:31:11  */
  assign reg_addr_x = n71_o; // (signal)
  /* ym2149_audio.vhd:32:11  */
  always @*
    data_i_r = n575_q; // (isignal)
  initial
    data_i_r = 8'b00000000;
  /* ym2149_audio.vhd:33:11  */
  always @*
    data_o_r = n576_q; // (isignal)
  initial
    data_o_r = 8'b00000000;
  /* ym2149_audio.vhd:34:11  */
  always @*
    busctl_r = n577_q; // (isignal)
  initial
    busctl_r = 2'b00;
  /* ym2149_audio.vhd:35:11  */
  always @*
    sel_n_r = n578_q; // (isignal)
  initial
    sel_n_r = 1'b1;
  /* ym2149_audio.vhd:36:11  */
  always @*
    sel_ff_r = n580_q; // (isignal)
  initial
    sel_ff_r = 1'b1;
  /* ym2149_audio.vhd:37:11  */
  assign sel_ff_x = n201_o; // (signal)
  /* ym2149_audio.vhd:38:11  */
  assign en_int_clk_psg_s = n204_o; // (signal)
  /* ym2149_audio.vhd:42:11  */
  always @*
    reg_file_ar = n581_q; // (isignal)
  initial
    reg_file_ar = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
  /* ym2149_audio.vhd:44:11  */
  assign en_data_rd_s = n74_o; // (signal)
  /* ym2149_audio.vhd:45:11  */
  assign en_data_wr_s = n78_o; // (signal)
  /* ym2149_audio.vhd:48:11  */
  always @*
    ch_a_level_r = n582_q; // (isignal)
  initial
    ch_a_level_r = 12'b000000000000;
  /* ym2149_audio.vhd:49:11  */
  assign ch_a_level_x = n100_o; // (signal)
  /* ym2149_audio.vhd:50:11  */
  always @*
    ch_b_level_r = n583_q; // (isignal)
  initial
    ch_b_level_r = 12'b000000000000;
  /* ym2149_audio.vhd:51:11  */
  assign ch_b_level_x = n103_o; // (signal)
  /* ym2149_audio.vhd:52:11  */
  always @*
    ch_c_level_r = n584_q; // (isignal)
  initial
    ch_c_level_r = 12'b000000000000;
  /* ym2149_audio.vhd:53:11  */
  assign ch_c_level_x = n106_o; // (signal)
  /* ym2149_audio.vhd:59:11  */
  always @*
    ch_a_period_s = n177_o; // (isignal)
  initial
    ch_a_period_s = 12'b000000000000;
  /* ym2149_audio.vhd:60:11  */
  assign ch_a_tone_en_n_s = n178_o; // (signal)
  /* ym2149_audio.vhd:61:11  */
  assign ch_a_noise_en_n_s = n179_o; // (signal)
  /* ym2149_audio.vhd:62:11  */
  assign ch_a_mode_s = n180_o; // (signal)
  /* ym2149_audio.vhd:64:11  */
  always @*
    ch_b_period_s = n183_o; // (isignal)
  initial
    ch_b_period_s = 12'b000000000000;
  /* ym2149_audio.vhd:65:11  */
  assign ch_b_tone_en_n_s = n184_o; // (signal)
  /* ym2149_audio.vhd:66:11  */
  assign ch_b_noise_en_n_s = n185_o; // (signal)
  /* ym2149_audio.vhd:67:11  */
  assign ch_b_mode_s = n186_o; // (signal)
  /* ym2149_audio.vhd:69:11  */
  always @*
    ch_c_period_s = n189_o; // (isignal)
  initial
    ch_c_period_s = 12'b000000000000;
  /* ym2149_audio.vhd:70:11  */
  assign ch_c_tone_en_n_s = n190_o; // (signal)
  /* ym2149_audio.vhd:71:11  */
  assign ch_c_noise_en_n_s = n191_o; // (signal)
  /* ym2149_audio.vhd:72:11  */
  assign ch_c_mode_s = n192_o; // (signal)
  /* ym2149_audio.vhd:74:11  */
  always @*
    noise_period_s = n193_o; // (isignal)
  initial
    noise_period_s = 5'b00000;
  /* ym2149_audio.vhd:76:11  */
  assign env_period_s = n196_o; // (signal)
  /* ym2149_audio.vhd:77:11  */
  assign env_continue_s = n197_o; // (signal)
  /* ym2149_audio.vhd:78:11  */
  assign env_attack_s = n198_o; // (signal)
  /* ym2149_audio.vhd:79:11  */
  assign env_alternate_s = n199_o; // (signal)
  /* ym2149_audio.vhd:80:11  */
  assign env_hold_s = n200_o; // (signal)
  /* ym2149_audio.vhd:83:11  */
  always @*
    clk_div8_r = n585_q; // (isignal)
  initial
    clk_div8_r = 3'b000;
  /* ym2149_audio.vhd:84:11  */
  assign clk_div8_x = n212_o; // (signal)
  /* ym2149_audio.vhd:85:11  */
  always @*
    en_cnt_r = n586_q; // (isignal)
  initial
    en_cnt_r = 1'b0;
  /* ym2149_audio.vhd:86:11  */
  assign en_cnt_x = n216_o; // (signal)
  /* ym2149_audio.vhd:89:11  */
  always @*
    ch_a_cnt_r = n587_q; // (isignal)
  initial
    ch_a_cnt_r = 12'b000000000000;
  /* ym2149_audio.vhd:90:11  */
  assign ch_a_cnt_x = n234_o; // (signal)
  /* ym2149_audio.vhd:91:11  */
  assign flatline_a_s = n241_o; // (signal)
  /* ym2149_audio.vhd:92:11  */
  always @*
    tone_a_r = n588_q; // (isignal)
  initial
    tone_a_r = 1'b1;
  /* ym2149_audio.vhd:93:11  */
  assign tone_a_x = n244_o; // (signal)
  /* ym2149_audio.vhd:95:11  */
  always @*
    ch_b_cnt_r = n589_q; // (isignal)
  initial
    ch_b_cnt_r = 12'b000000000000;
  /* ym2149_audio.vhd:96:11  */
  assign ch_b_cnt_x = n252_o; // (signal)
  /* ym2149_audio.vhd:97:11  */
  assign flatline_b_s = n259_o; // (signal)
  /* ym2149_audio.vhd:98:11  */
  always @*
    tone_b_r = n590_q; // (isignal)
  initial
    tone_b_r = 1'b1;
  /* ym2149_audio.vhd:99:11  */
  assign tone_b_x = n262_o; // (signal)
  /* ym2149_audio.vhd:101:11  */
  always @*
    ch_c_cnt_r = n591_q; // (isignal)
  initial
    ch_c_cnt_r = 12'b000000000000;
  /* ym2149_audio.vhd:102:11  */
  assign ch_c_cnt_x = n270_o; // (signal)
  /* ym2149_audio.vhd:103:11  */
  assign flatline_c_s = n277_o; // (signal)
  /* ym2149_audio.vhd:104:11  */
  always @*
    tone_c_r = n592_q; // (isignal)
  initial
    tone_c_r = 1'b1;
  /* ym2149_audio.vhd:105:11  */
  assign tone_c_x = n280_o; // (signal)
  /* ym2149_audio.vhd:107:11  */
  always @*
    noise_cnt_r = n593_q; // (isignal)
  initial
    noise_cnt_r = 5'b00000;
  /* ym2149_audio.vhd:108:11  */
  assign noise_cnt_x = n317_o; // (signal)
  /* ym2149_audio.vhd:109:11  */
  assign flatline_n_s = n324_o; // (signal)
  /* ym2149_audio.vhd:110:11  */
  always @*
    noise_ff_r = n594_q; // (isignal)
  initial
    noise_ff_r = 1'b1;
  /* ym2149_audio.vhd:111:11  */
  assign noise_ff_x = n327_o; // (signal)
  /* ym2149_audio.vhd:114:11  */
  always @*
    noise_lfsr_r = n595_q; // (isignal)
  initial
    noise_lfsr_r = 17'b10000000000000000;
  /* ym2149_audio.vhd:115:11  */
  assign noise_lfsr_x = n336_o; // (signal)
  /* ym2149_audio.vhd:116:11  */
  assign noise_fb_s = n334_o; // (signal)
  /* ym2149_audio.vhd:117:11  */
  assign noise_s = n337_o; // (signal)
  /* ym2149_audio.vhd:120:11  */
  assign mix_a_s = n360_o; // (signal)
  /* ym2149_audio.vhd:121:11  */
  assign mix_b_s = n363_o; // (signal)
  /* ym2149_audio.vhd:122:11  */
  assign mix_c_s = n366_o; // (signal)
  /* ym2149_audio.vhd:125:11  */
  always @*
    env_shape_wr_r = n596_q; // (isignal)
  initial
    env_shape_wr_r = 1'b0;
  /* ym2149_audio.vhd:126:11  */
  assign env_shape_wr_x = n83_o; // (signal)
  /* ym2149_audio.vhd:127:11  */
  assign env_rst_s = n379_o; // (signal)
  /* ym2149_audio.vhd:128:11  */
  always @*
    env_cnt_r = n597_q; // (isignal)
  initial
    env_cnt_r = 16'b0000000000000000;
  /* ym2149_audio.vhd:129:11  */
  assign env_cnt_x = n370_o; // (signal)
  /* ym2149_audio.vhd:130:11  */
  always @*
    env_ff_r = n598_q; // (isignal)
  initial
    env_ff_r = 1'b1;
  /* ym2149_audio.vhd:131:11  */
  assign env_ff_x = n377_o; // (signal)
  /* ym2149_audio.vhd:133:11  */
  always @*
    shape_cnt_r = n599_q; // (isignal)
  initial
    shape_cnt_r = 5'b00000;
  /* ym2149_audio.vhd:134:11  */
  assign shape_cnt_x = n381_o; // (signal)
  /* ym2149_audio.vhd:136:11  */
  always @*
    continue_ff_r = n600_q; // (isignal)
  initial
    continue_ff_r = 1'b1;
  /* ym2149_audio.vhd:137:11  */
  assign continue_ff_x = n406_o; // (signal)
  /* ym2149_audio.vhd:138:11  */
  always @*
    attack_ff_r = n601_q; // (isignal)
  initial
    attack_ff_r = 1'b0;
  /* ym2149_audio.vhd:139:11  */
  assign attack_ff_x = n413_o; // (signal)
  /* ym2149_audio.vhd:140:11  */
  always @*
    hold_ff_r = n602_q; // (isignal)
  initial
    hold_ff_r = 1'b0;
  /* ym2149_audio.vhd:141:11  */
  assign hold_ff_x = n416_o; // (signal)
  /* ym2149_audio.vhd:142:11  */
  assign env_sel_s = n408_o; // (signal)
  /* ym2149_audio.vhd:143:11  */
  always @*
    env_out_s = n419_o; // (isignal)
  initial
    env_out_s = 5'b00000;
  /* ym2149_audio.vhd:144:11  */
  assign level_a_s = n452_o; // (signal)
  /* ym2149_audio.vhd:145:11  */
  assign level_b_s = n457_o; // (signal)
  /* ym2149_audio.vhd:146:11  */
  assign level_c_s = n462_o; // (signal)
  /* ym2149_audio.vhd:147:11  */
  always @*
    dac_a_r = n604_q; // (isignal)
  initial
    dac_a_r = 12'b000000000000;
  /* ym2149_audio.vhd:148:11  */
  always @*
    dac_b_r = n606_q; // (isignal)
  initial
    dac_b_r = 12'b000000000000;
  /* ym2149_audio.vhd:149:11  */
  always @*
    dac_c_r = n608_q; // (isignal)
  initial
    dac_c_r = 12'b000000000000;
  /* ym2149_audio.vhd:150:11  */
  always @*
    sum_audio_r = n610_q; // (isignal)
  initial
    sum_audio_r = 14'b00000000000000;
  /* ym2149_audio.vhd:151:11  */
  always @*
    dac_reg_bit0_s = n89_o; // (isignal)
  initial
    dac_reg_bit0_s = 1'b0;
  /* ym2149_audio.vhd:152:11  */
  assign dac_reg_level_s = n621_data; // (signal)
  /* ym2149_audio.vhd:153:11  */
  assign dac_env_level_s = n620_data; // (signal)
  /* ym2149_audio.vhd:157:11  */
  always @*
    dacrom_ar = 384'b000000000000000000010111000000011011000000100001000000100111000000101110000000110111000001000001000001001101000001011100000001101101000010000001000010011010000010110111000011011001000100000010000100110011000101101101000110110010001000000100001001100101001011011000001101100001010000000101010011000111010110101101011010111111100000000100100110000111101101010011110101110110111111111111; // (isignal)
  initial
    dacrom_ar = 384'b000000000000000000010111000000011011000000100001000000100111000000101110000000110111000001000001000001001101000001011100000001101101000010000001000010011010000010110111000011011001000100000010000100110011000101101101000110110010001000000100001001100101001011011000001101100001010000000101010011000111010110101101011010111111100000000100100110000111101101010011110101110110111111111111;
  /* ym2149_audio.vhd:159:11  */
  always @*
    sign_a_r = n612_q; // (isignal)
  initial
    sign_a_r = 12'b000000000000;
  /* ym2149_audio.vhd:160:11  */
  assign sign_a_x = n498_o; // (signal)
  /* ym2149_audio.vhd:161:11  */
  assign level_a_env_s = n486_o; // (signal)
  /* ym2149_audio.vhd:162:11  */
  always @*
    sign_b_r = n614_q; // (isignal)
  initial
    sign_b_r = 12'b000000000000;
  /* ym2149_audio.vhd:163:11  */
  assign sign_b_x = n517_o; // (signal)
  /* ym2149_audio.vhd:164:11  */
  assign level_b_env_s = n488_o; // (signal)
  /* ym2149_audio.vhd:165:11  */
  always @*
    sign_c_r = n616_q; // (isignal)
  initial
    sign_c_r = 12'b000000000000;
  /* ym2149_audio.vhd:166:11  */
  assign sign_c_x = n536_o; // (signal)
  /* ym2149_audio.vhd:167:11  */
  assign level_c_env_s = n490_o; // (signal)
  /* ym2149_audio.vhd:169:11  */
  always @*
    pcm14s_r = n618_q; // (isignal)
  initial
    pcm14s_r = 14'b00000000000000;
  /* ym2149_audio.vhd:176:26  */
  assign n52_o = {bdir_i, bc_i};
  /* ym2149_audio.vhd:194:7  */
  assign n60_o = busctl_r == 2'b00;
  /* ym2149_audio.vhd:196:7  */
  assign n62_o = busctl_r == 2'b01;
  /* ym2149_audio.vhd:198:7  */
  assign n64_o = busctl_r == 2'b10;
  /* ym2149_audio.vhd:204:21  */
  assign n65_o = data_i_r[7:4];
  /* ym2149_audio.vhd:204:34  */
  assign n67_o = n65_o == 4'b0000;
  /* ym2149_audio.vhd:205:44  */
  assign n68_o = data_i_r[3:0];
  /* ym2149_audio.vhd:204:10  */
  assign n69_o = n67_o ? n68_o : reg_addr_r;
  assign n70_o = {n64_o, n62_o, n60_o};
  /* ym2149_audio.vhd:193:7  */
  always @*
    case (n70_o)
      3'b100: n71_o = reg_addr_r;
      3'b010: n71_o = reg_addr_r;
      3'b001: n71_o = reg_addr_r;
      default: n71_o = n69_o;
    endcase
  /* ym2149_audio.vhd:193:7  */
  always @*
    case (n70_o)
      3'b100: n74_o = 1'b0;
      3'b010: n74_o = 1'b1;
      3'b001: n74_o = 1'b0;
      default: n74_o = 1'b0;
    endcase
  /* ym2149_audio.vhd:193:7  */
  always @*
    case (n70_o)
      3'b100: n78_o = 1'b1;
      3'b010: n78_o = 1'b0;
      3'b001: n78_o = 1'b0;
      default: n78_o = 1'b0;
    endcase
  /* ym2149_audio.vhd:214:51  */
  assign n82_o = reg_addr_r == 4'b1101;
  /* ym2149_audio.vhd:214:35  */
  assign n83_o = n82_o ? en_data_wr_s : 1'b0;
  /* ym2149_audio.vhd:220:40  */
  assign n86_o = data_i_r[3:0];
  /* ym2149_audio.vhd:220:53  */
  assign n88_o = n86_o == 4'b0000;
  /* ym2149_audio.vhd:220:27  */
  assign n89_o = n88_o ? 1'b0 : 1'b1;
  /* ym2149_audio.vhd:221:61  */
  assign n91_o = data_i_r[3:0];
  /* ym2149_audio.vhd:221:74  */
  assign n92_o = {n91_o, dac_reg_bit0_s};
  /* ym2149_audio.vhd:221:33  */
  assign n95_o = 5'b11111 - n92_o;
  /* ym2149_audio.vhd:223:52  */
  assign n99_o = reg_addr_r == 4'b1000;
  /* ym2149_audio.vhd:223:36  */
  assign n100_o = n99_o ? dac_reg_level_s : ch_a_level_r;
  /* ym2149_audio.vhd:224:52  */
  assign n102_o = reg_addr_r == 4'b1001;
  /* ym2149_audio.vhd:224:36  */
  assign n103_o = n102_o ? dac_reg_level_s : ch_b_level_r;
  /* ym2149_audio.vhd:225:52  */
  assign n105_o = reg_addr_r == 4'b1010;
  /* ym2149_audio.vhd:225:36  */
  assign n106_o = n105_o ? dac_reg_level_s : ch_c_level_r;
  /* ym2149_audio.vhd:234:20  */
  assign n110_o = ~reset_n_i;
  /* ym2149_audio.vhd:266:37  */
  assign n129_o = 4'b1111 - reg_addr_r;
  /* ym2149_audio.vhd:268:25  */
  assign n134_o = 4'b1111 - reg_addr_r;
  /* ym2149_audio.vhd:267:10  */
  assign n137_o = en_data_wr_s ? n716_o : reg_file_ar;
  /* ym2149_audio.vhd:267:10  */
  assign n138_o = en_data_wr_s ? ch_a_level_x : ch_a_level_r;
  /* ym2149_audio.vhd:267:10  */
  assign n139_o = en_data_wr_s ? ch_b_level_x : ch_b_level_r;
  /* ym2149_audio.vhd:267:10  */
  assign n140_o = en_data_wr_s ? ch_c_level_x : ch_c_level_r;
  /* ym2149_audio.vhd:260:7  */
  assign n141_o = n147_o ? n647_o : data_o_r;
  /* ym2149_audio.vhd:265:10  */
  assign n142_o = en_data_rd_s ? reg_file_ar : n137_o;
  /* ym2149_audio.vhd:265:10  */
  assign n143_o = en_data_rd_s ? ch_a_level_r : n138_o;
  /* ym2149_audio.vhd:265:10  */
  assign n144_o = en_data_rd_s ? ch_b_level_r : n139_o;
  /* ym2149_audio.vhd:265:10  */
  assign n145_o = en_data_rd_s ? ch_c_level_r : n140_o;
  /* ym2149_audio.vhd:260:7  */
  assign n146_o = en_clk_psg_i ? reg_addr_x : reg_addr_r;
  /* ym2149_audio.vhd:260:7  */
  assign n147_o = en_clk_psg_i & en_data_rd_s;
  /* ym2149_audio.vhd:260:7  */
  assign n148_o = en_clk_psg_i ? n142_o : reg_file_ar;
  /* ym2149_audio.vhd:260:7  */
  assign n149_o = en_clk_psg_i ? n143_o : ch_a_level_r;
  /* ym2149_audio.vhd:260:7  */
  assign n150_o = en_clk_psg_i ? n144_o : ch_b_level_r;
  /* ym2149_audio.vhd:260:7  */
  assign n151_o = en_clk_psg_i ? n145_o : ch_c_level_r;
  /* ym2149_audio.vhd:260:7  */
  assign n152_o = en_clk_psg_i ? env_shape_wr_x : env_shape_wr_r;
  /* ym2149_audio.vhd:234:7  */
  assign n154_o = n110_o ? 4'b0000 : n146_o;
  /* ym2149_audio.vhd:234:7  */
  assign n156_o = n110_o ? 8'b00000000 : n141_o;
  assign n157_o = {8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
  /* ym2149_audio.vhd:234:7  */
  assign n158_o = n110_o ? n157_o : n148_o;
  /* ym2149_audio.vhd:234:7  */
  assign n160_o = n110_o ? 12'b100000000000 : n149_o;
  /* ym2149_audio.vhd:234:7  */
  assign n162_o = n110_o ? 12'b100000000000 : n150_o;
  /* ym2149_audio.vhd:234:7  */
  assign n164_o = n110_o ? 12'b100000000000 : n151_o;
  /* ym2149_audio.vhd:234:7  */
  assign n166_o = n110_o ? 1'b0 : n152_o;
  /* ym2149_audio.vhd:282:48  */
  assign n175_o = reg_file_ar[115:112];
  /* ym2149_audio.vhd:282:84  */
  assign n176_o = reg_file_ar[127:120];
  /* ym2149_audio.vhd:282:62  */
  assign n177_o = {n175_o, n176_o};
  /* ym2149_audio.vhd:283:39  */
  assign n178_o = reg_file_ar[64];
  /* ym2149_audio.vhd:284:39  */
  assign n179_o = reg_file_ar[67];
  /* ym2149_audio.vhd:285:39  */
  assign n180_o = reg_file_ar[60];
  /* ym2149_audio.vhd:287:48  */
  assign n181_o = reg_file_ar[99:96];
  /* ym2149_audio.vhd:287:84  */
  assign n182_o = reg_file_ar[111:104];
  /* ym2149_audio.vhd:287:62  */
  assign n183_o = {n181_o, n182_o};
  /* ym2149_audio.vhd:288:39  */
  assign n184_o = reg_file_ar[65];
  /* ym2149_audio.vhd:289:39  */
  assign n185_o = reg_file_ar[68];
  /* ym2149_audio.vhd:290:39  */
  assign n186_o = reg_file_ar[52];
  /* ym2149_audio.vhd:292:48  */
  assign n187_o = reg_file_ar[83:80];
  /* ym2149_audio.vhd:292:84  */
  assign n188_o = reg_file_ar[95:88];
  /* ym2149_audio.vhd:292:62  */
  assign n189_o = {n187_o, n188_o};
  /* ym2149_audio.vhd:293:39  */
  assign n190_o = reg_file_ar[66];
  /* ym2149_audio.vhd:294:39  */
  assign n191_o = reg_file_ar[69];
  /* ym2149_audio.vhd:295:40  */
  assign n192_o = reg_file_ar[44];
  /* ym2149_audio.vhd:297:48  */
  assign n193_o = reg_file_ar[76:72];
  /* ym2149_audio.vhd:299:45  */
  assign n194_o = reg_file_ar[31:24];
  /* ym2149_audio.vhd:299:73  */
  assign n195_o = reg_file_ar[39:32];
  /* ym2149_audio.vhd:299:51  */
  assign n196_o = {n194_o, n195_o};
  /* ym2149_audio.vhd:300:40  */
  assign n197_o = reg_file_ar[19];
  /* ym2149_audio.vhd:301:40  */
  assign n198_o = reg_file_ar[18];
  /* ym2149_audio.vhd:302:40  */
  assign n199_o = reg_file_ar[17];
  /* ym2149_audio.vhd:303:40  */
  assign n200_o = reg_file_ar[16];
  /* ym2149_audio.vhd:307:16  */
  assign n201_o = ~sel_ff_r;
  /* ym2149_audio.vhd:310:37  */
  assign n202_o = en_clk_psg_i & sel_ff_r;
  /* ym2149_audio.vhd:310:63  */
  assign n203_o = ~sel_n_r;
  /* ym2149_audio.vhd:310:50  */
  assign n204_o = n203_o ? n202_o : en_clk_psg_i;
  /* ym2149_audio.vhd:322:29  */
  assign n212_o = clk_div8_r + 3'b001;
  /* ym2149_audio.vhd:326:36  */
  assign n215_o = clk_div8_r == 3'b011;
  /* ym2149_audio.vhd:326:20  */
  assign n216_o = n215_o ? 1'b1 : 1'b0;
  /* ym2149_audio.vhd:332:20  */
  assign n221_o = ~reset_n_i;
  /* ym2149_audio.vhd:335:7  */
  assign n222_o = en_int_clk_psg_s ? clk_div8_x : clk_div8_r;
  /* ym2149_audio.vhd:335:7  */
  assign n223_o = en_int_clk_psg_s ? en_cnt_x : en_cnt_r;
  /* ym2149_audio.vhd:332:7  */
  assign n225_o = n221_o ? 3'b000 : n222_o;
  /* ym2149_audio.vhd:332:7  */
  assign n227_o = n221_o ? 1'b0 : n223_o;
  /* ym2149_audio.vhd:346:59  */
  assign n232_o = $unsigned(ch_a_cnt_r) >= $unsigned(ch_a_period_s);
  /* ym2149_audio.vhd:346:44  */
  assign n233_o = en_cnt_x & n232_o;
  /* ym2149_audio.vhd:346:23  */
  assign n234_o = n233_o ? 12'b000000000000 : n237_o;
  /* ym2149_audio.vhd:348:18  */
  assign n236_o = ch_a_cnt_r + 12'b000000000001;
  /* ym2149_audio.vhd:346:77  */
  assign n237_o = en_cnt_r ? n236_o : ch_a_cnt_r;
  /* ym2149_audio.vhd:351:43  */
  assign n240_o = $unsigned(ch_a_period_s) < $unsigned(12'b000000000110);
  /* ym2149_audio.vhd:351:24  */
  assign n241_o = n240_o ? 1'b1 : 1'b0;
  /* ym2149_audio.vhd:355:11  */
  assign n244_o = flatline_a_s ? 1'b1 : n248_o;
  /* ym2149_audio.vhd:357:7  */
  assign n245_o = ~tone_a_r;
  /* ym2149_audio.vhd:357:56  */
  assign n246_o = $unsigned(ch_a_cnt_r) >= $unsigned(ch_a_period_s);
  /* ym2149_audio.vhd:357:41  */
  assign n247_o = en_cnt_x & n246_o;
  /* ym2149_audio.vhd:355:35  */
  assign n248_o = n247_o ? n245_o : tone_a_r;
  /* ym2149_audio.vhd:362:59  */
  assign n250_o = $unsigned(ch_b_cnt_r) >= $unsigned(ch_b_period_s);
  /* ym2149_audio.vhd:362:44  */
  assign n251_o = en_cnt_x & n250_o;
  /* ym2149_audio.vhd:362:23  */
  assign n252_o = n251_o ? 12'b000000000000 : n255_o;
  /* ym2149_audio.vhd:363:18  */
  assign n254_o = ch_b_cnt_r + 12'b000000000001;
  /* ym2149_audio.vhd:362:77  */
  assign n255_o = en_cnt_r ? n254_o : ch_b_cnt_r;
  /* ym2149_audio.vhd:366:43  */
  assign n258_o = $unsigned(ch_b_period_s) < $unsigned(12'b000000000110);
  /* ym2149_audio.vhd:366:24  */
  assign n259_o = n258_o ? 1'b1 : 1'b0;
  /* ym2149_audio.vhd:369:11  */
  assign n262_o = flatline_b_s ? 1'b1 : n266_o;
  /* ym2149_audio.vhd:370:7  */
  assign n263_o = ~tone_b_r;
  /* ym2149_audio.vhd:370:56  */
  assign n264_o = $unsigned(ch_b_cnt_r) >= $unsigned(ch_b_period_s);
  /* ym2149_audio.vhd:370:41  */
  assign n265_o = en_cnt_x & n264_o;
  /* ym2149_audio.vhd:369:35  */
  assign n266_o = n265_o ? n263_o : tone_b_r;
  /* ym2149_audio.vhd:375:59  */
  assign n268_o = $unsigned(ch_c_cnt_r) >= $unsigned(ch_c_period_s);
  /* ym2149_audio.vhd:375:44  */
  assign n269_o = en_cnt_x & n268_o;
  /* ym2149_audio.vhd:375:23  */
  assign n270_o = n269_o ? 12'b000000000000 : n273_o;
  /* ym2149_audio.vhd:376:18  */
  assign n272_o = ch_c_cnt_r + 12'b000000000001;
  /* ym2149_audio.vhd:375:77  */
  assign n273_o = en_cnt_r ? n272_o : ch_c_cnt_r;
  /* ym2149_audio.vhd:379:43  */
  assign n276_o = $unsigned(ch_c_period_s) < $unsigned(12'b000000000110);
  /* ym2149_audio.vhd:379:24  */
  assign n277_o = n276_o ? 1'b1 : 1'b0;
  /* ym2149_audio.vhd:382:11  */
  assign n280_o = flatline_c_s ? 1'b1 : n284_o;
  /* ym2149_audio.vhd:383:7  */
  assign n281_o = ~tone_c_r;
  /* ym2149_audio.vhd:383:56  */
  assign n282_o = $unsigned(ch_c_cnt_r) >= $unsigned(ch_c_period_s);
  /* ym2149_audio.vhd:383:41  */
  assign n283_o = en_cnt_x & n282_o;
  /* ym2149_audio.vhd:382:35  */
  assign n284_o = n283_o ? n281_o : tone_c_r;
  /* ym2149_audio.vhd:392:20  */
  assign n288_o = ~reset_n_i;
  /* ym2149_audio.vhd:402:7  */
  assign n289_o = en_int_clk_psg_s ? ch_a_cnt_x : ch_a_cnt_r;
  /* ym2149_audio.vhd:402:7  */
  assign n290_o = en_int_clk_psg_s ? tone_a_x : tone_a_r;
  /* ym2149_audio.vhd:402:7  */
  assign n291_o = en_int_clk_psg_s ? ch_b_cnt_x : ch_b_cnt_r;
  /* ym2149_audio.vhd:402:7  */
  assign n292_o = en_int_clk_psg_s ? tone_b_x : tone_b_r;
  /* ym2149_audio.vhd:402:7  */
  assign n293_o = en_int_clk_psg_s ? ch_c_cnt_x : ch_c_cnt_r;
  /* ym2149_audio.vhd:402:7  */
  assign n294_o = en_int_clk_psg_s ? tone_c_x : tone_c_r;
  /* ym2149_audio.vhd:392:7  */
  assign n296_o = n288_o ? 12'b000000000000 : n289_o;
  /* ym2149_audio.vhd:392:7  */
  assign n298_o = n288_o ? 1'b1 : n290_o;
  /* ym2149_audio.vhd:392:7  */
  assign n300_o = n288_o ? 12'b000000000000 : n291_o;
  /* ym2149_audio.vhd:392:7  */
  assign n302_o = n288_o ? 1'b1 : n292_o;
  /* ym2149_audio.vhd:392:7  */
  assign n304_o = n288_o ? 12'b000000000000 : n293_o;
  /* ym2149_audio.vhd:392:7  */
  assign n306_o = n288_o ? 1'b1 : n294_o;
  /* ym2149_audio.vhd:420:60  */
  assign n315_o = $unsigned(noise_cnt_r) >= $unsigned(noise_period_s);
  /* ym2149_audio.vhd:420:44  */
  assign n316_o = en_cnt_x & n315_o;
  /* ym2149_audio.vhd:420:23  */
  assign n317_o = n316_o ? 5'b00000 : n320_o;
  /* ym2149_audio.vhd:422:19  */
  assign n319_o = noise_cnt_r + 5'b00001;
  /* ym2149_audio.vhd:420:79  */
  assign n320_o = en_cnt_r ? n319_o : noise_cnt_r;
  /* ym2149_audio.vhd:425:44  */
  assign n323_o = $unsigned(noise_period_s) < $unsigned(5'b00101);
  /* ym2149_audio.vhd:425:24  */
  assign n324_o = n323_o ? 1'b1 : 1'b0;
  /* ym2149_audio.vhd:429:11  */
  assign n327_o = flatline_n_s ? 1'b1 : n331_o;
  /* ym2149_audio.vhd:431:7  */
  assign n328_o = ~noise_ff_r;
  /* ym2149_audio.vhd:431:59  */
  assign n329_o = $unsigned(noise_cnt_r) >= $unsigned(noise_period_s);
  /* ym2149_audio.vhd:431:43  */
  assign n330_o = en_cnt_x & n329_o;
  /* ym2149_audio.vhd:429:35  */
  assign n331_o = n330_o ? n328_o : noise_ff_r;
  /* ym2149_audio.vhd:438:32  */
  assign n332_o = noise_lfsr_r[3];
  /* ym2149_audio.vhd:438:52  */
  assign n333_o = noise_lfsr_r[0];
  /* ym2149_audio.vhd:438:36  */
  assign n334_o = n332_o ^ n333_o;
  /* ym2149_audio.vhd:439:45  */
  assign n335_o = noise_lfsr_r[16:1];
  /* ym2149_audio.vhd:439:31  */
  assign n336_o = {noise_fb_s, n335_o};
  /* ym2149_audio.vhd:440:27  */
  assign n337_o = noise_lfsr_r[0];
  /* ym2149_audio.vhd:448:20  */
  assign n341_o = ~reset_n_i;
  /* ym2149_audio.vhd:457:24  */
  assign n342_o = ~noise_ff_r;
  /* ym2149_audio.vhd:457:30  */
  assign n343_o = n342_o & noise_ff_x;
  /* ym2149_audio.vhd:453:7  */
  assign n344_o = n347_o ? noise_lfsr_x : noise_lfsr_r;
  /* ym2149_audio.vhd:453:7  */
  assign n345_o = en_int_clk_psg_s ? noise_cnt_x : noise_cnt_r;
  /* ym2149_audio.vhd:453:7  */
  assign n346_o = en_int_clk_psg_s ? noise_ff_x : noise_ff_r;
  /* ym2149_audio.vhd:453:7  */
  assign n347_o = en_int_clk_psg_s & n343_o;
  /* ym2149_audio.vhd:448:7  */
  assign n349_o = n341_o ? 5'b00000 : n345_o;
  /* ym2149_audio.vhd:448:7  */
  assign n351_o = n341_o ? 1'b1 : n346_o;
  /* ym2149_audio.vhd:448:7  */
  assign n353_o = n341_o ? 17'b10000000000000000 : n344_o;
  /* ym2149_audio.vhd:467:33  */
  assign n358_o = ch_a_tone_en_n_s | tone_a_r;
  /* ym2149_audio.vhd:467:69  */
  assign n359_o = ch_a_noise_en_n_s | noise_s;
  /* ym2149_audio.vhd:467:46  */
  assign n360_o = n358_o & n359_o;
  /* ym2149_audio.vhd:468:33  */
  assign n361_o = ch_b_tone_en_n_s | tone_b_r;
  /* ym2149_audio.vhd:468:69  */
  assign n362_o = ch_b_noise_en_n_s | noise_s;
  /* ym2149_audio.vhd:468:46  */
  assign n363_o = n361_o & n362_o;
  /* ym2149_audio.vhd:469:33  */
  assign n364_o = ch_c_tone_en_n_s | tone_c_r;
  /* ym2149_audio.vhd:469:69  */
  assign n365_o = ch_c_noise_en_n_s | noise_s;
  /* ym2149_audio.vhd:469:46  */
  assign n366_o = n364_o & n365_o;
  /* ym2149_audio.vhd:476:58  */
  assign n368_o = $unsigned(env_cnt_r) >= $unsigned(env_period_s);
  /* ym2149_audio.vhd:476:44  */
  assign n369_o = en_cnt_x & n368_o;
  /* ym2149_audio.vhd:476:23  */
  assign n370_o = n369_o ? 16'b0000000000000000 : n373_o;
  /* ym2149_audio.vhd:478:17  */
  assign n372_o = env_cnt_r + 16'b0000000000000001;
  /* ym2149_audio.vhd:476:75  */
  assign n373_o = en_cnt_r ? n372_o : env_cnt_r;
  /* ym2149_audio.vhd:483:7  */
  assign n374_o = ~env_ff_r;
  /* ym2149_audio.vhd:483:55  */
  assign n375_o = $unsigned(env_cnt_r) >= $unsigned(env_period_s);
  /* ym2149_audio.vhd:483:41  */
  assign n376_o = en_cnt_x & n375_o;
  /* ym2149_audio.vhd:483:20  */
  assign n377_o = n376_o ? n374_o : env_ff_r;
  /* ym2149_audio.vhd:488:18  */
  assign n378_o = ~reset_n_i;
  /* ym2149_audio.vhd:488:33  */
  assign n379_o = n378_o | env_shape_wr_r;
  /* ym2149_audio.vhd:492:35  */
  assign n381_o = hold_ff_x ? 5'b11111 : n383_o;
  /* ym2149_audio.vhd:492:73  */
  assign n383_o = shape_cnt_r + 5'b00001;
  /* ym2149_audio.vhd:514:23  */
  assign n387_o = ~hold_ff_r;
  /* ym2149_audio.vhd:514:42  */
  assign n388_o = env_ff_r != env_ff_x;
  /* ym2149_audio.vhd:514:29  */
  assign n389_o = n387_o & n388_o;
  /* ym2149_audio.vhd:507:7  */
  assign n390_o = n393_o ? shape_cnt_x : shape_cnt_r;
  /* ym2149_audio.vhd:507:7  */
  assign n391_o = en_int_clk_psg_s ? env_cnt_x : env_cnt_r;
  /* ym2149_audio.vhd:507:7  */
  assign n392_o = en_int_clk_psg_s ? env_ff_x : env_ff_r;
  /* ym2149_audio.vhd:507:7  */
  assign n393_o = en_int_clk_psg_s & n389_o;
  /* ym2149_audio.vhd:502:7  */
  assign n395_o = env_rst_s ? 16'b0000000000000000 : n391_o;
  /* ym2149_audio.vhd:502:7  */
  assign n397_o = env_rst_s ? 1'b1 : n392_o;
  /* ym2149_audio.vhd:502:7  */
  assign n399_o = env_rst_s ? 5'b00000 : n390_o;
  /* ym2149_audio.vhd:527:53  */
  assign n405_o = shape_cnt_r == 5'b11111;
  /* ym2149_audio.vhd:527:36  */
  assign n406_o = n405_o ? env_continue_s : continue_ff_r;
  /* ym2149_audio.vhd:532:17  */
  assign n407_o = ~attack_ff_r;
  /* ym2149_audio.vhd:532:33  */
  assign n408_o = env_attack_s ? n407_o : attack_ff_r;
  /* ym2149_audio.vhd:536:7  */
  assign n409_o = ~attack_ff_r;
  /* ym2149_audio.vhd:536:40  */
  assign n411_o = shape_cnt_r == 5'b11111;
  /* ym2149_audio.vhd:536:45  */
  assign n412_o = n411_o & env_alternate_s;
  /* ym2149_audio.vhd:536:23  */
  assign n413_o = n412_o ? n409_o : attack_ff_r;
  /* ym2149_audio.vhd:542:45  */
  assign n415_o = shape_cnt_r == 5'b11111;
  /* ym2149_audio.vhd:542:28  */
  assign n416_o = n415_o ? env_hold_s : hold_ff_r;
  /* ym2149_audio.vhd:545:42  */
  assign n418_o = ~continue_ff_r;
  /* ym2149_audio.vhd:545:23  */
  assign n419_o = n418_o ? 5'b00000 : n422_o;
  /* ym2149_audio.vhd:546:7  */
  assign n420_o = ~shape_cnt_r;
  /* ym2149_audio.vhd:546:42  */
  assign n421_o = ~env_sel_s;
  /* ym2149_audio.vhd:545:48  */
  assign n422_o = n421_o ? n420_o : shape_cnt_r;
  /* ym2149_audio.vhd:549:33  */
  assign n425_o = 5'b11111 - env_out_s;
  /* ym2149_audio.vhd:567:23  */
  assign n431_o = ~hold_ff_r;
  /* ym2149_audio.vhd:567:42  */
  assign n432_o = env_ff_r != env_ff_x;
  /* ym2149_audio.vhd:567:29  */
  assign n433_o = n431_o & n432_o;
  /* ym2149_audio.vhd:562:7  */
  assign n434_o = n437_o ? continue_ff_x : continue_ff_r;
  /* ym2149_audio.vhd:562:7  */
  assign n435_o = n438_o ? attack_ff_x : attack_ff_r;
  /* ym2149_audio.vhd:562:7  */
  assign n436_o = n439_o ? hold_ff_x : hold_ff_r;
  /* ym2149_audio.vhd:562:7  */
  assign n437_o = en_int_clk_psg_s & n433_o;
  /* ym2149_audio.vhd:562:7  */
  assign n438_o = en_int_clk_psg_s & n433_o;
  /* ym2149_audio.vhd:562:7  */
  assign n439_o = en_int_clk_psg_s & n433_o;
  /* ym2149_audio.vhd:557:7  */
  assign n441_o = env_rst_s ? 1'b1 : n434_o;
  /* ym2149_audio.vhd:557:7  */
  assign n443_o = env_rst_s ? 1'b0 : n435_o;
  /* ym2149_audio.vhd:557:7  */
  assign n445_o = env_rst_s ? 1'b0 : n436_o;
  /* ym2149_audio.vhd:581:37  */
  assign n451_o = ~mix_a_s;
  /* ym2149_audio.vhd:581:24  */
  assign n452_o = n451_o ? 12'b000000000000 : n454_o;
  /* ym2149_audio.vhd:582:37  */
  assign n453_o = ~ch_a_mode_s;
  /* ym2149_audio.vhd:581:43  */
  assign n454_o = n453_o ? ch_a_level_r : dac_env_level_s;
  /* ym2149_audio.vhd:586:37  */
  assign n456_o = ~mix_b_s;
  /* ym2149_audio.vhd:586:24  */
  assign n457_o = n456_o ? 12'b000000000000 : n459_o;
  /* ym2149_audio.vhd:587:37  */
  assign n458_o = ~ch_b_mode_s;
  /* ym2149_audio.vhd:586:43  */
  assign n459_o = n458_o ? ch_b_level_r : dac_env_level_s;
  /* ym2149_audio.vhd:591:37  */
  assign n461_o = ~mix_c_s;
  /* ym2149_audio.vhd:591:24  */
  assign n462_o = n461_o ? 12'b000000000000 : n464_o;
  /* ym2149_audio.vhd:592:37  */
  assign n463_o = ~ch_c_mode_s;
  /* ym2149_audio.vhd:591:43  */
  assign n464_o = n463_o ? ch_c_level_r : dac_env_level_s;
  /* ym2149_audio.vhd:612:28  */
  assign n469_o = {2'b00, dac_a_r};
  /* ym2149_audio.vhd:612:47  */
  assign n471_o = {2'b00, dac_b_r};
  /* ym2149_audio.vhd:612:39  */
  assign n472_o = n469_o + n471_o;
  /* ym2149_audio.vhd:612:66  */
  assign n474_o = {2'b00, dac_c_r};
  /* ym2149_audio.vhd:612:58  */
  assign n475_o = n472_o + n474_o;
  /* ym2149_audio.vhd:619:51  */
  assign n485_o = ~ch_a_mode_s;
  /* ym2149_audio.vhd:619:34  */
  assign n486_o = n485_o ? ch_a_level_r : dac_env_level_s;
  /* ym2149_audio.vhd:620:51  */
  assign n487_o = ~ch_b_mode_s;
  /* ym2149_audio.vhd:620:34  */
  assign n488_o = n487_o ? ch_b_level_r : dac_env_level_s;
  /* ym2149_audio.vhd:621:51  */
  assign n489_o = ~ch_c_mode_s;
  /* ym2149_audio.vhd:621:34  */
  assign n490_o = n489_o ? ch_c_level_r : dac_env_level_s;
  /* ym2149_audio.vhd:625:21  */
  assign n492_o = level_a_env_s - 12'b100000000000;
  /* ym2149_audio.vhd:627:29  */
  assign n493_o = ch_a_tone_en_n_s & ch_a_noise_en_n_s;
  /* ym2149_audio.vhd:627:52  */
  assign n494_o = n493_o | flatline_a_s;
  /* ym2149_audio.vhd:631:12  */
  assign n495_o = ~ch_a_noise_en_n_s;
  /* ym2149_audio.vhd:631:35  */
  assign n496_o = n495_o & flatline_n_s;
  /* ym2149_audio.vhd:629:23  */
  assign n497_o = n494_o | n496_o;
  /* ym2149_audio.vhd:625:30  */
  assign n498_o = n497_o ? n492_o : n506_o;
  /* ym2149_audio.vhd:634:32  */
  assign n499_o = level_a_env_s[11:1];
  /* ym2149_audio.vhd:634:15  */
  assign n500_o = ~n499_o;
  /* ym2149_audio.vhd:634:12  */
  assign n502_o = {1'b1, n500_o};
  /* ym2149_audio.vhd:634:48  */
  assign n504_o = n502_o + 12'b000000000001;
  /* ym2149_audio.vhd:634:65  */
  assign n505_o = ~mix_a_s;
  /* ym2149_audio.vhd:631:60  */
  assign n506_o = n505_o ? n504_o : n509_o;
  /* ym2149_audio.vhd:635:32  */
  assign n507_o = level_a_env_s[11:1];
  /* ym2149_audio.vhd:635:12  */
  assign n509_o = {1'b0, n507_o};
  /* ym2149_audio.vhd:638:21  */
  assign n511_o = level_b_env_s - 12'b100000000000;
  /* ym2149_audio.vhd:639:29  */
  assign n512_o = ch_b_tone_en_n_s & ch_b_noise_en_n_s;
  /* ym2149_audio.vhd:639:52  */
  assign n513_o = n512_o | flatline_b_s;
  /* ym2149_audio.vhd:641:12  */
  assign n514_o = ~ch_b_noise_en_n_s;
  /* ym2149_audio.vhd:641:35  */
  assign n515_o = n514_o & flatline_n_s;
  /* ym2149_audio.vhd:640:23  */
  assign n516_o = n513_o | n515_o;
  /* ym2149_audio.vhd:638:30  */
  assign n517_o = n516_o ? n511_o : n525_o;
  /* ym2149_audio.vhd:642:32  */
  assign n518_o = level_b_env_s[11:1];
  /* ym2149_audio.vhd:642:15  */
  assign n519_o = ~n518_o;
  /* ym2149_audio.vhd:642:12  */
  assign n521_o = {1'b1, n519_o};
  /* ym2149_audio.vhd:642:48  */
  assign n523_o = n521_o + 12'b000000000001;
  /* ym2149_audio.vhd:642:65  */
  assign n524_o = ~mix_b_s;
  /* ym2149_audio.vhd:641:60  */
  assign n525_o = n524_o ? n523_o : n528_o;
  /* ym2149_audio.vhd:643:32  */
  assign n526_o = level_b_env_s[11:1];
  /* ym2149_audio.vhd:643:12  */
  assign n528_o = {1'b0, n526_o};
  /* ym2149_audio.vhd:646:21  */
  assign n530_o = level_c_env_s - 12'b100000000000;
  /* ym2149_audio.vhd:647:29  */
  assign n531_o = ch_c_tone_en_n_s & ch_c_noise_en_n_s;
  /* ym2149_audio.vhd:647:52  */
  assign n532_o = n531_o | flatline_c_s;
  /* ym2149_audio.vhd:649:12  */
  assign n533_o = ~ch_c_noise_en_n_s;
  /* ym2149_audio.vhd:649:35  */
  assign n534_o = n533_o & flatline_n_s;
  /* ym2149_audio.vhd:648:23  */
  assign n535_o = n532_o | n534_o;
  /* ym2149_audio.vhd:646:30  */
  assign n536_o = n535_o ? n530_o : n544_o;
  /* ym2149_audio.vhd:650:32  */
  assign n537_o = level_c_env_s[11:1];
  /* ym2149_audio.vhd:650:15  */
  assign n538_o = ~n537_o;
  /* ym2149_audio.vhd:650:12  */
  assign n540_o = {1'b1, n538_o};
  /* ym2149_audio.vhd:650:48  */
  assign n542_o = n540_o + 12'b000000000001;
  /* ym2149_audio.vhd:650:65  */
  assign n543_o = ~mix_c_s;
  /* ym2149_audio.vhd:649:60  */
  assign n544_o = n543_o ? n542_o : n547_o;
  /* ym2149_audio.vhd:651:32  */
  assign n545_o = level_c_env_s[11:1];
  /* ym2149_audio.vhd:651:12  */
  assign n547_o = {1'b0, n545_o};
  /* ym2149_audio.vhd:669:19  */
  assign n551_o = sign_a_r[11];
  /* ym2149_audio.vhd:669:34  */
  assign n552_o = sign_a_r[11];
  /* ym2149_audio.vhd:669:24  */
  assign n553_o = {n551_o, n552_o};
  /* ym2149_audio.vhd:669:39  */
  assign n554_o = {n553_o, sign_a_r};
  /* ym2149_audio.vhd:670:19  */
  assign n555_o = sign_b_r[11];
  /* ym2149_audio.vhd:670:34  */
  assign n556_o = sign_b_r[11];
  /* ym2149_audio.vhd:670:24  */
  assign n557_o = {n555_o, n556_o};
  /* ym2149_audio.vhd:670:39  */
  assign n558_o = {n557_o, sign_b_r};
  /* ym2149_audio.vhd:669:51  */
  assign n559_o = n554_o + n558_o;
  /* ym2149_audio.vhd:671:19  */
  assign n560_o = sign_c_r[11];
  /* ym2149_audio.vhd:671:34  */
  assign n561_o = sign_c_r[11];
  /* ym2149_audio.vhd:671:24  */
  assign n562_o = {n560_o, n561_o};
  /* ym2149_audio.vhd:671:39  */
  assign n563_o = {n562_o, sign_c_r};
  /* ym2149_audio.vhd:670:51  */
  assign n564_o = n559_o + n563_o;
  /* ym2149_audio.vhd:233:4  */
  always @(posedge clk_i)
    n574_q <= n154_o;
  initial
    n574_q = 4'b0000;
  /* ym2149_audio.vhd:174:28  */
  always @(posedge clk_i)
    n575_q <= data_i;
  initial
    n575_q = 8'b00000000;
  /* ym2149_audio.vhd:233:4  */
  always @(posedge clk_i)
    n576_q <= n156_o;
  initial
    n576_q = 8'b00000000;
  /* ym2149_audio.vhd:174:28  */
  always @(posedge clk_i)
    n577_q <= n52_o;
  initial
    n577_q = 2'b00;
  /* ym2149_audio.vhd:174:28  */
  always @(posedge clk_i)
    n578_q <= sel_n_i;
  initial
    n578_q = 1'b1;
  /* ym2149_audio.vhd:313:4  */
  assign n579_o = en_clk_psg_i ? sel_ff_x : sel_ff_r;
  /* ym2149_audio.vhd:313:4  */
  always @(posedge clk_i)
    n580_q <= n579_o;
  initial
    n580_q = 1'b1;
  /* ym2149_audio.vhd:233:4  */
  always @(posedge clk_i)
    n581_q <= n158_o;
  initial
    n581_q = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
  /* ym2149_audio.vhd:233:4  */
  always @(posedge clk_i)
    n582_q <= n160_o;
  initial
    n582_q = 12'b000000000000;
  /* ym2149_audio.vhd:233:4  */
  always @(posedge clk_i)
    n583_q <= n162_o;
  initial
    n583_q = 12'b000000000000;
  /* ym2149_audio.vhd:233:4  */
  always @(posedge clk_i)
    n584_q <= n164_o;
  initial
    n584_q = 12'b000000000000;
  /* ym2149_audio.vhd:331:4  */
  always @(posedge clk_i)
    n585_q <= n225_o;
  initial
    n585_q = 3'b000;
  /* ym2149_audio.vhd:331:4  */
  always @(posedge clk_i)
    n586_q <= n227_o;
  initial
    n586_q = 1'b0;
  /* ym2149_audio.vhd:390:4  */
  always @(posedge clk_i)
    n587_q <= n296_o;
  initial
    n587_q = 12'b000000000000;
  /* ym2149_audio.vhd:390:4  */
  always @(posedge clk_i)
    n588_q <= n298_o;
  initial
    n588_q = 1'b1;
  /* ym2149_audio.vhd:390:4  */
  always @(posedge clk_i)
    n589_q <= n300_o;
  initial
    n589_q = 12'b000000000000;
  /* ym2149_audio.vhd:390:4  */
  always @(posedge clk_i)
    n590_q <= n302_o;
  initial
    n590_q = 1'b1;
  /* ym2149_audio.vhd:390:4  */
  always @(posedge clk_i)
    n591_q <= n304_o;
  initial
    n591_q = 12'b000000000000;
  /* ym2149_audio.vhd:390:4  */
  always @(posedge clk_i)
    n592_q <= n306_o;
  initial
    n592_q = 1'b1;
  /* ym2149_audio.vhd:446:4  */
  always @(posedge clk_i)
    n593_q <= n349_o;
  initial
    n593_q = 5'b00000;
  /* ym2149_audio.vhd:446:4  */
  always @(posedge clk_i)
    n594_q <= n351_o;
  initial
    n594_q = 1'b1;
  /* ym2149_audio.vhd:446:4  */
  always @(posedge clk_i)
    n595_q <= n353_o;
  initial
    n595_q = 17'b10000000000000000;
  /* ym2149_audio.vhd:233:4  */
  always @(posedge clk_i)
    n596_q <= n166_o;
  initial
    n596_q = 1'b0;
  /* ym2149_audio.vhd:499:4  */
  always @(posedge clk_i)
    n597_q <= n395_o;
  initial
    n597_q = 16'b0000000000000000;
  /* ym2149_audio.vhd:499:4  */
  always @(posedge clk_i)
    n598_q <= n397_o;
  initial
    n598_q = 1'b1;
  /* ym2149_audio.vhd:499:4  */
  always @(posedge clk_i)
    n599_q <= n399_o;
  initial
    n599_q = 5'b00000;
  /* ym2149_audio.vhd:554:4  */
  always @(posedge clk_i)
    n600_q <= n441_o;
  initial
    n600_q = 1'b1;
  /* ym2149_audio.vhd:554:4  */
  always @(posedge clk_i)
    n601_q <= n443_o;
  initial
    n601_q = 1'b0;
  /* ym2149_audio.vhd:554:4  */
  always @(posedge clk_i)
    n602_q <= n445_o;
  initial
    n602_q = 1'b0;
  /* ym2149_audio.vhd:604:4  */
  assign n603_o = en_clk_psg_i ? level_a_s : dac_a_r;
  /* ym2149_audio.vhd:604:4  */
  always @(posedge clk_i)
    n604_q <= n603_o;
  initial
    n604_q = 12'b000000000000;
  /* ym2149_audio.vhd:604:4  */
  assign n605_o = en_clk_psg_i ? level_b_s : dac_b_r;
  /* ym2149_audio.vhd:604:4  */
  always @(posedge clk_i)
    n606_q <= n605_o;
  initial
    n606_q = 12'b000000000000;
  /* ym2149_audio.vhd:604:4  */
  assign n607_o = en_clk_psg_i ? level_c_s : dac_c_r;
  /* ym2149_audio.vhd:604:4  */
  always @(posedge clk_i)
    n608_q <= n607_o;
  initial
    n608_q = 12'b000000000000;
  /* ym2149_audio.vhd:604:4  */
  assign n609_o = en_clk_psg_i ? n475_o : sum_audio_r;
  /* ym2149_audio.vhd:604:4  */
  always @(posedge clk_i)
    n610_q <= n609_o;
  initial
    n610_q = 14'b00000000000000;
  /* ym2149_audio.vhd:660:4  */
  assign n611_o = en_clk_psg_i ? sign_a_x : sign_a_r;
  /* ym2149_audio.vhd:660:4  */
  always @(posedge clk_i)
    n612_q <= n611_o;
  initial
    n612_q = 12'b000000000000;
  /* ym2149_audio.vhd:660:4  */
  assign n613_o = en_clk_psg_i ? sign_b_x : sign_b_r;
  /* ym2149_audio.vhd:660:4  */
  always @(posedge clk_i)
    n614_q <= n613_o;
  initial
    n614_q = 12'b000000000000;
  /* ym2149_audio.vhd:660:4  */
  assign n615_o = en_clk_psg_i ? sign_c_x : sign_c_r;
  /* ym2149_audio.vhd:660:4  */
  always @(posedge clk_i)
    n616_q <= n615_o;
  initial
    n616_q = 12'b000000000000;
  /* ym2149_audio.vhd:660:4  */
  assign n617_o = en_clk_psg_i ? n564_o : pcm14s_r;
  /* ym2149_audio.vhd:660:4  */
  always @(posedge clk_i)
    n618_q <= n617_o;
  initial
    n618_q = 14'b00000000000000;
  /* ym2149_audio.vhd:23:6  */
  reg [11:0] n619[31:0] ; // memory
  initial begin
    n619[31] = 12'b000000000000;
    n619[30] = 12'b000000010111;
    n619[29] = 12'b000000011011;
    n619[28] = 12'b000000100001;
    n619[27] = 12'b000000100111;
    n619[26] = 12'b000000101110;
    n619[25] = 12'b000000110111;
    n619[24] = 12'b000001000001;
    n619[23] = 12'b000001001101;
    n619[22] = 12'b000001011100;
    n619[21] = 12'b000001101101;
    n619[20] = 12'b000010000001;
    n619[19] = 12'b000010011010;
    n619[18] = 12'b000010110111;
    n619[17] = 12'b000011011001;
    n619[16] = 12'b000100000010;
    n619[15] = 12'b000100110011;
    n619[14] = 12'b000101101101;
    n619[13] = 12'b000110110010;
    n619[12] = 12'b001000000100;
    n619[11] = 12'b001001100101;
    n619[10] = 12'b001011011000;
    n619[9] = 12'b001101100001;
    n619[8] = 12'b010000000101;
    n619[7] = 12'b010011000111;
    n619[6] = 12'b010110101101;
    n619[5] = 12'b011010111111;
    n619[4] = 12'b100000000100;
    n619[3] = 12'b100110000111;
    n619[2] = 12'b101101010011;
    n619[1] = 12'b110101110110;
    n619[0] = 12'b111111111111;
    end
  assign n620_data = n619[n425_o];
  assign n621_data = n619[n95_o];
  /* ym2149_audio.vhd:549:33  */
  /* ym2149_audio.vhd:221:33  */
  /* ym2149_audio.vhd:221:32  */
  assign n622_o = reg_file_ar[7:0];
  /* ym2149_audio.vhd:549:32  */
  assign n623_o = reg_file_ar[15:8];
  /* ym2149_audio.vhd:22:6  */
  assign n624_o = reg_file_ar[23:16];
  /* ym2149_audio.vhd:21:6  */
  assign n625_o = reg_file_ar[31:24];
  /* ym2149_audio.vhd:20:6  */
  assign n626_o = reg_file_ar[39:32];
  /* ym2149_audio.vhd:19:6  */
  assign n627_o = reg_file_ar[47:40];
  /* ym2149_audio.vhd:18:6  */
  assign n628_o = reg_file_ar[55:48];
  assign n629_o = reg_file_ar[63:56];
  /* ym2149_audio.vhd:660:4  */
  assign n630_o = reg_file_ar[71:64];
  /* ym2149_audio.vhd:660:4  */
  assign n631_o = reg_file_ar[79:72];
  /* ym2149_audio.vhd:660:4  */
  assign n632_o = reg_file_ar[87:80];
  /* ym2149_audio.vhd:660:4  */
  assign n633_o = reg_file_ar[95:88];
  /* ym2149_audio.vhd:657:4  */
  assign n634_o = reg_file_ar[103:96];
  assign n635_o = reg_file_ar[111:104];
  /* ym2149_audio.vhd:604:4  */
  assign n636_o = reg_file_ar[119:112];
  /* ym2149_audio.vhd:604:4  */
  assign n637_o = reg_file_ar[127:120];
  /* ym2149_audio.vhd:266:36  */
  assign n638_o = n129_o[1:0];
  /* ym2149_audio.vhd:266:36  */
  always @*
    case (n638_o)
      2'b00: n639_o = n622_o;
      2'b01: n639_o = n623_o;
      2'b10: n639_o = n624_o;
      2'b11: n639_o = n625_o;
    endcase
  /* ym2149_audio.vhd:266:36  */
  assign n640_o = n129_o[1:0];
  /* ym2149_audio.vhd:266:36  */
  always @*
    case (n640_o)
      2'b00: n641_o = n626_o;
      2'b01: n641_o = n627_o;
      2'b10: n641_o = n628_o;
      2'b11: n641_o = n629_o;
    endcase
  /* ym2149_audio.vhd:266:36  */
  assign n642_o = n129_o[1:0];
  /* ym2149_audio.vhd:266:36  */
  always @*
    case (n642_o)
      2'b00: n643_o = n630_o;
      2'b01: n643_o = n631_o;
      2'b10: n643_o = n632_o;
      2'b11: n643_o = n633_o;
    endcase
  /* ym2149_audio.vhd:266:36  */
  assign n644_o = n129_o[1:0];
  /* ym2149_audio.vhd:266:36  */
  always @*
    case (n644_o)
      2'b00: n645_o = n634_o;
      2'b01: n645_o = n635_o;
      2'b10: n645_o = n636_o;
      2'b11: n645_o = n637_o;
    endcase
  /* ym2149_audio.vhd:266:36  */
  assign n646_o = n129_o[3:2];
  /* ym2149_audio.vhd:266:36  */
  always @*
    case (n646_o)
      2'b00: n647_o = n639_o;
      2'b01: n647_o = n641_o;
      2'b10: n647_o = n643_o;
      2'b11: n647_o = n645_o;
    endcase
  /* ym2149_audio.vhd:268:13  */
  assign n648_o = n134_o[3];
  /* ym2149_audio.vhd:268:13  */
  assign n649_o = ~n648_o;
  /* ym2149_audio.vhd:268:13  */
  assign n650_o = n134_o[2];
  /* ym2149_audio.vhd:268:13  */
  assign n651_o = ~n650_o;
  /* ym2149_audio.vhd:268:13  */
  assign n652_o = n649_o & n651_o;
  /* ym2149_audio.vhd:268:13  */
  assign n653_o = n649_o & n650_o;
  /* ym2149_audio.vhd:268:13  */
  assign n654_o = n648_o & n651_o;
  /* ym2149_audio.vhd:268:13  */
  assign n655_o = n648_o & n650_o;
  /* ym2149_audio.vhd:268:13  */
  assign n656_o = n134_o[1];
  /* ym2149_audio.vhd:268:13  */
  assign n657_o = ~n656_o;
  /* ym2149_audio.vhd:268:13  */
  assign n658_o = n652_o & n657_o;
  /* ym2149_audio.vhd:268:13  */
  assign n659_o = n652_o & n656_o;
  /* ym2149_audio.vhd:268:13  */
  assign n660_o = n653_o & n657_o;
  /* ym2149_audio.vhd:268:13  */
  assign n661_o = n653_o & n656_o;
  /* ym2149_audio.vhd:268:13  */
  assign n662_o = n654_o & n657_o;
  /* ym2149_audio.vhd:268:13  */
  assign n663_o = n654_o & n656_o;
  /* ym2149_audio.vhd:268:13  */
  assign n664_o = n655_o & n657_o;
  /* ym2149_audio.vhd:268:13  */
  assign n665_o = n655_o & n656_o;
  /* ym2149_audio.vhd:268:13  */
  assign n666_o = n134_o[0];
  /* ym2149_audio.vhd:268:13  */
  assign n667_o = ~n666_o;
  /* ym2149_audio.vhd:268:13  */
  assign n668_o = n658_o & n667_o;
  /* ym2149_audio.vhd:268:13  */
  assign n669_o = n658_o & n666_o;
  /* ym2149_audio.vhd:268:13  */
  assign n670_o = n659_o & n667_o;
  /* ym2149_audio.vhd:268:13  */
  assign n671_o = n659_o & n666_o;
  /* ym2149_audio.vhd:268:13  */
  assign n672_o = n660_o & n667_o;
  /* ym2149_audio.vhd:268:13  */
  assign n673_o = n660_o & n666_o;
  /* ym2149_audio.vhd:268:13  */
  assign n674_o = n661_o & n667_o;
  /* ym2149_audio.vhd:268:13  */
  assign n675_o = n661_o & n666_o;
  /* ym2149_audio.vhd:268:13  */
  assign n676_o = n662_o & n667_o;
  /* ym2149_audio.vhd:268:13  */
  assign n677_o = n662_o & n666_o;
  /* ym2149_audio.vhd:268:13  */
  assign n678_o = n663_o & n667_o;
  /* ym2149_audio.vhd:268:13  */
  assign n679_o = n663_o & n666_o;
  /* ym2149_audio.vhd:268:13  */
  assign n680_o = n664_o & n667_o;
  /* ym2149_audio.vhd:268:13  */
  assign n681_o = n664_o & n666_o;
  /* ym2149_audio.vhd:268:13  */
  assign n682_o = n665_o & n667_o;
  /* ym2149_audio.vhd:268:13  */
  assign n683_o = n665_o & n666_o;
  assign n684_o = reg_file_ar[7:0];
  /* ym2149_audio.vhd:268:13  */
  assign n685_o = n668_o ? data_i_r : n684_o;
  assign n686_o = reg_file_ar[15:8];
  /* ym2149_audio.vhd:268:13  */
  assign n687_o = n669_o ? data_i_r : n686_o;
  assign n688_o = reg_file_ar[23:16];
  /* ym2149_audio.vhd:268:13  */
  assign n689_o = n670_o ? data_i_r : n688_o;
  assign n690_o = reg_file_ar[31:24];
  /* ym2149_audio.vhd:268:13  */
  assign n691_o = n671_o ? data_i_r : n690_o;
  assign n692_o = reg_file_ar[39:32];
  /* ym2149_audio.vhd:268:13  */
  assign n693_o = n672_o ? data_i_r : n692_o;
  assign n694_o = reg_file_ar[47:40];
  /* ym2149_audio.vhd:268:13  */
  assign n695_o = n673_o ? data_i_r : n694_o;
  assign n696_o = reg_file_ar[55:48];
  /* ym2149_audio.vhd:268:13  */
  assign n697_o = n674_o ? data_i_r : n696_o;
  assign n698_o = reg_file_ar[63:56];
  /* ym2149_audio.vhd:268:13  */
  assign n699_o = n675_o ? data_i_r : n698_o;
  assign n700_o = reg_file_ar[71:64];
  /* ym2149_audio.vhd:268:13  */
  assign n701_o = n676_o ? data_i_r : n700_o;
  assign n702_o = reg_file_ar[79:72];
  /* ym2149_audio.vhd:268:13  */
  assign n703_o = n677_o ? data_i_r : n702_o;
  assign n704_o = reg_file_ar[87:80];
  /* ym2149_audio.vhd:268:13  */
  assign n705_o = n678_o ? data_i_r : n704_o;
  assign n706_o = reg_file_ar[95:88];
  /* ym2149_audio.vhd:268:13  */
  assign n707_o = n679_o ? data_i_r : n706_o;
  assign n708_o = reg_file_ar[103:96];
  /* ym2149_audio.vhd:268:13  */
  assign n709_o = n680_o ? data_i_r : n708_o;
  assign n710_o = reg_file_ar[111:104];
  /* ym2149_audio.vhd:268:13  */
  assign n711_o = n681_o ? data_i_r : n710_o;
  assign n712_o = reg_file_ar[119:112];
  /* ym2149_audio.vhd:268:13  */
  assign n713_o = n682_o ? data_i_r : n712_o;
  assign n714_o = reg_file_ar[127:120];
  /* ym2149_audio.vhd:268:13  */
  assign n715_o = n683_o ? data_i_r : n714_o;
  assign n716_o = {n715_o, n713_o, n711_o, n709_o, n707_o, n705_o, n703_o, n701_o, n699_o, n697_o, n695_o, n693_o, n691_o, n689_o, n687_o, n685_o};
endmodule

