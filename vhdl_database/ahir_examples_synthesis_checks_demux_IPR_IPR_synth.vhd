--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.28xd
--  \   \         Application: netgen
--  /   /         Filename: ahir_system_synth.vhd
-- /___/   /\     Timestamp: Sun Jan  3 15:34:31 2016
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -fn -w -ofmt vhdl ahir_system_synth.ngc 
-- Device	: xc6vlx240t-ff1156-1
-- Input file	: ahir_system_synth.ngc
-- Output file	: ahir_system_synth.vhd
-- # of Entities	: 1
-- Design Name	: InputPortRevisedCheck
-- Xilinx	: /CAD/Xilinx/14.2/ISE_DS/ISE/
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity InputPortRevisedCheck is
  port (
    oack : in STD_LOGIC := 'X'; 
    clk : in STD_LOGIC := 'X'; 
    reset : in STD_LOGIC := 'X'; 
    oreq : out STD_LOGIC; 
    sample_req : in STD_LOGIC_VECTOR ( 1 downto 0 ); 
    update_req : in STD_LOGIC_VECTOR ( 1 downto 0 ); 
    odata : in STD_LOGIC_VECTOR ( 31 downto 0 ); 
    sample_ack : out STD_LOGIC_VECTOR ( 1 downto 0 ); 
    update_ack : out STD_LOGIC_VECTOR ( 1 downto 0 ); 
    data : out STD_LOGIC_VECTOR ( 63 downto 0 ) 
  );
end InputPortRevisedCheck;

architecture STRUCTURE of InputPortRevisedCheck is
  signal update_req_1_IBUF_302 : STD_LOGIC; 
  signal update_req_0_IBUF_303 : STD_LOGIC; 
  signal oack_IBUF_336 : STD_LOGIC; 
  signal clk_BUFGP_337 : STD_LOGIC; 
  signal reset_IBUF_338 : STD_LOGIC; 
  signal sample_ack_0_OBUF_339 : STD_LOGIC; 
  signal sample_ack_1_OBUF_340 : STD_LOGIC; 
  signal update_ack_0_OBUF_341 : STD_LOGIC; 
  signal update_ack_1_OBUF_342 : STD_LOGIC; 
  signal data_63_OBUF_343 : STD_LOGIC; 
  signal data_62_OBUF_344 : STD_LOGIC; 
  signal data_61_OBUF_345 : STD_LOGIC; 
  signal data_60_OBUF_346 : STD_LOGIC; 
  signal data_59_OBUF_347 : STD_LOGIC; 
  signal data_58_OBUF_348 : STD_LOGIC; 
  signal data_57_OBUF_349 : STD_LOGIC; 
  signal data_56_OBUF_350 : STD_LOGIC; 
  signal data_55_OBUF_351 : STD_LOGIC; 
  signal data_54_OBUF_352 : STD_LOGIC; 
  signal data_53_OBUF_353 : STD_LOGIC; 
  signal data_52_OBUF_354 : STD_LOGIC; 
  signal data_51_OBUF_355 : STD_LOGIC; 
  signal data_50_OBUF_356 : STD_LOGIC; 
  signal data_49_OBUF_357 : STD_LOGIC; 
  signal data_48_OBUF_358 : STD_LOGIC; 
  signal data_47_OBUF_359 : STD_LOGIC; 
  signal data_46_OBUF_360 : STD_LOGIC; 
  signal data_45_OBUF_361 : STD_LOGIC; 
  signal data_44_OBUF_362 : STD_LOGIC; 
  signal data_43_OBUF_363 : STD_LOGIC; 
  signal data_42_OBUF_364 : STD_LOGIC; 
  signal data_41_OBUF_365 : STD_LOGIC; 
  signal data_40_OBUF_366 : STD_LOGIC; 
  signal data_39_OBUF_367 : STD_LOGIC; 
  signal data_38_OBUF_368 : STD_LOGIC; 
  signal data_37_OBUF_369 : STD_LOGIC; 
  signal data_36_OBUF_370 : STD_LOGIC; 
  signal data_35_OBUF_371 : STD_LOGIC; 
  signal data_34_OBUF_372 : STD_LOGIC; 
  signal data_33_OBUF_373 : STD_LOGIC; 
  signal data_32_OBUF_374 : STD_LOGIC; 
  signal data_31_OBUF_375 : STD_LOGIC; 
  signal data_30_OBUF_376 : STD_LOGIC; 
  signal data_29_OBUF_377 : STD_LOGIC; 
  signal data_28_OBUF_378 : STD_LOGIC; 
  signal data_27_OBUF_379 : STD_LOGIC; 
  signal data_26_OBUF_380 : STD_LOGIC; 
  signal data_25_OBUF_381 : STD_LOGIC; 
  signal data_24_OBUF_382 : STD_LOGIC; 
  signal data_23_OBUF_383 : STD_LOGIC; 
  signal data_22_OBUF_384 : STD_LOGIC; 
  signal data_21_OBUF_385 : STD_LOGIC; 
  signal data_20_OBUF_386 : STD_LOGIC; 
  signal data_19_OBUF_387 : STD_LOGIC; 
  signal data_18_OBUF_388 : STD_LOGIC; 
  signal data_17_OBUF_389 : STD_LOGIC; 
  signal data_16_OBUF_390 : STD_LOGIC; 
  signal data_15_OBUF_391 : STD_LOGIC; 
  signal data_14_OBUF_392 : STD_LOGIC; 
  signal data_13_OBUF_393 : STD_LOGIC; 
  signal data_12_OBUF_394 : STD_LOGIC; 
  signal data_11_OBUF_395 : STD_LOGIC; 
  signal data_10_OBUF_396 : STD_LOGIC; 
  signal data_9_OBUF_397 : STD_LOGIC; 
  signal data_8_OBUF_398 : STD_LOGIC; 
  signal data_7_OBUF_399 : STD_LOGIC; 
  signal data_6_OBUF_400 : STD_LOGIC; 
  signal data_5_OBUF_401 : STD_LOGIC; 
  signal data_4_OBUF_402 : STD_LOGIC; 
  signal data_3_OBUF_403 : STD_LOGIC; 
  signal data_2_OBUF_404 : STD_LOGIC; 
  signal data_1_OBUF_405 : STD_LOGIC; 
  signal data_0_OBUF_406 : STD_LOGIC; 
  signal oreq_OBUF_407 : STD_LOGIC; 
  signal in_data_read_0_update_req_0_2_299 : STD_LOGIC; 
  signal in_data_read_0_update_req_0_1_298 : STD_LOGIC; 
  signal in_data_read_0_update_req_1_2_297 : STD_LOGIC; 
  signal in_data_read_0_update_req_1_1_296 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_fsm_state_3_295 : STD_LOGIC; 
  signal in_data_read_0_N3 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_fsm_state_2_293 : STD_LOGIC; 
  signal in_data_read_0_N2 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_fsm_state_3_291 : STD_LOGIC; 
  signal in_data_read_0_N1 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_fsm_state_2_289 : STD_LOGIC; 
  signal in_data_read_0_N01 : STD_LOGIC; 
  signal in_data_read_0_demux_ack_0_2_287 : STD_LOGIC; 
  signal in_data_read_0_demux_ack_0_1_286 : STD_LOGIC; 
  signal in_data_read_0_demux_ack_1_2_285 : STD_LOGIC; 
  signal in_data_read_0_demux_ack_1_1_284 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_fsm_state_1_283 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_fsm_state_1_282 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_31_dpot_281 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_30_dpot_280 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_29_dpot_279 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_28_dpot_278 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_27_dpot_277 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_26_dpot_276 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_25_dpot_275 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_24_dpot_274 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_23_dpot_273 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_22_dpot_272 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_21_dpot_271 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_20_dpot_270 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_19_dpot_269 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_18_dpot_268 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_17_dpot_267 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_16_dpot_266 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_15_dpot_265 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_14_dpot_264 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_13_dpot_263 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_12_dpot_262 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_11_dpot_261 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_10_dpot_260 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_9_dpot_259 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_8_dpot_258 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_7_dpot_257 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_6_dpot_256 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_5_dpot_255 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_4_dpot_254 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_3_dpot_253 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_2_dpot_252 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_1_dpot_251 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_data_reg_0_dpot_250 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_31_dpot_249 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_30_dpot_248 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_29_dpot_247 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_28_dpot_246 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_27_dpot_245 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_26_dpot_244 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_25_dpot_243 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_24_dpot_242 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_23_dpot_241 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_22_dpot_240 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_21_dpot_239 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_20_dpot_238 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_19_dpot_237 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_18_dpot_236 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_17_dpot_235 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_16_dpot_234 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_15_dpot_233 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_14_dpot_232 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_13_dpot_231 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_12_dpot_230 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_11_dpot_229 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_10_dpot_228 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_9_dpot_227 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_8_dpot_226 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_7_dpot_225 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_6_dpot_224 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_5_dpot_223 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_4_dpot_222 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_3_dpot_221 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_2_dpot_220 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_1_dpot_219 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_data_reg_0_dpot_218 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_fsm_state_glue_set_217 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_fsm_state_glue_set_216 : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_latch_v : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_latch_v : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_has_room_v : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_has_room_v : STD_LOGIC; 
  signal in_data_read_0_ProTx_1_fsm_fsm_state_209 : STD_LOGIC; 
  signal in_data_read_0_ProTx_0_fsm_fsm_state_208 : STD_LOGIC; 
  signal in_data_read_0_demux_data_0_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_1_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_2_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_10_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_11_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_12_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_13_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_14_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_15_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_16_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_17_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_18_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_19_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_20_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_21_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_22_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_23_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_24_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_25_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_26_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_27_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_28_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_29_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_30_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_31_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_35_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_36_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_37_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_38_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_39_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_40_Q : STD_LOGIC; 
  signal in_data_read_0_demux_data_41_Q : STD_LOGIC; 
  signal in_data_read_0_write_enable : STD_LOGIC_VECTOR ( 1 downto 0 ); 
