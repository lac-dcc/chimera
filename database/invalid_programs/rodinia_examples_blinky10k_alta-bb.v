(* blackbox *)
module alta_ufms (
  input i_ufm_set,
  input i_osc_ena,
  input i_ufm_flash_csn,
  input i_ufm_flash_sclk,
  input i_ufm_flash_sdi,
  output o_osc,
  output o_ufm_flash_sdo,
);
endmodule

(* blackbox *)
module alta_ufm (
  input i_ufm_set,
  input i_program,
  input i_erase,
  input i_osc_ena,
  input i_arclk,
  input i_arshift,
  input i_ardin,
  input i_drdin,
  input i_drclk,
  input i_drshift,
  input i_tdo_u,
  output o_tdi_u,
  output o_tms_u,
  output o_tck_u,
  output o_shift_u,
  output o_update_u,
  output o_runidle_u,
  output o_rtp_busy,
  output o_ufm_busy,
  output o_osc,
  output o_drdout,
  output o_user1_valid,
  output o_user0_valid,
);
endmodule

(* blackbox *)
module alta_boot (
  input i_boot,
  input [1:0] im_vector_sel,
  input i_osc_enb,
  output o_osc,
);
endmodule

(* blackbox *)
module alta_pll (
  input clkin,
  input clkfb,
  input pllen,
  input resetn,
  input pfden,
  output clkout0,
  output clkout1,
  output lock,
);
  parameter CLKIN_DIV = 6'b000000;
  parameter CLKFB_DIV = 6'b000000;
  parameter CLKOUT0_EN = 1'b0;
  parameter CLKOUT1_EN = 1'b0;
  parameter CLKOUT0_DIV = 6'b000000;
  parameter CLKOUT1_DIV = 6'b000000;
  parameter CLKOUT0_DEL = 6'b000000;
  parameter CLKOUT1_DEL = 6'b000000;
  parameter CLKOUT0_PHASE = 3'b000;
  parameter CLKOUT1_PHASE = 3'b000;
  parameter FEEDBACK_MODE = 1'b0;
  parameter FEEDBACK_CLOCK = 1'b0;
endmodule

(* blackbox *)
module alta_pllx (
  input clkin,
  input clkfb,
  input pllen,
  input resetn,
  input clkout0en,
  input clkout1en,
  input clkout2en,
  input clkout3en,
  output clkout0,
  output clkout1,
  output clkout2,
  output clkout3,
  output lock,
);
  parameter CLKIN_DIV = 6'b000000;
  parameter CLKFB_DIV = 6'b000000;
  parameter CLKDIV0_EN = 1'b0;
  parameter CLKDIV1_EN = 1'b0;
  parameter CLKDIV2_EN = 1'b0;
  parameter CLKDIV3_EN = 1'b0;
  parameter CLKOUT0_DIV = 6'b000000;
  parameter CLKOUT1_DIV = 6'b000000;
  parameter CLKOUT2_DIV = 6'b000000;
  parameter CLKOUT3_DIV = 6'b000000;
  parameter CLKOUT0_DEL = 6'b000000;
  parameter CLKOUT1_DEL = 6'b000000;
  parameter CLKOUT2_DEL = 6'b000000;
  parameter CLKOUT3_DEL = 6'b000000;
  parameter CLKOUT0_PHASE = 3'b000;
  parameter CLKOUT1_PHASE = 3'b000;
  parameter CLKOUT2_PHASE = 3'b000;
  parameter CLKOUT3_PHASE = 3'b000;
  parameter FEEDBACK_MODE = 1'b0;
  parameter FEEDBACK_CLOCK = 2'b00;
endmodule

