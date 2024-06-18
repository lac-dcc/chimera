// This program was cloned from: https://github.com/ahmedshahein/DSP-RTL-Lib
// License: BSD 2-Clause "Simplified" License

// -------------------------------------------------------------------
// Copyright (C) 2019 Ahmed Shahein
// -------------------------------------------------------------------
//
// -------------------------------------------------------------------
module sgen_nco #(
  parameter gp_rom_width        = 8,  // ROM address bit-width
  parameter gp_rom_depth        = 5,
  parameter gp_phase_accu_width = 16
) (
  input  wire                                  i_rst_an,
  input  wire                                  i_ena,
  input  wire                                  i_clk,
  input  wire        [gp_phase_accu_width-1:0] i_fcw,
  output wire signed [gp_rom_width:0]          o_sin,
  output wire signed [gp_rom_width:0]          o_cos
);
// -------------------------------------------------------------------
  // CONSTANT DECLARATION
  localparam c_rom_depth = 2**gp_rom_depth;
  // REGISTER DECLARATION
  reg         [gp_phase_accu_width-1:0] r_phase_accu;
  // WIRE DECLARATION
  wire        [gp_rom_width-1:0] nco_sin_rom [0:c_rom_depth-1];
  wire        [gp_rom_width-1:0] nco_cos_rom [0:c_rom_depth-1];
  wire        [gp_rom_width-1:0] nco_sin_max;
  wire        [gp_rom_width-1:0] nco_cos_max;
  wire        [2:0]              w_ctrl;
  wire        [gp_rom_depth-1:0] w_addr;
  wire                           w_sin_sign;
  wire                           w_sin_sinorcos;
  wire                           w_cos_sign;
  wire                           w_cos_sinorcos;
  wire                           w_sin_cos_mirror;
  wire                           w_sel_sin_max;
  wire                           w_sel_cos_max;
  reg  signed [gp_rom_width:0]   w_sin;
  reg  signed [gp_rom_width:0]   w_cos;
// -------------------------------------------------------------------
  `include "nco_sin_rom.v"
  `include "nco_cos_rom.v"
// -------------------------------------------------------------------
  always @(posedge i_clk or negedge i_rst_an)
    begin: p_phase_accu
      if (!i_rst_an)
        begin
	  r_phase_accu <= {gp_phase_accu_width{1'b0}};
	end
      else if (i_ena)
        begin
	  r_phase_accu <= r_phase_accu + i_fcw;
	end
    end
  
  assign w_ctrl = r_phase_accu[gp_phase_accu_width-1   -: 3];
  assign w_addr = (!w_sin_cos_mirror) ?  r_phase_accu[gp_phase_accu_width-1-3 -: gp_rom_depth] : 
                                        ~r_phase_accu[gp_phase_accu_width-1-3 -: gp_rom_depth];
  
  assign w_sin_sign       = w_ctrl[2];
  assign w_sin_sinorcos   = w_ctrl[1]  ^ w_ctrl[0];
  
  assign w_cos_sign       = w_ctrl[2]  ^ w_ctrl[1];
  assign w_cos_sinorcos   = w_ctrl[1] ~^ w_ctrl[0];
  
  assign w_sin_cos_mirror = w_ctrl[0];
  
  assign w_sel_sin_max = ( (w_sin_cos_mirror) && (w_addr == c_rom_depth-1) ) ? 1'b1 : 1'b0;
  assign w_sel_cos_max = ( (w_sin_cos_mirror) && (w_addr == c_rom_depth-1) ) ? 1'b1 : 1'b0;
         
  always @(*)
    begin: p_sin_reconstruction
      case ({w_sin_sign,w_sin_sinorcos,w_sin_cos_mirror})
        0: w_sin =                             $signed({1'b0,nco_sin_rom[w_addr]});
	3: w_sin = (!w_sel_sin_max) ?          $signed({1'b0,nco_cos_rom[w_addr+1'b1]}) :          $signed({1'b0,nco_cos_max});
	2: w_sin =                             $signed({1'b0,nco_cos_rom[w_addr]});
	1: w_sin = (!w_sel_sin_max) ?          $signed({1'b0,nco_sin_rom[w_addr+1'b1]}) :          $signed({1'b0,nco_sin_max});
	4: w_sin =                    -2'sd1 * $signed({1'b0,nco_sin_rom[w_addr]});
	7: w_sin = (!w_sel_sin_max) ? -2'sd1 * $signed({1'b0,nco_cos_rom[w_addr+1'b1]}) : -2'sd1 * $signed({1'b0,nco_cos_max});
	6: w_sin =                    -2'sd1 * $signed({1'b0,nco_cos_rom[w_addr]});
	5: w_sin = (!w_sel_sin_max) ? -2'sd1 * $signed({1'b0,nco_sin_rom[w_addr+1'b1]}) : -2'sd1 * $signed({1'b0,nco_sin_max});
	default: w_sin = $signed({(gp_rom_width+1){1'b0}});
      endcase
    end
  
  always @(*)
    begin: p_cos_reconstruction
      case ({w_cos_sign,w_cos_sinorcos,w_sin_cos_mirror})
        2: w_cos =                             $signed({1'b0,nco_cos_rom[w_addr]});
	1: w_cos = (!w_sel_cos_max) ?          $signed({1'b0,nco_sin_rom[w_addr+1'b1]}) :          $signed({1'b0,nco_sin_max});
	4: w_cos =                    -2'sd1 * $signed({1'b0,nco_sin_rom[w_addr]});
	7: w_cos = (!w_sel_cos_max) ? -2'sd1 * $signed({1'b0,nco_cos_rom[w_addr+1'b1]}) : -2'sd1 * $signed({1'b0,nco_cos_max});
	6: w_cos =                    -2'sd1 * $signed({1'b0,nco_cos_rom[w_addr]});
	5: w_cos = (!w_sel_cos_max) ? -2'sd1 * $signed({1'b0,nco_sin_rom[w_addr+1'b1]}) : -2'sd1 * $signed({1'b0,nco_sin_max});
	0: w_cos =                             $signed({1'b0,nco_sin_rom[w_addr]});
	3: w_cos = (!w_sel_cos_max) ?          $signed({1'b0,nco_cos_rom[w_addr+1'b1]}) :          $signed({1'b0,nco_cos_max});
	default: w_cos = $signed({(gp_rom_width+1){1'b0}});
      endcase
    end

assign o_sin = w_sin;
assign o_cos = w_cos;
          
endmodule