begin
  sample_req_1_IBUF : IBUF
    port map (
      I => sample_req(1),
      O => sample_ack_1_OBUF_340
    );
  sample_req_0_IBUF : IBUF
    port map (
      I => sample_req(0),
      O => sample_ack_0_OBUF_339
    );
  update_req_1_IBUF : IBUF
    port map (
      I => update_req(1),
      O => update_req_1_IBUF_302
    );
  update_req_0_IBUF : IBUF
    port map (
      I => update_req(0),
      O => update_req_0_IBUF_303
    );
  odata_31_IBUF : IBUF
    port map (
      I => odata(31),
      O => in_data_read_0_demux_data_31_Q
    );
  odata_30_IBUF : IBUF
    port map (
      I => odata(30),
      O => in_data_read_0_demux_data_30_Q
    );
  odata_29_IBUF : IBUF
    port map (
      I => odata(29),
      O => in_data_read_0_demux_data_29_Q
    );
  odata_28_IBUF : IBUF
    port map (
      I => odata(28),
      O => in_data_read_0_demux_data_28_Q
    );
  odata_27_IBUF : IBUF
    port map (
      I => odata(27),
      O => in_data_read_0_demux_data_27_Q
    );
  odata_26_IBUF : IBUF
    port map (
      I => odata(26),
      O => in_data_read_0_demux_data_26_Q
    );
  odata_25_IBUF : IBUF
    port map (
      I => odata(25),
      O => in_data_read_0_demux_data_25_Q
    );
  odata_24_IBUF : IBUF
    port map (
      I => odata(24),
      O => in_data_read_0_demux_data_24_Q
    );
  odata_23_IBUF : IBUF
    port map (
      I => odata(23),
      O => in_data_read_0_demux_data_23_Q
    );
  odata_22_IBUF : IBUF
    port map (
      I => odata(22),
      O => in_data_read_0_demux_data_22_Q
    );
  odata_21_IBUF : IBUF
    port map (
      I => odata(21),
      O => in_data_read_0_demux_data_21_Q
    );
  odata_20_IBUF : IBUF
    port map (
      I => odata(20),
      O => in_data_read_0_demux_data_20_Q
    );
  odata_19_IBUF : IBUF
    port map (
      I => odata(19),
      O => in_data_read_0_demux_data_19_Q
    );
  odata_18_IBUF : IBUF
    port map (
      I => odata(18),
      O => in_data_read_0_demux_data_18_Q
    );
  odata_17_IBUF : IBUF
    port map (
      I => odata(17),
      O => in_data_read_0_demux_data_17_Q
    );
  odata_16_IBUF : IBUF
    port map (
      I => odata(16),
      O => in_data_read_0_demux_data_16_Q
    );
  odata_15_IBUF : IBUF
    port map (
      I => odata(15),
      O => in_data_read_0_demux_data_15_Q
    );
  odata_14_IBUF : IBUF
    port map (
      I => odata(14),
      O => in_data_read_0_demux_data_14_Q
    );
  odata_13_IBUF : IBUF
    port map (
      I => odata(13),
      O => in_data_read_0_demux_data_13_Q
    );
  odata_12_IBUF : IBUF
    port map (
      I => odata(12),
      O => in_data_read_0_demux_data_12_Q
    );
  odata_11_IBUF : IBUF
    port map (
      I => odata(11),
      O => in_data_read_0_demux_data_11_Q
    );
  odata_10_IBUF : IBUF
    port map (
      I => odata(10),
      O => in_data_read_0_demux_data_10_Q
    );
  odata_9_IBUF : IBUF
    port map (
      I => odata(9),
      O => in_data_read_0_demux_data_41_Q
    );
  odata_8_IBUF : IBUF
    port map (
      I => odata(8),
      O => in_data_read_0_demux_data_40_Q
    );
  odata_7_IBUF : IBUF
    port map (
      I => odata(7),
      O => in_data_read_0_demux_data_39_Q
    );
  odata_6_IBUF : IBUF
    port map (
      I => odata(6),
      O => in_data_read_0_demux_data_38_Q
    );
  odata_5_IBUF : IBUF
    port map (
      I => odata(5),
      O => in_data_read_0_demux_data_37_Q
    );
  odata_4_IBUF : IBUF
    port map (
      I => odata(4),
      O => in_data_read_0_demux_data_36_Q
    );
  odata_3_IBUF : IBUF
    port map (
      I => odata(3),
      O => in_data_read_0_demux_data_35_Q
    );
  odata_2_IBUF : IBUF
    port map (
      I => odata(2),
      O => in_data_read_0_demux_data_2_Q
    );
  odata_1_IBUF : IBUF
    port map (
      I => odata(1),
      O => in_data_read_0_demux_data_1_Q
    );
  odata_0_IBUF : IBUF
    port map (
      I => odata(0),
      O => in_data_read_0_demux_data_0_Q
    );
  oack_IBUF : IBUF
    port map (
      I => oack,
      O => oack_IBUF_336
    );
  reset_IBUF : IBUF
    port map (
      I => reset,
      O => reset_IBUF_338
    );
  sample_ack_1_OBUF : OBUF
    port map (
      I => sample_ack_1_OBUF_340,
      O => sample_ack(1)
    );
  sample_ack_0_OBUF : OBUF
    port map (
      I => sample_ack_0_OBUF_339,
      O => sample_ack(0)
    );
  update_ack_1_OBUF : OBUF
    port map (
      I => update_ack_1_OBUF_342,
      O => update_ack(1)
    );
  update_ack_0_OBUF : OBUF
    port map (
      I => update_ack_0_OBUF_341,
      O => update_ack(0)
    );
  data_63_OBUF : OBUF
    port map (
      I => data_63_OBUF_343,
      O => data(63)
    );
  data_62_OBUF : OBUF
    port map (
      I => data_62_OBUF_344,
      O => data(62)
    );
  data_61_OBUF : OBUF
    port map (
      I => data_61_OBUF_345,
      O => data(61)
    );
  data_60_OBUF : OBUF
    port map (
      I => data_60_OBUF_346,
      O => data(60)
    );
  data_59_OBUF : OBUF
    port map (
      I => data_59_OBUF_347,
      O => data(59)
    );
  data_58_OBUF : OBUF
    port map (
      I => data_58_OBUF_348,
      O => data(58)
    );
  data_57_OBUF : OBUF
    port map (
      I => data_57_OBUF_349,
      O => data(57)
    );
  data_56_OBUF : OBUF
    port map (
      I => data_56_OBUF_350,
      O => data(56)
    );
  data_55_OBUF : OBUF
    port map (
      I => data_55_OBUF_351,
      O => data(55)
    );
  data_54_OBUF : OBUF
    port map (
      I => data_54_OBUF_352,
      O => data(54)
    );
  data_53_OBUF : OBUF
    port map (
      I => data_53_OBUF_353,
      O => data(53)
    );
  data_52_OBUF : OBUF
    port map (
      I => data_52_OBUF_354,
      O => data(52)
    );
  data_51_OBUF : OBUF
    port map (
      I => data_51_OBUF_355,
      O => data(51)
    );
  data_50_OBUF : OBUF
    port map (
      I => data_50_OBUF_356,
      O => data(50)
    );
  data_49_OBUF : OBUF
    port map (
      I => data_49_OBUF_357,
      O => data(49)
    );
  data_48_OBUF : OBUF
    port map (
      I => data_48_OBUF_358,
      O => data(48)
    );
  data_47_OBUF : OBUF
    port map (
      I => data_47_OBUF_359,
      O => data(47)
    );
  data_46_OBUF : OBUF
    port map (
      I => data_46_OBUF_360,
      O => data(46)
    );
  data_45_OBUF : OBUF
    port map (
      I => data_45_OBUF_361,
      O => data(45)
    );
  data_44_OBUF : OBUF
    port map (
      I => data_44_OBUF_362,
      O => data(44)
    );
  data_43_OBUF : OBUF
    port map (
      I => data_43_OBUF_363,
      O => data(43)
    );
  data_42_OBUF : OBUF
    port map (
      I => data_42_OBUF_364,
      O => data(42)
    );
  data_41_OBUF : OBUF
    port map (
      I => data_41_OBUF_365,
      O => data(41)
    );
  data_40_OBUF : OBUF
    port map (
      I => data_40_OBUF_366,
      O => data(40)
    );
  data_39_OBUF : OBUF
    port map (
      I => data_39_OBUF_367,
      O => data(39)
    );
  data_38_OBUF : OBUF
    port map (
      I => data_38_OBUF_368,
      O => data(38)
    );
  data_37_OBUF : OBUF
    port map (
      I => data_37_OBUF_369,
      O => data(37)
    );
  data_36_OBUF : OBUF
    port map (
      I => data_36_OBUF_370,
      O => data(36)
    );
  data_35_OBUF : OBUF
    port map (
      I => data_35_OBUF_371,
      O => data(35)
    );
  data_34_OBUF : OBUF
    port map (
      I => data_34_OBUF_372,
      O => data(34)
    );
  data_33_OBUF : OBUF
    port map (
      I => data_33_OBUF_373,
      O => data(33)
    );
  data_32_OBUF : OBUF
    port map (
      I => data_32_OBUF_374,
      O => data(32)
    );
  data_31_OBUF : OBUF
    port map (
      I => data_31_OBUF_375,
      O => data(31)
    );
  data_30_OBUF : OBUF
    port map (
      I => data_30_OBUF_376,
      O => data(30)
    );
  data_29_OBUF : OBUF
    port map (
      I => data_29_OBUF_377,
      O => data(29)
    );
  data_28_OBUF : OBUF
    port map (
      I => data_28_OBUF_378,
      O => data(28)
    );
  data_27_OBUF : OBUF
    port map (
      I => data_27_OBUF_379,
      O => data(27)
    );
  data_26_OBUF : OBUF
    port map (
      I => data_26_OBUF_380,
      O => data(26)
    );
  data_25_OBUF : OBUF
    port map (
      I => data_25_OBUF_381,
      O => data(25)
    );
  data_24_OBUF : OBUF
    port map (
      I => data_24_OBUF_382,
      O => data(24)
    );
  data_23_OBUF : OBUF
    port map (
      I => data_23_OBUF_383,
      O => data(23)
    );
  data_22_OBUF : OBUF
    port map (
      I => data_22_OBUF_384,
      O => data(22)
    );
  data_21_OBUF : OBUF
    port map (
      I => data_21_OBUF_385,
      O => data(21)
    );
  data_20_OBUF : OBUF
    port map (
      I => data_20_OBUF_386,
      O => data(20)
    );
  data_19_OBUF : OBUF
    port map (
      I => data_19_OBUF_387,
      O => data(19)
    );
  data_18_OBUF : OBUF
    port map (
      I => data_18_OBUF_388,
      O => data(18)
    );
  data_17_OBUF : OBUF
    port map (
      I => data_17_OBUF_389,
      O => data(17)
    );
  data_16_OBUF : OBUF
    port map (
      I => data_16_OBUF_390,
      O => data(16)
    );
  data_15_OBUF : OBUF
    port map (
      I => data_15_OBUF_391,
      O => data(15)
    );
  data_14_OBUF : OBUF
    port map (
      I => data_14_OBUF_392,
      O => data(14)
    );
  data_13_OBUF : OBUF
    port map (
      I => data_13_OBUF_393,
      O => data(13)
    );
  data_12_OBUF : OBUF
    port map (
      I => data_12_OBUF_394,
      O => data(12)
    );
  data_11_OBUF : OBUF
    port map (
      I => data_11_OBUF_395,
      O => data(11)
    );
  data_10_OBUF : OBUF
    port map (
      I => data_10_OBUF_396,
      O => data(10)
    );
  data_9_OBUF : OBUF
    port map (
      I => data_9_OBUF_397,
      O => data(9)
    );
  data_8_OBUF : OBUF
    port map (
      I => data_8_OBUF_398,
      O => data(8)
    );
  data_7_OBUF : OBUF
    port map (
      I => data_7_OBUF_399,
      O => data(7)
    );
  data_6_OBUF : OBUF
    port map (
      I => data_6_OBUF_400,
      O => data(6)
    );
  data_5_OBUF : OBUF
    port map (
      I => data_5_OBUF_401,
      O => data(5)
    );
  data_4_OBUF : OBUF
    port map (
      I => data_4_OBUF_402,
      O => data(4)
    );
  data_3_OBUF : OBUF
    port map (
      I => data_3_OBUF_403,
      O => data(3)
    );
  data_2_OBUF : OBUF
    port map (
      I => data_2_OBUF_404,
      O => data(2)
    );
  data_1_OBUF : OBUF
    port map (
      I => data_1_OBUF_405,
      O => data(1)
    );
  data_0_OBUF : OBUF
    port map (
      I => data_0_OBUF_406,
      O => data(0)
    );
  oreq_OBUF : OBUF
    port map (
      I => oreq_OBUF_407,
      O => oreq
    );
  clk_BUFGP : BUFGP
    port map (
      I => clk,
      O => clk_BUFGP_337
    );
  in_data_read_0_update_req_0_2 : BUF
    port map (
      I => update_req_0_IBUF_303,
      O => in_data_read_0_update_req_0_2_299
    );
  in_data_read_0_update_req_0_1 : BUF
    port map (
      I => update_req_0_IBUF_303,
      O => in_data_read_0_update_req_0_1_298
    );
  in_data_read_0_update_req_1_2 : BUF
    port map (
      I => update_req_1_IBUF_302,
      O => in_data_read_0_update_req_1_2_297
    );
  in_data_read_0_update_req_1_1 : BUF
    port map (
      I => update_req_1_IBUF_302,
      O => in_data_read_0_update_req_1_1_296
    );
  in_data_read_0_ProTx_1_fsm_fsm_state_glue_set_2 : LUT3
    generic map(
      INIT => X"0E"
    )
    port map (
      I0 => in_data_read_0_update_req_1_1_296,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_2_293,
      I2 => in_data_read_0_demux_ack_1_1_284,
      O => in_data_read_0_N3
    );
  in_data_read_0_ProTx_1_fsm_fsm_state_3 : FDR
    port map (
      C => clk_BUFGP_337,
      D => in_data_read_0_N3,
      R => reset_IBUF_338,
      Q => in_data_read_0_ProTx_1_fsm_fsm_state_3_295
    );
  in_data_read_0_ProTx_1_fsm_fsm_state_glue_set_1 : LUT3
    generic map(
      INIT => X"0E"
    )
    port map (
      I0 => in_data_read_0_update_req_1_1_296,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_209,
      I2 => in_data_read_0_demux_ack_1_1_284,
      O => in_data_read_0_N2
    );
  in_data_read_0_ProTx_1_fsm_fsm_state_2 : FDR
    port map (
      C => clk_BUFGP_337,
      D => in_data_read_0_N2,
      R => reset_IBUF_338,
      Q => in_data_read_0_ProTx_1_fsm_fsm_state_2_293
    );
  in_data_read_0_ProTx_0_fsm_fsm_state_glue_set_2 : LUT3
    generic map(
      INIT => X"0E"
    )
    port map (
      I0 => in_data_read_0_update_req_0_1_298,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_2_289,
      I2 => in_data_read_0_demux_ack_0_1_286,
      O => in_data_read_0_N1
    );
  in_data_read_0_ProTx_0_fsm_fsm_state_3 : FDR
    port map (
      C => clk_BUFGP_337,
      D => in_data_read_0_N1,
      R => reset_IBUF_338,
      Q => in_data_read_0_ProTx_0_fsm_fsm_state_3_291
    );
  in_data_read_0_ProTx_0_fsm_fsm_state_glue_set_1 : LUT3
    generic map(
      INIT => X"0E"
    )
    port map (
      I0 => in_data_read_0_update_req_0_1_298,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_208,
      I2 => in_data_read_0_demux_ack_0_1_286,
      O => in_data_read_0_N01
    );
  in_data_read_0_ProTx_0_fsm_fsm_state_2 : FDR
    port map (
      C => clk_BUFGP_337,
      D => in_data_read_0_N01,
      R => reset_IBUF_338,
      Q => in_data_read_0_ProTx_0_fsm_fsm_state_2_289
    );
  in_data_read_0_demux_ack_0_2 : BUF
    port map (
      I => in_data_read_0_write_enable(0),
      O => in_data_read_0_demux_ack_0_2_287
    );
  in_data_read_0_demux_ack_0_1 : BUF
    port map (
      I => in_data_read_0_write_enable(0),
      O => in_data_read_0_demux_ack_0_1_286
    );
  in_data_read_0_demux_ack_1_2 : BUF
    port map (
      I => in_data_read_0_write_enable(1),
      O => in_data_read_0_demux_ack_1_2_285
    );
  in_data_read_0_demux_ack_1_1 : BUF
    port map (
      I => in_data_read_0_write_enable(1),
      O => in_data_read_0_demux_ack_1_1_284
    );
  in_data_read_0_ProTx_0_fsm_fsm_state_1 : FDR
    port map (
      C => clk_BUFGP_337,
      D => in_data_read_0_ProTx_0_fsm_fsm_state_glue_set_216,
      R => reset_IBUF_338,
      Q => in_data_read_0_ProTx_0_fsm_fsm_state_1_283
    );
  in_data_read_0_ProTx_1_fsm_fsm_state_1 : FDR
    port map (
      C => clk_BUFGP_337,
      D => in_data_read_0_ProTx_1_fsm_fsm_state_glue_set_217,
      R => reset_IBUF_338,
      Q => in_data_read_0_ProTx_1_fsm_fsm_state_1_282
    );
  in_data_read_0_ProTx_1_fsm_data_reg_31_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_31_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_2_293,
      I2 => in_data_read_0_update_req_1_1_296,
      I3 => data_63_OBUF_343,
      O => in_data_read_0_ProTx_1_fsm_data_reg_31_dpot_281
    );
  in_data_read_0_ProTx_1_fsm_data_reg_30_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_30_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_2_293,
      I2 => in_data_read_0_update_req_1_1_296,
      I3 => data_62_OBUF_344,
      O => in_data_read_0_ProTx_1_fsm_data_reg_30_dpot_280
    );
  in_data_read_0_ProTx_1_fsm_data_reg_29_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_29_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_3_295,
      I2 => in_data_read_0_update_req_1_2_297,
      I3 => data_61_OBUF_345,
      O => in_data_read_0_ProTx_1_fsm_data_reg_29_dpot_279
    );
  in_data_read_0_ProTx_1_fsm_data_reg_28_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_28_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_3_295,
      I2 => in_data_read_0_update_req_1_2_297,
      I3 => data_60_OBUF_346,
      O => in_data_read_0_ProTx_1_fsm_data_reg_28_dpot_278
    );
  in_data_read_0_ProTx_1_fsm_data_reg_27_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_27_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_3_295,
      I2 => in_data_read_0_update_req_1_2_297,
      I3 => data_59_OBUF_347,
      O => in_data_read_0_ProTx_1_fsm_data_reg_27_dpot_277
    );
  in_data_read_0_ProTx_1_fsm_data_reg_26_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_26_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_3_295,
      I2 => in_data_read_0_update_req_1_2_297,
      I3 => data_58_OBUF_348,
      O => in_data_read_0_ProTx_1_fsm_data_reg_26_dpot_276
    );
  in_data_read_0_ProTx_1_fsm_data_reg_25_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_25_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_3_295,
      I2 => in_data_read_0_update_req_1_2_297,
      I3 => data_57_OBUF_349,
      O => in_data_read_0_ProTx_1_fsm_data_reg_25_dpot_275
    );
  in_data_read_0_ProTx_1_fsm_data_reg_24_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_24_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_3_295,
      I2 => in_data_read_0_update_req_1_2_297,
      I3 => data_56_OBUF_350,
      O => in_data_read_0_ProTx_1_fsm_data_reg_24_dpot_274
    );
  in_data_read_0_ProTx_1_fsm_data_reg_23_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_23_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_3_295,
      I2 => in_data_read_0_update_req_1_2_297,
      I3 => data_55_OBUF_351,
      O => in_data_read_0_ProTx_1_fsm_data_reg_23_dpot_273
    );
  in_data_read_0_ProTx_1_fsm_data_reg_22_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_22_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_3_295,
      I2 => in_data_read_0_update_req_1_2_297,
      I3 => data_54_OBUF_352,
      O => in_data_read_0_ProTx_1_fsm_data_reg_22_dpot_272
    );
  in_data_read_0_ProTx_1_fsm_data_reg_21_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_21_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_3_295,
      I2 => in_data_read_0_update_req_1_2_297,
      I3 => data_53_OBUF_353,
      O => in_data_read_0_ProTx_1_fsm_data_reg_21_dpot_271
    );
  in_data_read_0_ProTx_1_fsm_data_reg_20_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_20_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_3_295,
      I2 => in_data_read_0_update_req_1_2_297,
      I3 => data_52_OBUF_354,
      O => in_data_read_0_ProTx_1_fsm_data_reg_20_dpot_270
    );
  in_data_read_0_ProTx_1_fsm_data_reg_19_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_19_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_209,
      I2 => in_data_read_0_update_req_1_2_297,
      I3 => data_51_OBUF_355,
      O => in_data_read_0_ProTx_1_fsm_data_reg_19_dpot_269
    );
  in_data_read_0_ProTx_1_fsm_data_reg_18_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_18_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_209,
      I2 => in_data_read_0_update_req_1_2_297,
      I3 => data_50_OBUF_356,
      O => in_data_read_0_ProTx_1_fsm_data_reg_18_dpot_268
    );
  in_data_read_0_ProTx_1_fsm_data_reg_17_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_17_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_209,
      I2 => update_req_1_IBUF_302,
      I3 => data_49_OBUF_357,
      O => in_data_read_0_ProTx_1_fsm_data_reg_17_dpot_267
    );
  in_data_read_0_ProTx_1_fsm_data_reg_16_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_16_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_209,
      I2 => update_req_1_IBUF_302,
      I3 => data_48_OBUF_358,
      O => in_data_read_0_ProTx_1_fsm_data_reg_16_dpot_266
    );
  in_data_read_0_ProTx_1_fsm_data_reg_15_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_15_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_209,
      I2 => update_req_1_IBUF_302,
      I3 => data_47_OBUF_359,
      O => in_data_read_0_ProTx_1_fsm_data_reg_15_dpot_265
    );
  in_data_read_0_ProTx_1_fsm_data_reg_14_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_14_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_209,
      I2 => update_req_1_IBUF_302,
      I3 => data_46_OBUF_360,
      O => in_data_read_0_ProTx_1_fsm_data_reg_14_dpot_264
    );
  in_data_read_0_ProTx_1_fsm_data_reg_13_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_13_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_209,
      I2 => update_req_1_IBUF_302,
      I3 => data_45_OBUF_361,
      O => in_data_read_0_ProTx_1_fsm_data_reg_13_dpot_263
    );
  in_data_read_0_ProTx_1_fsm_data_reg_12_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_12_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_209,
      I2 => update_req_1_IBUF_302,
      I3 => data_44_OBUF_362,
      O => in_data_read_0_ProTx_1_fsm_data_reg_12_dpot_262
    );
  in_data_read_0_ProTx_1_fsm_data_reg_11_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_11_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_209,
      I2 => update_req_1_IBUF_302,
      I3 => data_43_OBUF_363,
      O => in_data_read_0_ProTx_1_fsm_data_reg_11_dpot_261
    );
  in_data_read_0_ProTx_1_fsm_data_reg_10_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_10_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_209,
      I2 => update_req_1_IBUF_302,
      I3 => data_42_OBUF_364,
      O => in_data_read_0_ProTx_1_fsm_data_reg_10_dpot_260
    );
  in_data_read_0_ProTx_1_fsm_data_reg_9_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_41_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_2_293,
      I2 => in_data_read_0_update_req_1_1_296,
      I3 => data_41_OBUF_365,
      O => in_data_read_0_ProTx_1_fsm_data_reg_9_dpot_259
    );
  in_data_read_0_ProTx_1_fsm_data_reg_8_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_40_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_2_293,
      I2 => in_data_read_0_update_req_1_1_296,
      I3 => data_40_OBUF_366,
      O => in_data_read_0_ProTx_1_fsm_data_reg_8_dpot_258
    );
  in_data_read_0_ProTx_1_fsm_data_reg_7_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_39_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_2_293,
      I2 => in_data_read_0_update_req_1_1_296,
      I3 => data_39_OBUF_367,
      O => in_data_read_0_ProTx_1_fsm_data_reg_7_dpot_257
    );
  in_data_read_0_ProTx_1_fsm_data_reg_6_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_38_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_2_293,
      I2 => in_data_read_0_update_req_1_1_296,
      I3 => data_38_OBUF_368,
      O => in_data_read_0_ProTx_1_fsm_data_reg_6_dpot_256
    );
  in_data_read_0_ProTx_1_fsm_data_reg_5_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_37_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_2_293,
      I2 => in_data_read_0_update_req_1_1_296,
      I3 => data_37_OBUF_369,
      O => in_data_read_0_ProTx_1_fsm_data_reg_5_dpot_255
    );
  in_data_read_0_ProTx_1_fsm_data_reg_4_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_36_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_2_293,
      I2 => in_data_read_0_update_req_1_1_296,
      I3 => data_36_OBUF_370,
      O => in_data_read_0_ProTx_1_fsm_data_reg_4_dpot_254
    );
  in_data_read_0_ProTx_1_fsm_data_reg_3_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_35_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_2_293,
      I2 => in_data_read_0_update_req_1_1_296,
      I3 => data_35_OBUF_371,
      O => in_data_read_0_ProTx_1_fsm_data_reg_3_dpot_253
    );
  in_data_read_0_ProTx_1_fsm_data_reg_2_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_2_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_3_295,
      I2 => in_data_read_0_update_req_1_1_296,
      I3 => data_34_OBUF_372,
      O => in_data_read_0_ProTx_1_fsm_data_reg_2_dpot_252
    );
  in_data_read_0_ProTx_1_fsm_data_reg_1_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_1_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_209,
      I2 => in_data_read_0_update_req_1_2_297,
      I3 => data_33_OBUF_373,
      O => in_data_read_0_ProTx_1_fsm_data_reg_1_dpot_251
    );
  in_data_read_0_ProTx_1_fsm_data_reg_0_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_0_Q,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_209,
      I2 => update_req_1_IBUF_302,
      I3 => data_32_OBUF_374,
      O => in_data_read_0_ProTx_1_fsm_data_reg_0_dpot_250
    );
  in_data_read_0_ProTx_0_fsm_data_reg_31_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_31_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_2_289,
      I2 => in_data_read_0_update_req_0_1_298,
      I3 => data_31_OBUF_375,
      O => in_data_read_0_ProTx_0_fsm_data_reg_31_dpot_249
    );
  in_data_read_0_ProTx_0_fsm_data_reg_30_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_30_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_2_289,
      I2 => in_data_read_0_update_req_0_1_298,
      I3 => data_30_OBUF_376,
      O => in_data_read_0_ProTx_0_fsm_data_reg_30_dpot_248
    );
  in_data_read_0_ProTx_0_fsm_data_reg_29_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_29_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_3_291,
      I2 => in_data_read_0_update_req_0_2_299,
      I3 => data_29_OBUF_377,
      O => in_data_read_0_ProTx_0_fsm_data_reg_29_dpot_247
    );
  in_data_read_0_ProTx_0_fsm_data_reg_28_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_28_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_3_291,
      I2 => in_data_read_0_update_req_0_2_299,
      I3 => data_28_OBUF_378,
      O => in_data_read_0_ProTx_0_fsm_data_reg_28_dpot_246
    );
  in_data_read_0_ProTx_0_fsm_data_reg_27_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_27_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_3_291,
      I2 => in_data_read_0_update_req_0_2_299,
      I3 => data_27_OBUF_379,
      O => in_data_read_0_ProTx_0_fsm_data_reg_27_dpot_245
    );
  in_data_read_0_ProTx_0_fsm_data_reg_26_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_26_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_3_291,
      I2 => in_data_read_0_update_req_0_2_299,
      I3 => data_26_OBUF_380,
      O => in_data_read_0_ProTx_0_fsm_data_reg_26_dpot_244
    );
  in_data_read_0_ProTx_0_fsm_data_reg_25_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_25_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_3_291,
      I2 => in_data_read_0_update_req_0_2_299,
      I3 => data_25_OBUF_381,
      O => in_data_read_0_ProTx_0_fsm_data_reg_25_dpot_243
    );
  in_data_read_0_ProTx_0_fsm_data_reg_24_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_24_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_3_291,
      I2 => in_data_read_0_update_req_0_2_299,
      I3 => data_24_OBUF_382,
      O => in_data_read_0_ProTx_0_fsm_data_reg_24_dpot_242
    );
  in_data_read_0_ProTx_0_fsm_data_reg_23_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_23_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_3_291,
      I2 => in_data_read_0_update_req_0_2_299,
      I3 => data_23_OBUF_383,
      O => in_data_read_0_ProTx_0_fsm_data_reg_23_dpot_241
    );
  in_data_read_0_ProTx_0_fsm_data_reg_22_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_22_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_3_291,
      I2 => in_data_read_0_update_req_0_2_299,
      I3 => data_22_OBUF_384,
      O => in_data_read_0_ProTx_0_fsm_data_reg_22_dpot_240
    );
  in_data_read_0_ProTx_0_fsm_data_reg_21_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_21_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_3_291,
      I2 => in_data_read_0_update_req_0_2_299,
      I3 => data_21_OBUF_385,
      O => in_data_read_0_ProTx_0_fsm_data_reg_21_dpot_239
    );
  in_data_read_0_ProTx_0_fsm_data_reg_20_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_20_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_3_291,
      I2 => in_data_read_0_update_req_0_2_299,
      I3 => data_20_OBUF_386,
      O => in_data_read_0_ProTx_0_fsm_data_reg_20_dpot_238
    );
  in_data_read_0_ProTx_0_fsm_data_reg_19_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_19_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_208,
      I2 => in_data_read_0_update_req_0_2_299,
      I3 => data_19_OBUF_387,
      O => in_data_read_0_ProTx_0_fsm_data_reg_19_dpot_237
    );
  in_data_read_0_ProTx_0_fsm_data_reg_18_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_18_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_208,
      I2 => in_data_read_0_update_req_0_2_299,
      I3 => data_18_OBUF_388,
      O => in_data_read_0_ProTx_0_fsm_data_reg_18_dpot_236
    );
  in_data_read_0_ProTx_0_fsm_data_reg_17_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_17_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_208,
      I2 => update_req_0_IBUF_303,
      I3 => data_17_OBUF_389,
      O => in_data_read_0_ProTx_0_fsm_data_reg_17_dpot_235
    );
  in_data_read_0_ProTx_0_fsm_data_reg_16_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_16_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_208,
      I2 => update_req_0_IBUF_303,
      I3 => data_16_OBUF_390,
      O => in_data_read_0_ProTx_0_fsm_data_reg_16_dpot_234
    );
  in_data_read_0_ProTx_0_fsm_data_reg_15_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_15_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_208,
      I2 => update_req_0_IBUF_303,
      I3 => data_15_OBUF_391,
      O => in_data_read_0_ProTx_0_fsm_data_reg_15_dpot_233
    );
  in_data_read_0_ProTx_0_fsm_data_reg_14_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_14_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_208,
      I2 => update_req_0_IBUF_303,
      I3 => data_14_OBUF_392,
      O => in_data_read_0_ProTx_0_fsm_data_reg_14_dpot_232
    );
  in_data_read_0_ProTx_0_fsm_data_reg_13_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_13_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_208,
      I2 => update_req_0_IBUF_303,
      I3 => data_13_OBUF_393,
      O => in_data_read_0_ProTx_0_fsm_data_reg_13_dpot_231
    );
  in_data_read_0_ProTx_0_fsm_data_reg_12_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_12_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_208,
      I2 => update_req_0_IBUF_303,
      I3 => data_12_OBUF_394,
      O => in_data_read_0_ProTx_0_fsm_data_reg_12_dpot_230
    );
  in_data_read_0_ProTx_0_fsm_data_reg_11_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_11_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_208,
      I2 => update_req_0_IBUF_303,
      I3 => data_11_OBUF_395,
      O => in_data_read_0_ProTx_0_fsm_data_reg_11_dpot_229
    );
  in_data_read_0_ProTx_0_fsm_data_reg_10_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_10_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_208,
      I2 => update_req_0_IBUF_303,
      I3 => data_10_OBUF_396,
      O => in_data_read_0_ProTx_0_fsm_data_reg_10_dpot_228
    );
  in_data_read_0_ProTx_0_fsm_data_reg_9_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_41_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_2_289,
      I2 => in_data_read_0_update_req_0_1_298,
      I3 => data_9_OBUF_397,
      O => in_data_read_0_ProTx_0_fsm_data_reg_9_dpot_227
    );
  in_data_read_0_ProTx_0_fsm_data_reg_8_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_40_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_2_289,
      I2 => in_data_read_0_update_req_0_1_298,
      I3 => data_8_OBUF_398,
      O => in_data_read_0_ProTx_0_fsm_data_reg_8_dpot_226
    );
  in_data_read_0_ProTx_0_fsm_data_reg_7_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_39_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_2_289,
      I2 => in_data_read_0_update_req_0_1_298,
      I3 => data_7_OBUF_399,
      O => in_data_read_0_ProTx_0_fsm_data_reg_7_dpot_225
    );
  in_data_read_0_ProTx_0_fsm_data_reg_6_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_38_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_2_289,
      I2 => in_data_read_0_update_req_0_1_298,
      I3 => data_6_OBUF_400,
      O => in_data_read_0_ProTx_0_fsm_data_reg_6_dpot_224
    );
  in_data_read_0_ProTx_0_fsm_data_reg_5_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_37_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_2_289,
      I2 => in_data_read_0_update_req_0_1_298,
      I3 => data_5_OBUF_401,
      O => in_data_read_0_ProTx_0_fsm_data_reg_5_dpot_223
    );
  in_data_read_0_ProTx_0_fsm_data_reg_4_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_36_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_2_289,
      I2 => in_data_read_0_update_req_0_1_298,
      I3 => data_4_OBUF_402,
      O => in_data_read_0_ProTx_0_fsm_data_reg_4_dpot_222
    );
  in_data_read_0_ProTx_0_fsm_data_reg_3_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_35_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_2_289,
      I2 => in_data_read_0_update_req_0_1_298,
      I3 => data_3_OBUF_403,
      O => in_data_read_0_ProTx_0_fsm_data_reg_3_dpot_221
    );
  in_data_read_0_ProTx_0_fsm_data_reg_2_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_2_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_3_291,
      I2 => in_data_read_0_update_req_0_1_298,
      I3 => data_2_OBUF_404,
      O => in_data_read_0_ProTx_0_fsm_data_reg_2_dpot_220
    );
  in_data_read_0_ProTx_0_fsm_data_reg_1_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_1_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_208,
      I2 => in_data_read_0_update_req_0_2_299,
      I3 => data_1_OBUF_405,
      O => in_data_read_0_ProTx_0_fsm_data_reg_1_dpot_219
    );
  in_data_read_0_ProTx_0_fsm_data_reg_0_dpot : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => in_data_read_0_demux_data_0_Q,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_208,
      I2 => update_req_0_IBUF_303,
      I3 => data_0_OBUF_406,
      O => in_data_read_0_ProTx_0_fsm_data_reg_0_dpot_218
    );
  in_data_read_0_Mmux_ProTx_1_fsm_latch_v11 : LUT3
    generic map(
      INIT => X"E0"
    )
    port map (
      I0 => update_req_1_IBUF_302,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_2_293,
      I2 => in_data_read_0_demux_ack_1_1_284,
      O => in_data_read_0_ProTx_1_fsm_latch_v
    );
  in_data_read_0_Mmux_ProTx_0_fsm_latch_v11 : LUT3
    generic map(
      INIT => X"E0"
    )
    port map (
      I0 => update_req_0_IBUF_303,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_2_289,
      I2 => in_data_read_0_demux_ack_0_1_286,
      O => in_data_read_0_ProTx_0_fsm_latch_v
    );
  in_data_read_0_ProTx_1_fsm_fsm_state_glue_set : LUT3
    generic map(
      INIT => X"0E"
    )
    port map (
      I0 => in_data_read_0_update_req_1_1_296,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_2_293,
      I2 => in_data_read_0_demux_ack_1_1_284,
      O => in_data_read_0_ProTx_1_fsm_fsm_state_glue_set_217
    );
  in_data_read_0_ProTx_0_fsm_fsm_state_glue_set : LUT3
    generic map(
      INIT => X"0E"
    )
    port map (
      I0 => in_data_read_0_update_req_0_1_298,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_2_289,
      I2 => in_data_read_0_demux_ack_0_1_286,
      O => in_data_read_0_ProTx_0_fsm_fsm_state_glue_set_216
    );
  in_data_read_0_ProTx_1_fsm_fsm_state : FDR
    port map (
      C => clk_BUFGP_337,
      D => in_data_read_0_ProTx_1_fsm_fsm_state_glue_set_217,
      R => reset_IBUF_338,
      Q => in_data_read_0_ProTx_1_fsm_fsm_state_209
    );
  in_data_read_0_ProTx_0_fsm_fsm_state : FDR
    port map (
      C => clk_BUFGP_337,
      D => in_data_read_0_ProTx_0_fsm_fsm_state_glue_set_216,
      R => reset_IBUF_338,
      Q => in_data_read_0_ProTx_0_fsm_fsm_state_208
    );
  in_data_read_0_Mmux_ProTx_1_fsm_has_room_v11 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => update_req_1_IBUF_302,
      I1 => in_data_read_0_ProTx_1_fsm_fsm_state_1_282,
      O => in_data_read_0_ProTx_1_fsm_has_room_v
    );
  in_data_read_0_Mmux_ProTx_0_fsm_has_room_v11 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => update_req_0_IBUF_303,
      I1 => in_data_read_0_ProTx_0_fsm_fsm_state_1_283,
      O => in_data_read_0_ProTx_0_fsm_has_room_v
    );
  in_data_read_0_update_ack_1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_337,
      D => in_data_read_0_ProTx_1_fsm_latch_v,
      R => reset_IBUF_338,
      Q => update_ack_1_OBUF_342
    );
  in_data_read_0_update_ack_0 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_337,
      D => in_data_read_0_ProTx_0_fsm_latch_v,
      R => reset_IBUF_338,
      Q => update_ack_0_OBUF_341
    );
  in_data_read_0_ProTx_1_fsm_data_reg_31 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_1_1_284,
      D => in_data_read_0_ProTx_1_fsm_data_reg_31_dpot_281,
      Q => data_63_OBUF_343
    );
  in_data_read_0_ProTx_1_fsm_data_reg_30 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_1_1_284,
      D => in_data_read_0_ProTx_1_fsm_data_reg_30_dpot_280,
      Q => data_62_OBUF_344
    );
  in_data_read_0_ProTx_1_fsm_data_reg_29 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_1_1_284,
      D => in_data_read_0_ProTx_1_fsm_data_reg_29_dpot_279,
      Q => data_61_OBUF_345
    );
  in_data_read_0_ProTx_1_fsm_data_reg_28 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_1_2_285,
      D => in_data_read_0_ProTx_1_fsm_data_reg_28_dpot_278,
      Q => data_60_OBUF_346
    );
  in_data_read_0_ProTx_1_fsm_data_reg_27 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_1_2_285,
      D => in_data_read_0_ProTx_1_fsm_data_reg_27_dpot_277,
      Q => data_59_OBUF_347
    );
  in_data_read_0_ProTx_1_fsm_data_reg_26 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_1_2_285,
      D => in_data_read_0_ProTx_1_fsm_data_reg_26_dpot_276,
      Q => data_58_OBUF_348
    );
  in_data_read_0_ProTx_1_fsm_data_reg_25 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_1_2_285,
      D => in_data_read_0_ProTx_1_fsm_data_reg_25_dpot_275,
      Q => data_57_OBUF_349
    );
  in_data_read_0_ProTx_1_fsm_data_reg_24 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_1_2_285,
      D => in_data_read_0_ProTx_1_fsm_data_reg_24_dpot_274,
      Q => data_56_OBUF_350
    );
  in_data_read_0_ProTx_1_fsm_data_reg_23 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_1_2_285,
      D => in_data_read_0_ProTx_1_fsm_data_reg_23_dpot_273,
      Q => data_55_OBUF_351
    );
  in_data_read_0_ProTx_1_fsm_data_reg_22 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_1_2_285,
      D => in_data_read_0_ProTx_1_fsm_data_reg_22_dpot_272,
      Q => data_54_OBUF_352
    );
  in_data_read_0_ProTx_1_fsm_data_reg_21 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_1_2_285,
      D => in_data_read_0_ProTx_1_fsm_data_reg_21_dpot_271,
      Q => data_53_OBUF_353
    );
  in_data_read_0_ProTx_1_fsm_data_reg_20 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_1_2_285,
      D => in_data_read_0_ProTx_1_fsm_data_reg_20_dpot_270,
      Q => data_52_OBUF_354
    );
  in_data_read_0_ProTx_1_fsm_data_reg_19 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_1_2_285,
      D => in_data_read_0_ProTx_1_fsm_data_reg_19_dpot_269,
      Q => data_51_OBUF_355
    );
  in_data_read_0_ProTx_1_fsm_data_reg_18 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_1_2_285,
      D => in_data_read_0_ProTx_1_fsm_data_reg_18_dpot_268,
      Q => data_50_OBUF_356
    );
  in_data_read_0_ProTx_1_fsm_data_reg_17 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_write_enable(1),
      D => in_data_read_0_ProTx_1_fsm_data_reg_17_dpot_267,
      Q => data_49_OBUF_357
    );
  in_data_read_0_ProTx_1_fsm_data_reg_16 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_write_enable(1),
      D => in_data_read_0_ProTx_1_fsm_data_reg_16_dpot_266,
      Q => data_48_OBUF_358
    );
  in_data_read_0_ProTx_1_fsm_data_reg_15 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_write_enable(1),
      D => in_data_read_0_ProTx_1_fsm_data_reg_15_dpot_265,
      Q => data_47_OBUF_359
    );
  in_data_read_0_ProTx_1_fsm_data_reg_14 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_write_enable(1),
      D => in_data_read_0_ProTx_1_fsm_data_reg_14_dpot_264,
      Q => data_46_OBUF_360
    );
  in_data_read_0_ProTx_1_fsm_data_reg_13 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_write_enable(1),
      D => in_data_read_0_ProTx_1_fsm_data_reg_13_dpot_263,
      Q => data_45_OBUF_361
    );
  in_data_read_0_ProTx_1_fsm_data_reg_12 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_write_enable(1),
      D => in_data_read_0_ProTx_1_fsm_data_reg_12_dpot_262,
      Q => data_44_OBUF_362
    );
  in_data_read_0_ProTx_1_fsm_data_reg_11 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_write_enable(1),
      D => in_data_read_0_ProTx_1_fsm_data_reg_11_dpot_261,
      Q => data_43_OBUF_363
    );
  in_data_read_0_ProTx_1_fsm_data_reg_10 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_write_enable(1),
      D => in_data_read_0_ProTx_1_fsm_data_reg_10_dpot_260,
      Q => data_42_OBUF_364
    );
  in_data_read_0_ProTx_1_fsm_data_reg_9 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_1_1_284,
      D => in_data_read_0_ProTx_1_fsm_data_reg_9_dpot_259,
      Q => data_41_OBUF_365
    );
  in_data_read_0_ProTx_1_fsm_data_reg_8 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_1_1_284,
      D => in_data_read_0_ProTx_1_fsm_data_reg_8_dpot_258,
      Q => data_40_OBUF_366
    );
  in_data_read_0_ProTx_1_fsm_data_reg_7 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_1_1_284,
      D => in_data_read_0_ProTx_1_fsm_data_reg_7_dpot_257,
      Q => data_39_OBUF_367
    );
  in_data_read_0_ProTx_1_fsm_data_reg_6 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_1_1_284,
      D => in_data_read_0_ProTx_1_fsm_data_reg_6_dpot_256,
      Q => data_38_OBUF_368
    );
  in_data_read_0_ProTx_1_fsm_data_reg_5 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_1_1_284,
      D => in_data_read_0_ProTx_1_fsm_data_reg_5_dpot_255,
      Q => data_37_OBUF_369
    );
  in_data_read_0_ProTx_1_fsm_data_reg_4 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_1_1_284,
      D => in_data_read_0_ProTx_1_fsm_data_reg_4_dpot_254,
      Q => data_36_OBUF_370
    );
  in_data_read_0_ProTx_1_fsm_data_reg_3 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_1_1_284,
      D => in_data_read_0_ProTx_1_fsm_data_reg_3_dpot_253,
      Q => data_35_OBUF_371
    );
  in_data_read_0_ProTx_1_fsm_data_reg_2 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_1_2_285,
      D => in_data_read_0_ProTx_1_fsm_data_reg_2_dpot_252,
      Q => data_34_OBUF_372
    );
  in_data_read_0_ProTx_1_fsm_data_reg_1 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_write_enable(1),
      D => in_data_read_0_ProTx_1_fsm_data_reg_1_dpot_251,
      Q => data_33_OBUF_373
    );
  in_data_read_0_ProTx_1_fsm_data_reg_0 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_write_enable(1),
      D => in_data_read_0_ProTx_1_fsm_data_reg_0_dpot_250,
      Q => data_32_OBUF_374
    );
  in_data_read_0_ProTx_0_fsm_data_reg_31 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_0_1_286,
      D => in_data_read_0_ProTx_0_fsm_data_reg_31_dpot_249,
      Q => data_31_OBUF_375
    );
  in_data_read_0_ProTx_0_fsm_data_reg_30 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_0_1_286,
      D => in_data_read_0_ProTx_0_fsm_data_reg_30_dpot_248,
      Q => data_30_OBUF_376
    );
  in_data_read_0_ProTx_0_fsm_data_reg_29 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_0_1_286,
      D => in_data_read_0_ProTx_0_fsm_data_reg_29_dpot_247,
      Q => data_29_OBUF_377
    );
  in_data_read_0_ProTx_0_fsm_data_reg_28 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_0_2_287,
      D => in_data_read_0_ProTx_0_fsm_data_reg_28_dpot_246,
      Q => data_28_OBUF_378
    );
  in_data_read_0_ProTx_0_fsm_data_reg_27 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_0_2_287,
      D => in_data_read_0_ProTx_0_fsm_data_reg_27_dpot_245,
      Q => data_27_OBUF_379
    );
  in_data_read_0_ProTx_0_fsm_data_reg_26 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_0_2_287,
      D => in_data_read_0_ProTx_0_fsm_data_reg_26_dpot_244,
      Q => data_26_OBUF_380
    );
  in_data_read_0_ProTx_0_fsm_data_reg_25 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_0_2_287,
      D => in_data_read_0_ProTx_0_fsm_data_reg_25_dpot_243,
      Q => data_25_OBUF_381
    );
  in_data_read_0_ProTx_0_fsm_data_reg_24 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_0_2_287,
      D => in_data_read_0_ProTx_0_fsm_data_reg_24_dpot_242,
      Q => data_24_OBUF_382
    );
  in_data_read_0_ProTx_0_fsm_data_reg_23 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_0_2_287,
      D => in_data_read_0_ProTx_0_fsm_data_reg_23_dpot_241,
      Q => data_23_OBUF_383
    );
  in_data_read_0_ProTx_0_fsm_data_reg_22 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_0_2_287,
      D => in_data_read_0_ProTx_0_fsm_data_reg_22_dpot_240,
      Q => data_22_OBUF_384
    );
  in_data_read_0_ProTx_0_fsm_data_reg_21 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_0_2_287,
      D => in_data_read_0_ProTx_0_fsm_data_reg_21_dpot_239,
      Q => data_21_OBUF_385
    );
  in_data_read_0_ProTx_0_fsm_data_reg_20 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_0_2_287,
      D => in_data_read_0_ProTx_0_fsm_data_reg_20_dpot_238,
      Q => data_20_OBUF_386
    );
  in_data_read_0_ProTx_0_fsm_data_reg_19 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_0_2_287,
      D => in_data_read_0_ProTx_0_fsm_data_reg_19_dpot_237,
      Q => data_19_OBUF_387
    );
  in_data_read_0_ProTx_0_fsm_data_reg_18 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_0_2_287,
      D => in_data_read_0_ProTx_0_fsm_data_reg_18_dpot_236,
      Q => data_18_OBUF_388
    );
  in_data_read_0_ProTx_0_fsm_data_reg_17 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_write_enable(0),
      D => in_data_read_0_ProTx_0_fsm_data_reg_17_dpot_235,
      Q => data_17_OBUF_389
    );
  in_data_read_0_ProTx_0_fsm_data_reg_16 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_write_enable(0),
      D => in_data_read_0_ProTx_0_fsm_data_reg_16_dpot_234,
      Q => data_16_OBUF_390
    );
  in_data_read_0_ProTx_0_fsm_data_reg_15 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_write_enable(0),
      D => in_data_read_0_ProTx_0_fsm_data_reg_15_dpot_233,
      Q => data_15_OBUF_391
    );
  in_data_read_0_ProTx_0_fsm_data_reg_14 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_write_enable(0),
      D => in_data_read_0_ProTx_0_fsm_data_reg_14_dpot_232,
      Q => data_14_OBUF_392
    );
  in_data_read_0_ProTx_0_fsm_data_reg_13 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_write_enable(0),
      D => in_data_read_0_ProTx_0_fsm_data_reg_13_dpot_231,
      Q => data_13_OBUF_393
    );
  in_data_read_0_ProTx_0_fsm_data_reg_12 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_write_enable(0),
      D => in_data_read_0_ProTx_0_fsm_data_reg_12_dpot_230,
      Q => data_12_OBUF_394
    );
  in_data_read_0_ProTx_0_fsm_data_reg_11 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_write_enable(0),
      D => in_data_read_0_ProTx_0_fsm_data_reg_11_dpot_229,
      Q => data_11_OBUF_395
    );
  in_data_read_0_ProTx_0_fsm_data_reg_10 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_write_enable(0),
      D => in_data_read_0_ProTx_0_fsm_data_reg_10_dpot_228,
      Q => data_10_OBUF_396
    );
  in_data_read_0_ProTx_0_fsm_data_reg_9 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_0_1_286,
      D => in_data_read_0_ProTx_0_fsm_data_reg_9_dpot_227,
      Q => data_9_OBUF_397
    );
  in_data_read_0_ProTx_0_fsm_data_reg_8 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_0_1_286,
      D => in_data_read_0_ProTx_0_fsm_data_reg_8_dpot_226,
      Q => data_8_OBUF_398
    );
  in_data_read_0_ProTx_0_fsm_data_reg_7 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_0_1_286,
      D => in_data_read_0_ProTx_0_fsm_data_reg_7_dpot_225,
      Q => data_7_OBUF_399
    );
  in_data_read_0_ProTx_0_fsm_data_reg_6 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_0_1_286,
      D => in_data_read_0_ProTx_0_fsm_data_reg_6_dpot_224,
      Q => data_6_OBUF_400
    );
  in_data_read_0_ProTx_0_fsm_data_reg_5 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_0_1_286,
      D => in_data_read_0_ProTx_0_fsm_data_reg_5_dpot_223,
      Q => data_5_OBUF_401
    );
  in_data_read_0_ProTx_0_fsm_data_reg_4 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_0_1_286,
      D => in_data_read_0_ProTx_0_fsm_data_reg_4_dpot_222,
      Q => data_4_OBUF_402
    );
  in_data_read_0_ProTx_0_fsm_data_reg_3 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_0_1_286,
      D => in_data_read_0_ProTx_0_fsm_data_reg_3_dpot_221,
      Q => data_3_OBUF_403
    );
  in_data_read_0_ProTx_0_fsm_data_reg_2 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_demux_ack_0_2_287,
      D => in_data_read_0_ProTx_0_fsm_data_reg_2_dpot_220,
      Q => data_2_OBUF_404
    );
  in_data_read_0_ProTx_0_fsm_data_reg_1 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_write_enable(0),
      D => in_data_read_0_ProTx_0_fsm_data_reg_1_dpot_219,
      Q => data_1_OBUF_405
    );
  in_data_read_0_ProTx_0_fsm_data_reg_0 : FDE
    port map (
      C => clk_BUFGP_337,
      CE => in_data_read_0_write_enable(0),
      D => in_data_read_0_ProTx_0_fsm_data_reg_0_dpot_218,
      Q => data_0_OBUF_406
    );
  in_data_read_0_demux_req_1_req_0_OR_2_o1 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => in_data_read_0_ProTx_1_fsm_has_room_v,
      I1 => in_data_read_0_ProTx_0_fsm_has_room_v,
      O => oreq_OBUF_407
    );
  in_data_read_0_demux_ack_sig_0_1 : LUT3
    generic map(
      INIT => X"20"
    )
    port map (
      I0 => oack_IBUF_336,
      I1 => in_data_read_0_ProTx_1_fsm_has_room_v,
      I2 => in_data_read_0_ProTx_0_fsm_has_room_v,
      O => in_data_read_0_write_enable(0)
    );
  in_data_read_0_demux_ack_sig_1_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => oack_IBUF_336,
      I1 => in_data_read_0_ProTx_1_fsm_has_room_v,
      O => in_data_read_0_write_enable(1)
    );

end STRUCTURE;