(* blackbox *)
module alta_pllv (
  input clkin,
  input clkfb,
  input pllen,
  input resetn,
  input clkout0en,
  input clkout1en,
  input clkout2en,
  input clkout3en,
  input clkout4en,
  output clkout0,
  output clkout1,
  output clkout2,
  output clkout3,
  output clkout4,
  output clkfbout,
  output lock,
);
  parameter CLKIN_DIV = 9'b000000000;
  parameter CLKFB_DIV = 9'b000000000;
  parameter CLKDIV0_EN = 1'b0;
  parameter CLKDIV1_EN = 1'b0;
  parameter CLKDIV2_EN = 1'b0;
  parameter CLKDIV3_EN = 1'b0;
  parameter CLKDIV4_EN = 1'b0;
  parameter CLKOUT0_HIGH = 8'b00000000;
  parameter CLKOUT0_LOW = 8'b00000000;
  parameter CLKOUT0_TRIM = 1'b0;
  parameter CLKOUT0_BYPASS = 1'b0;
  parameter CLKOUT1_HIGH = 8'b00000000;
  parameter CLKOUT1_LOW = 8'b00000000;
  parameter CLKOUT1_TRIM = 1'b0;
  parameter CLKOUT1_BYPASS = 1'b0;
  parameter CLKOUT2_HIGH = 8'b00000000;
  parameter CLKOUT2_LOW = 8'b00000000;
  parameter CLKOUT2_TRIM = 1'b0;
  parameter CLKOUT2_BYPASS = 1'b0;
  parameter CLKOUT3_HIGH = 8'b00000000;
  parameter CLKOUT3_LOW = 8'b00000000;
  parameter CLKOUT3_TRIM = 1'b0;
  parameter CLKOUT3_BYPASS = 1'b0;
  parameter CLKOUT4_HIGH = 8'b00000000;
  parameter CLKOUT4_LOW = 8'b00000000;
  parameter CLKOUT4_TRIM = 1'b0;
  parameter CLKOUT4_BYPASS = 1'b0;
  parameter CLKOUT0_DEL = 8'b00000000;
  parameter CLKOUT1_DEL = 8'b00000000;
  parameter CLKOUT2_DEL = 8'b00000000;
  parameter CLKOUT3_DEL = 8'b00000000;
  parameter CLKOUT4_DEL = 8'b00000000;
  parameter CLKOUT0_PHASE = 3'b000;
  parameter CLKOUT1_PHASE = 3'b000;
  parameter CLKOUT2_PHASE = 3'b000;
  parameter CLKOUT3_PHASE = 3'b000;
  parameter CLKOUT4_PHASE = 3'b000;
  parameter CLKFB_DEL = 8'b00000000;
  parameter CLKFB_PHASE = 3'b000;
  parameter CLKFB_TRIM = 1'b0;
  parameter FEEDBACK_MODE = 3'b000;
  parameter FBDELAY_VAL = 3'b000;
  parameter PLLOUTP_EN = 1'b0;
  parameter PLLOUTN_EN = 1'b0;
  parameter CLKOUT1_CASCADE = 1'b0;
  parameter CLKOUT2_CASCADE = 1'b0;
  parameter CLKOUT3_CASCADE = 1'b0;
  parameter CLKOUT4_CASCADE = 1'b0;
  parameter CP = 3'b000;
  parameter RREF = 2'b00;
  parameter RVI = 2'b00;
endmodule

(* blackbox *)
module alta_pllve (
  input clkin,
  input clkfb,
  input pfden,
  input resetn,
  input [2:0] phasecounterselect,
  input phaseupdown,
  input phasestep,
  input scanclk,
  input scanclkena,
  input scandata,
  input configupdate,
  output clkout0,
  output clkout1,
  output clkout2,
  output clkout3,
  output clkout4,
  output clkfbout,
  output lock,
  output scandataout,
  output scandone,
  output phasedone,
);
  parameter CLKIN_HIGH = 8'b00000000;
  parameter CLKIN_LOW = 8'b00000000;
  parameter CLKIN_TRIM = 1'b0;
  parameter CLKIN_BYPASS = 1'b0;
  parameter CLKFB_HIGH = 8'b00000000;
  parameter CLKFB_LOW = 8'b00000000;
  parameter CLKFB_TRIM = 1'b0;
  parameter CLKFB_BYPASS = 1'b0;
  parameter CLKDIV0_EN = 1'b0;
  parameter CLKDIV1_EN = 1'b0;
  parameter CLKDIV2_EN = 1'b0;
  parameter CLKDIV3_EN = 1'b0;
  parameter CLKDIV4_EN = 1'b0;
  parameter CLKOUT0_HIGH = 8'b00000000;
  parameter CLKOUT0_LOW = 8'b00000000;
  parameter CLKOUT0_TRIM = 1'b0;
  parameter CLKOUT0_BYPASS = 1'b0;
  parameter CLKOUT1_HIGH = 8'b00000000;
  parameter CLKOUT1_LOW = 8'b00000000;
  parameter CLKOUT1_TRIM = 1'b0;
  parameter CLKOUT1_BYPASS = 1'b0;
  parameter CLKOUT2_HIGH = 8'b00000000;
  parameter CLKOUT2_LOW = 8'b00000000;
  parameter CLKOUT2_TRIM = 1'b0;
  parameter CLKOUT2_BYPASS = 1'b0;
  parameter CLKOUT3_HIGH = 8'b00000000;
  parameter CLKOUT3_LOW = 8'b00000000;
  parameter CLKOUT3_TRIM = 1'b0;
  parameter CLKOUT3_BYPASS = 1'b0;
  parameter CLKOUT4_HIGH = 8'b00000000;
  parameter CLKOUT4_LOW = 8'b00000000;
  parameter CLKOUT4_TRIM = 1'b0;
  parameter CLKOUT4_BYPASS = 1'b0;
  parameter CLKOUT0_DEL = 8'b00000000;
  parameter CLKOUT1_DEL = 8'b00000000;
  parameter CLKOUT2_DEL = 8'b00000000;
  parameter CLKOUT3_DEL = 8'b00000000;
  parameter CLKOUT4_DEL = 8'b00000000;
  parameter CLKOUT0_PHASE = 3'b000;
  parameter CLKOUT1_PHASE = 3'b000;
  parameter CLKOUT2_PHASE = 3'b000;
  parameter CLKOUT3_PHASE = 3'b000;
  parameter CLKOUT4_PHASE = 3'b000;
  parameter CLKFB_DEL = 8'b00000000;
  parameter CLKFB_PHASE = 3'b000;
  parameter FEEDBACK_MODE = 3'b000;
  parameter FBDELAY_VAL = 3'b000;
  parameter PLLOUTP_EN = 1'b0;
  parameter PLLOUTN_EN = 1'b0;
  parameter CLKOUT1_CASCADE = 1'b0;
  parameter CLKOUT2_CASCADE = 1'b0;
  parameter CLKOUT3_CASCADE = 1'b0;
  parameter CLKOUT4_CASCADE = 1'b0;
  parameter VCO_POST_DIV = 1'b0;
  parameter REG_CTRL = 2'b00;
  parameter CP = 3'b000;
  parameter RREF = 2'b00;
  parameter RVI = 2'b00;
endmodule

(* blackbox *)
module alta_mult (
  input [8:0] DataInA0,
  input [8:0] DataInA1,
  input [8:0] DataInB0,
  input [8:0] DataInb0,
  input SignA,
  input SignB,
  input Clk,
  input ClkEn,
  input AsyncReset,
  output [17:0] DataOut0,
  output [17:0] DataOut1,
);
  parameter MULT_MODE = 1'b0;
  parameter PORTA_INREG0 = 1'b0;
  parameter PORTA_INREG1 = 1'b0;
  parameter PORTB_INREG0 = 1'b0;
  parameter PORTB_INREG1 = 1'b0;
  parameter SIGNA_REG = 1'b0;
  parameter SIGNB_REG = 1'b0;
  parameter OUTREG0 = 1'b0;
  parameter OUTREG1 = 1'b0;
  parameter ClkCFG = 2'b00;
endmodule

(* blackbox *)
module alta_i2c (
  input Clk,
  input Rst,
  input Strobe,
  input WrRdn,
  input [7:0] Address,
  input [7:0] DataIn,
  input Scli,
  input Sdai,
  output Ack,
  output Irq,
  output Wakeup,
  output Sclo,
  output Sdao,
  output [7:0] DataOut,
);
  parameter SLOT_ID = 4'b0000;
  parameter ClkCFG = 2'b00;
endmodule

(* blackbox *)
module alta_spi (
  input Clk,
  input Rst,
  input Strobe,
  input WrRdn,
  input [7:0] Address,
  input [7:0] DataIn,
  input Mi,
  input Si,
  input Scki,
  input Csi,
  output Ack,
  output Irq,
  output Wakeup,
  output [7:0] DataOut,
  output So,
  output Soe,
  output Mo,
  output Moe,
  output Scko,
  output Sckoe,
  output [3:0] Cso,
  output [3:0] Csoe,
);
  parameter SLOT_ID = 4'b0000;
  parameter ClkCFG = 2'b00;
endmodule

(* blackbox *)
module alta_irda (
  input ir_clk,
  input ir_reset,
  input cal_en,
  input pu_ivref,
  input pu_pga,
  input pu_dac,
  input tia_reset,
  input vip,
  input vin,
  output irx_data,
  output cal_ready,
  output [7:0] dac_cal_reg,
);
  parameter CFG_IRIP_EN = 1'b0;
  parameter CLK_SEL_SYS = 1'b0;
  parameter CLK_DIV_CMP_SYS = 3'b0;
  parameter CLK_DIV_SYS = 3'b0;
  parameter PU_HYSTER_SYS = 1'b0;
  parameter REG_BYPASS_SYS = 1'b0;
  parameter OUTPUT_SEL_SYS = 1'b0;
  parameter CAL_READY_REG_SYS = 1'b0;
  parameter CAL_READY_DR_SYS = 1'b0;
  parameter CAL_TIME_SYS = 2'b0;
  parameter CAL_DELAY_SYS = 2'b0;
  parameter CAL_SPEED_SYS = 2'b0;
  parameter DC_ACC_GAIN_SYS = 3'b0;
  parameter BYPASS_DC_CALC_SYS = 1'b0;
  parameter DC_TIME_SEL_SYS = 3'b0;
  parameter REG_VBIT_SYS = 2'b0;
  parameter RX_CAL_BIT_SYS = 8'b0;
  parameter RX_CAL_BIT_DR_SYS = 1'b0;
  parameter RX_DC_POLARITY_SYS = 1'b0;
  parameter RX_CAL_POLARITY_SYS = 1'b0;
  parameter DC_GAIN_SYS = 5'b0;
  parameter DAC_GAIN_SYS = 2'b0;
  parameter DAC_RANGE_SYS = 2'b0;
  parameter PGA_CAP_BIT_SYS = 4'b0;
  parameter PGA_CAP_EN_SYS = 1'b0;
  parameter PGA_CAL_MODE_SYS = 1'b0;
  parameter PGA_GAIN2_SYS = 2'b0;
  parameter PGA_GAIN_SYS = 3'b0;
  parameter DIFF_EN_SYS = 1'b0;
  parameter TIA_GAIN_SYS = 2'b0;
  parameter BG_SEL_SYS = 1'b0;
endmodule

(* blackbox *)
module alta_io (
  input datain,
  input oe,
  output combout,
  input padio,
);
  parameter PRG_DELAYB = 1'b0;
  parameter PRG_DELAYB_P = 1'b0;
  parameter PRG_DELAYB_N = 1'b0;
  parameter RX_SEL = 1'b0;
  parameter RX_SEL_P = 1'b0;
  parameter RX_SEL_N = 1'b0;
  parameter PDCNTL = 2'b00;
  parameter PDCNTL_P = 2'b00;
  parameter PDCNTL_N = 2'b00;
  parameter NDCNTL = 2'b00;
  parameter NDCNTL_P = 2'b00;
  parameter NDCNTL_N = 2'b00;
  parameter PRG_SLR = 1'b0;
  parameter PRG_SLR_P = 1'b0;
  parameter PRG_SLR_N = 1'b0;
  parameter CFG_KEEP = 2'b00;
  parameter CFG_KEEP_N = 2'b00;
  parameter CFG_KEEP_P = 2'b00;
  parameter PU = 4'b0000;
  parameter LVDS_RSDS_IREF = 12'b000000000000;
  parameter CFG_LVDS_RSDS_EN = 1'b0;
endmodule

(* blackbox *)
module alta_ioreg (
  input paddataout,
  input datain,
  input oe,
  output combout,
  output regout,
  output paddatain,
  output padoe,
  input outclk,
  input outclkena,
  input inclk,
  input inclkena,
  input areset,
  input sreset,
);
endmodule

(* blackbox *)
module alta_rio (
  input datain,
  input oe,
  output combout,
  output regout,
  input outclk,
  input outclkena,
  input inclk,
  input inclkena,
  input areset,
  input sreset,
  input padio,
);
  parameter IN_ASYNC_MODE = 1'b0;
  parameter IN_SYNC_MODE = 1'b0;
  parameter IN_POWERUP = 1'b0;
  parameter OUT_REG_MODE = 1'b0;
  parameter OUT_ASYNC_MODE = 1'b0;
  parameter OUT_SYNC_MODE = 1'b0;
  parameter OUT_POWERUP = 1'b0;
  parameter OE_REG_MODE = 1'b0;
  parameter OE_ASYNC_MODE = 1'b0;
  parameter OE_SYNC_MODE = 1'b0;
  parameter OE_POWERUP = 1'b0;
  parameter inclkCFG = 2'b00;
  parameter outclkCFG = 2'b00;
  parameter CFG_TRI_INPUT = 1'b0;
  parameter CFG_PULL_UP = 1'b0;
  parameter CFG_SLR = 1'b0;
  parameter CFG_OPEN_DRAIN = 1'b0;
  parameter CFG_PDRCTRL = 4'b0000;
  parameter CFG_KEEP = 2'b00;
  parameter CFG_LVDS_OUT_EN = 1'b0;
  parameter CFG_LVDS_SEL_CUA = 2'b00;
  parameter CFG_LVDS_IREF = 10'b0000000000;
  parameter CFG_LVDS_IN_EN = 1'b0;
  parameter DPCLK_DELAY = 4'b0000;
  parameter OUT_DELAY = 1'b0;
  parameter IN_DATA_DELAY = 3'b000;
  parameter IN_REG_DELAY = 3'b000;
endmodule

(* blackbox *)
module alta_dio (
  input datain,
  input datainh,
  input oe,
  output combout,
  output regout,
  input outclk,
  input outclkena,
  input inclk,
  input inclkena,
  input areset,
  input sreset,
  input padio,
);
  parameter IN_ASYNC_MODE = 1'b0;
  parameter IN_SYNC_MODE = 1'b0;
  parameter IN_POWERUP = 1'b0;
  parameter IN_ASYNC_DISABLE = 1'b0;
  parameter IN_SYNC_DISABLE = 1'b0;
  parameter OUT_REG_MODE = 1'b0;
  parameter OUT_ASYNC_MODE = 1'b0;
  parameter OUT_SYNC_MODE = 1'b0;
  parameter OUT_POWERUP = 1'b0;
  parameter OUT_CLKEN_DISABLE = 1'b0;
  parameter OUT_ASYNC_DISABLE = 1'b0;
  parameter OUT_SYNC_DISABLE = 1'b0;
  parameter OUT_DDIO = 1'b0;
  parameter OE_REG_MODE = 1'b0;
  parameter OE_ASYNC_MODE = 1'b0;
  parameter OE_SYNC_MODE = 1'b0;
  parameter OE_POWERUP = 1'b0;
  parameter OE_CLKEN_DISABLE = 1'b0;
  parameter OE_ASYNC_DISABLE = 1'b0;
  parameter OE_SYNC_DISABLE = 1'b0;
  parameter OE_DDIO = 1'b0;
  parameter inclkCFG = 2'b00;
  parameter outclkCFG = 2'b00;
  parameter CFG_TRI_INPUT = 1'b0;
  parameter CFG_PULL_UP = 1'b0;
  parameter CFG_OPEN_DRAIN = 1'b0;
  parameter CFG_ROCT_CAL_EN = 1'b0;
  parameter CFG_PDRV = 7'b0000000;
  parameter CFG_NDRV = 7'b0000000;
  parameter CFG_KEEP = 2'b00;
  parameter CFG_LVDS_OUT_EN = 1'b0;
  parameter CFG_LVDS_SEL_CUA = 3'b000;
  parameter CFG_LVDS_IREF = 10'b0000000000;
  parameter CFG_LVDS_IN_EN = 1'b0;
  parameter CFG_SSTL_OUT_EN = 1'b0;
  parameter CFG_SSTL_INPUT_EN = 1'b0;
  parameter CFG_SSTL_SEL_CUA = 3'b000;
  parameter CFG_OSCDIV = 2'b00;
  parameter CFG_ROCTUSR = 1'b0;
  parameter CFG_SEL_CUA = 1'b0;
  parameter CFG_ROCT_EN = 1'b0;
  parameter DPCLK_DELAY = 4'b0000;
  parameter OUT_DELAY = 1'b0;
  parameter IN_DATA_DELAY = 3'b000;
  parameter IN_REG_DELAY = 3'b000;
endmodule

(* blackbox *)
module alta_indel (
  input in,
  output out,
);
endmodule

(* blackbox *)
module alta_slice (
  input A,
  input B,
  input C,
  input D,
  output LutOut,
  output Q,
  input Cin,
  output Cout,
  input SyncReset,
  input SyncLoad,
  input Clk,
  input AsyncReset,
  input Qin,
  input ShiftData,
);
  parameter ClkMux = 2'b00;
  parameter AsyncResetMux = 2'b00;
  parameter SyncResetMux = 2'b0;
  parameter SyncLoadMux = 2'b0;
  parameter modeMux = 1'b0;
  parameter FeedbackMux = 1'b0;
  parameter ShiftMux = 1'b0;
  parameter BypassEn = 1'b0;
  parameter CarryEnb = 1'b0;
endmodule

(* blackbox *)
module alta_sramctrl (
  input [3:0] WAddr,
  input [3:0] Din,
  input WClk,
  input WEna,
  output [15:0] WlDst,
  output [3:0] BlDst,
  output [3:0] BlbDst,
);
endmodule

(* blackbox *)
module alta_sram (
  input [3:0] RAddr,
  input [3:0] WAddr,
  input [3:0] Din,
  input WClk,
  input WEna,
  output [3:0] Dout,
);
  parameter INIT_VAL = 64'h0;
endmodule

(* blackbox *)
module alta_bram (
  input [17:0] DataInA,
  input [17:0] DataInB,
  input [11:0] AddressA,
  input [11:0] AddressB,
  input Clk0,
  input Clk1,
  input ClkEn0,
  input ClkEn1,
  input AsyncReset0,
  input AsyncReset1,
  input WeRenA,
  input WeRenB,
  output [17:0] DataOutA,
  output [17:0] DataOutB,
);
  parameter CLKMODE = 1'b0;
  parameter PORTA_WIDTH = 4'b0000;
  parameter PORTB_WIDTH = 4'b0000;
  parameter PORTA_WRITEMODE = 1'b0;
  parameter PORTB_WRITEMODE = 1'b0;
  parameter PORTA_WRITETHRU = 1'b0;
  parameter PORTB_WRITETHRU = 1'b0;
  parameter PORTA_OUTREG = 1'b0;
  parameter PORTB_OUTREG = 1'b0;
  parameter PORTB_READONLY = 1'b0;
  parameter INIT_VAL = 4608'b0;
  parameter Clk0CFG = 2'b00;
  parameter Clk1CFG = 2'b00;
endmodule

(* blackbox *)
module alta_bram9k (
  input [17:0] DataInA,
  input [17:0] DataInB,
  input [12:0] AddressA,
  input [12:0] AddressB,
  input [1:0] ByteEnA,
  input [1:0] ByteEnB,
  input Clk0,
  input Clk1,
  input ClkEn0,
  input ClkEn1,
  input AsyncReset0,
  input AsyncReset1,
  input AddressStallA,
  input AddressStallB,
  input WeA,
  input ReA,
  input WeB,
  input ReB,
  output [17:0] DataOutA,
  output [17:0] DataOutB,
);
  parameter CLKMODE = 2'b00;
  parameter PACKEDMODE = 1'b0;
  parameter PORTA_CLKIN_EN = 1'b0;
  parameter PORTA_CLKOUT_EN = 1'b0;
  parameter PORTB_CLKIN_EN = 1'b0;
  parameter PORTB_CLKOUT_EN = 1'b0;
  parameter PORTA_RSTIN_EN = 1'b0;
  parameter PORTA_RSTOUT_EN = 1'b0;
  parameter PORTB_RSTIN_EN = 1'b0;
  parameter PORTB_RSTOUT_EN = 1'b0;
  parameter PORTA_WIDTH = 5'b0;
  parameter PORTB_WIDTH = 5'b00000;
  parameter PORTA_WRITETHRU = 1'b0;
  parameter PORTB_WRITETHRU = 1'b0;
  parameter PORTA_OUTREG = 1'b0;
  parameter PORTB_OUTREG = 1'b0;
  parameter RSEN_DLY = 2'b00;
  parameter DLYTIME = 2'b00;
  parameter INIT_VAL = 9216'b0;
  parameter Clk0CFG = 2'b00;
  parameter Clk1CFG = 2'b00;
endmodule

(* blackbox *)
module alta_clkenctrl (
  input ClkIn,
  input ClkEn,
  output ClkOut,
);
  parameter ClkMux = 2'b00;
  parameter ClkEnMux = 2'b0;
endmodule

(* blackbox *)
module alta_asyncctrl (
  input Din,
  output Dout,
);
  parameter AsyncCtrlMux = 2'b00;
endmodule

(* blackbox *)
module alta_syncctrl (
  input Din,
  output Dout,
);
  parameter SyncCtrlMux = 2'b00;
endmodule

(* blackbox *)
module alta_io_gclk (
  input inclk,
  output outclk,
);
endmodule

(* blackbox *)
module alta_ufm_gddd (
  input in,
  output out,
);
endmodule

(* blackbox *)
module alta_mcu (
  input CLK,
  input JTCK,
  input POR_n,
  input EXT_CPU_RST_n,
  input JTRST_n,
  input UART_RXD,
  input UART_CTS_n,
  input JTDI,
  input JTMS,
  input EXT_RAM_EN,
  input EXT_RAM_WR,
  input [13:0] EXT_RAM_ADDR,
  input [3:0] EXT_RAM_BYTE_EN,
  input [31:0] EXT_RAM_WDATA,
  input [1:0] HRESP_EXT,
  input HREADY_OUT_EXT,
  input [31:0] HRDATA_EXT,
  output [1:0] HTRANS_EXT,
  output [31:0] HADDR_EXT,
  output HWRITE_EXT,
  output HSEL_EXT,
  output [31:0] HWDATA_EXT,
  output [2:0] HSIZE_EXT,
  output HREADY_IN_EXT,
  output FLASH_SCK,
  output FLASH_CS_n,
  output UART_TXD,
  output UART_RTS_n,
  output JTDO,
  output [31:0] EXT_RAM_RDATA,
  output FLASH_IO0_SI,
  output FLASH_IO1_SO,
  output FLASH_IO2_WPn,
  output FLASH_IO3_HOLDn,
  input FLASH_IO0_SI_i,
  input FLASH_IO1_SO_i,
  input FLASH_IO2_WPn_i,
  input FLASH_IO3_HOLDn_i,
  output FLASH_SI_OE,
  output FLASH_SO_OE,
  output WPn_IO2_OE,
  output HOLDn_IO3_OE,
  input [7:0] GPIO0_I,
  input [7:0] GPIO1_I,
  input [7:0] GPIO2_I,
  output [7:0] GPIO0_O,
  output [7:0] GPIO1_O,
  output [7:0] GPIO2_O,
  output [7:0] nGPEN0,
  output [7:0] nGPEN1,
  output [7:0] nGPEN2,
);
  parameter FLASH_BIAS = 24'b0;
  parameter CLKCFG = 2'b00;
endmodule

(* blackbox *)
module alta_clkctrl (
);
endmodule

(* blackbox *)
module alta_clk_delay_ctrl (
);
endmodule

(* blackbox *)
module alta_mac_out (
);
endmodule

(* blackbox *)
module alta_mac_mult (
);
endmodule

(* blackbox *)
module alta_ram_block (
);
endmodule

(* blackbox *)
module alta_asmiblock (
);
endmodule

(* blackbox *)
module alta_crcblock (
);
endmodule

(* blackbox *)
module alta_jtag (
  input tdouser,
  output tmsutap,
  output tckutap,
  output tdiutap,
  output shiftuser,
  output clkdruser,
  output updateuser,
  output runidleuser,
  output usr1user,
);
endmodule

(* blackbox *)
module alta_gclksel (
  input [3:0] clkin,
  input [1:0] select,
  output clkout,
);
endmodule

(* blackbox *)
module alta_gclkgen (
  input clkin,
  input ena,
  output clkout,
);
  parameter CFG_ENA_REG_MODE = 1'b0;
endmodule

(* blackbox *)
module alta_gclkgen2 (
  input clkin,
  input ena,
  input mode,
  output clkout,
);
endmodule

(* blackbox *)
module alta_dpclkdel (
  input clkin,
  output clkout,
);
  parameter DPCLK_DELAY = 4'b0000;
endmodule

(* blackbox *)
module alta_oct (
  input clkusr,
  input rstnusr,
  output octdone,
  output octdoneuser,
  output rupcompout,
  output rdncompout,
  output rupoctcalnout,
  output rdnoctcalnout,
);
  parameter OCT_EN = 1'b0;
  parameter OCT_CLKDIV = 2'b00;
  parameter OCT_USR = 1'b0;
endmodule

(* blackbox *)
module alta_saradc (
  input adcenb,
  input sclk,
  input [3:0] insel,
  input refsel,
  input divvi8,
  input bgenb,
  output [11:0] db,
  output eoc,
  input refin,
  input [8:0] ain,
);
  parameter sclkCFG = 2'b00;
endmodule