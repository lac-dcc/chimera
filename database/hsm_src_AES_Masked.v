// This program was cloned from: https://github.com/HEP-Alliance/hsm
// License: Apache License 2.0

// Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
// Component : AES_Masked
// Git hash  : 5cce78be5853121014ee0fda94b17934c8ad31d9

`timescale 1ns/1ps 

module AES_Masked (
  input               io_clk,
  input               io_reset,
  input               io_enable,
  input               io_pt1_valid,
  output reg          io_pt1_ready,
  input      [31:0]   io_pt1_payload,
  input               io_pt2_valid,
  output reg          io_pt2_ready,
  input      [31:0]   io_pt2_payload,
  input               io_key1_valid,
  output reg          io_key1_ready,
  input      [31:0]   io_key1_payload,
  input               io_key2_valid,
  output reg          io_key2_ready,
  input      [31:0]   io_key2_payload,
  input      [27:0]   io_m,
  output reg          io_ct1_valid,
  input               io_ct1_ready,
  output reg [31:0]   io_ct1_payload,
  output reg          io_ct2_valid,
  input               io_ct2_ready,
  output reg [31:0]   io_ct2_payload,
  output reg          io_done
);
  localparam States2_sIdle = 2'd0;
  localparam States2_sInit = 2'd1;
  localparam States2_sRound = 2'd2;
  localparam States2_sDone = 2'd3;

  reg        [7:0]    r_sbox_io_sbIn0;
  reg        [7:0]    r_sbox_io_sbIn1;
  wire       [7:0]    r_addroundkey1_io_b;
  wire       [7:0]    r_addroundkey2_io_b;
  wire       [7:0]    r_sbox_io_sbOut0;
  wire       [7:0]    r_sbox_io_sbOut1;
  wire       [7:0]    r_mixcolumns1_io_mcOut1;
  wire       [7:0]    r_mixcolumns1_io_mcOut2;
  wire       [7:0]    r_mixcolumns1_io_mcOut3;
  wire       [7:0]    r_mixcolumns1_io_mcOut4;
  wire       [7:0]    r_mixcolumns2_io_mcOut1;
  wire       [7:0]    r_mixcolumns2_io_mcOut2;
  wire       [7:0]    r_mixcolumns2_io_mcOut3;
  wire       [7:0]    r_mixcolumns2_io_mcOut4;
  wire       [3:0]    _zz_r_round_valueNext;
  wire       [0:0]    _zz_r_round_valueNext_1;
  wire       [1:0]    _zz_r_control1_valueNext;
  wire       [0:0]    _zz_r_control1_valueNext_1;
  wire       [1:0]    _zz_r_control2_valueNext;
  wire       [0:0]    _zz_r_control2_valueNext_1;
  wire       [4:0]    _zz_r_control_valueNext;
  wire       [0:0]    _zz_r_control_valueNext_1;
  wire       [7:0]    _zz_r_roundConstant;
  reg        [7:0]    _zz_io_ct1_payload;
  wire       [1:0]    _zz_io_ct1_payload_1;
  reg        [7:0]    _zz_io_ct1_payload_2;
  wire       [1:0]    _zz_io_ct1_payload_3;
  reg        [7:0]    _zz_io_ct1_payload_4;
  wire       [1:0]    _zz_io_ct1_payload_5;
  reg        [7:0]    _zz_io_ct1_payload_6;
  wire       [1:0]    _zz_io_ct1_payload_7;
  reg        [7:0]    _zz_io_ct2_payload;
  wire       [1:0]    _zz_io_ct2_payload_1;
  reg        [7:0]    _zz_io_ct2_payload_2;
  wire       [1:0]    _zz_io_ct2_payload_3;
  reg        [7:0]    _zz_io_ct2_payload_4;
  wire       [1:0]    _zz_io_ct2_payload_5;
  reg        [7:0]    _zz_io_ct2_payload_6;
  wire       [1:0]    _zz_io_ct2_payload_7;
  reg        [7:0]    r_stateReg1_0_0;
  reg        [7:0]    r_stateReg1_0_1;
  reg        [7:0]    r_stateReg1_0_2;
  reg        [7:0]    r_stateReg1_0_3;
  reg        [7:0]    r_stateReg1_1_0;
  reg        [7:0]    r_stateReg1_1_1;
  reg        [7:0]    r_stateReg1_1_2;
  reg        [7:0]    r_stateReg1_1_3;
  reg        [7:0]    r_stateReg1_2_0;
  reg        [7:0]    r_stateReg1_2_1;
  reg        [7:0]    r_stateReg1_2_2;
  reg        [7:0]    r_stateReg1_2_3;
  reg        [7:0]    r_stateReg1_3_0;
  reg        [7:0]    r_stateReg1_3_1;
  reg        [7:0]    r_stateReg1_3_2;
  reg        [7:0]    r_stateReg1_3_3;
  reg        [7:0]    r_stateReg2_0_0;
  reg        [7:0]    r_stateReg2_0_1;
  reg        [7:0]    r_stateReg2_0_2;
  reg        [7:0]    r_stateReg2_0_3;
  reg        [7:0]    r_stateReg2_1_0;
  reg        [7:0]    r_stateReg2_1_1;
  reg        [7:0]    r_stateReg2_1_2;
  reg        [7:0]    r_stateReg2_1_3;
  reg        [7:0]    r_stateReg2_2_0;
  reg        [7:0]    r_stateReg2_2_1;
  reg        [7:0]    r_stateReg2_2_2;
  reg        [7:0]    r_stateReg2_2_3;
  reg        [7:0]    r_stateReg2_3_0;
  reg        [7:0]    r_stateReg2_3_1;
  reg        [7:0]    r_stateReg2_3_2;
  reg        [7:0]    r_stateReg2_3_3;
  reg        [7:0]    r_keyReg1_0_0;
  reg        [7:0]    r_keyReg1_0_1;
  reg        [7:0]    r_keyReg1_0_2;
  reg        [7:0]    r_keyReg1_0_3;
  reg        [7:0]    r_keyReg1_1_0;
  reg        [7:0]    r_keyReg1_1_1;
  reg        [7:0]    r_keyReg1_1_2;
  reg        [7:0]    r_keyReg1_1_3;
  reg        [7:0]    r_keyReg1_2_0;
  reg        [7:0]    r_keyReg1_2_1;
  reg        [7:0]    r_keyReg1_2_2;
  reg        [7:0]    r_keyReg1_2_3;
  reg        [7:0]    r_keyReg1_3_0;
  reg        [7:0]    r_keyReg1_3_1;
  reg        [7:0]    r_keyReg1_3_2;
  reg        [7:0]    r_keyReg1_3_3;
  reg        [7:0]    r_keyReg2_0_0;
  reg        [7:0]    r_keyReg2_0_1;
  reg        [7:0]    r_keyReg2_0_2;
  reg        [7:0]    r_keyReg2_0_3;
  reg        [7:0]    r_keyReg2_1_0;
  reg        [7:0]    r_keyReg2_1_1;
  reg        [7:0]    r_keyReg2_1_2;
  reg        [7:0]    r_keyReg2_1_3;
  reg        [7:0]    r_keyReg2_2_0;
  reg        [7:0]    r_keyReg2_2_1;
  reg        [7:0]    r_keyReg2_2_2;
  reg        [7:0]    r_keyReg2_2_3;
  reg        [7:0]    r_keyReg2_3_0;
  reg        [7:0]    r_keyReg2_3_1;
  reg        [7:0]    r_keyReg2_3_2;
  reg        [7:0]    r_keyReg2_3_3;
  reg        [1:0]    r_fsmState;
  reg                 r_round_willIncrement;
  reg                 r_round_willClear;
  reg        [3:0]    r_round_valueNext;
  reg        [3:0]    r_round_value;
  wire                r_round_willOverflowIfInc;
  wire                r_round_willOverflow;
  reg                 r_control1_willIncrement;
  reg                 r_control1_willClear;
  reg        [1:0]    r_control1_valueNext;
  reg        [1:0]    r_control1_value;
  wire                r_control1_willOverflowIfInc;
  wire                r_control1_willOverflow;
  reg                 r_control2_willIncrement;
  reg                 r_control2_willClear;
  reg        [1:0]    r_control2_valueNext;
  reg        [1:0]    r_control2_value;
  wire                r_control2_willOverflowIfInc;
  wire                r_control2_willOverflow;
  reg                 r_control_willIncrement;
  reg                 r_control_willClear;
  reg        [4:0]    r_control_valueNext;
  reg        [4:0]    r_control_value;
  wire                r_control_willOverflowIfInc;
  wire                r_control_willOverflow;
  reg        [7:0]    r_roundConstant;
  wire                when_AES_Masked_l44;
  reg        [7:0]    r_rc;
  reg                 r_stateRotation;
  reg                 r_shiftRowsRotation;
  reg                 r_mixColumnsRotation;
  reg                 r_keyRotation;
  reg                 r_keyRotation2;
  reg                 r_keySboxRotation;
  reg                 r_keyRCRotation;
  wire                r_finalKeyAdd;
  wire                r_finalRound;
  wire                when_AES_Masked_l83;
  wire                when_AES_Masked_l336;
  wire                io_pt1_fire;
  wire                io_key1_fire;
  wire                io_pt2_fire;
  wire                io_key2_fire;
  wire                when_AES_Masked_l344;
  wire                io_pt1_fire_1;
  wire                io_key1_fire_1;
  wire                when_AES_Masked_l348;
  wire       [3:0]    _zz_1;
  wire       [7:0]    _zz_r_stateReg1_0_0;
  wire       [3:0]    _zz_2;
  wire       [7:0]    _zz_r_stateReg1_1_0;
  wire       [3:0]    _zz_3;
  wire       [7:0]    _zz_r_stateReg1_2_0;
  wire       [3:0]    _zz_4;
  wire       [7:0]    _zz_r_stateReg1_3_0;
  wire       [3:0]    _zz_5;
  wire       [7:0]    _zz_r_keyReg1_0_0;
  wire       [3:0]    _zz_6;
  wire       [7:0]    _zz_r_keyReg1_1_0;
  wire       [3:0]    _zz_7;
  wire       [7:0]    _zz_r_keyReg1_2_0;
  wire       [3:0]    _zz_8;
  wire       [7:0]    _zz_r_keyReg1_3_0;
  wire                io_pt2_fire_1;
  wire                io_key2_fire_1;
  wire                when_AES_Masked_l359;
  wire       [3:0]    _zz_9;
  wire       [7:0]    _zz_r_keyReg2_0_0;
  wire       [3:0]    _zz_10;
  wire       [7:0]    _zz_r_keyReg2_1_0;
  wire       [3:0]    _zz_11;
  wire       [7:0]    _zz_r_keyReg2_2_0;
  wire       [3:0]    _zz_12;
  wire       [7:0]    _zz_r_keyReg2_3_0;
  wire       [3:0]    _zz_13;
  wire       [7:0]    _zz_r_stateReg2_0_0;
  wire       [3:0]    _zz_14;
  wire       [7:0]    _zz_r_stateReg2_1_0;
  wire       [3:0]    _zz_15;
  wire       [7:0]    _zz_r_stateReg2_2_0;
  wire       [3:0]    _zz_16;
  wire       [7:0]    _zz_r_stateReg2_3_0;
  wire                when_AES_Masked_l372;
  wire                when_AES_Masked_l381;
  wire                when_AES_Masked_l383;
  wire                when_AES_Masked_l388;
  wire                when_AES_Masked_l391;
  wire                when_AES_Masked_l394;
  wire                when_AES_Masked_l396;
  wire                when_AES_Masked_l400;
  wire                when_AES_Masked_l403;
  wire                when_AES_Masked_l406;
  wire                when_AES_Masked_l416;
  wire                io_ct1_fire;
  wire                io_ct2_fire;
  wire                when_AES_Masked_l433;
  `ifndef SYNTHESIS
  reg [47:0] r_fsmState_string;
  `endif


  assign _zz_r_round_valueNext_1 = r_round_willIncrement;
  assign _zz_r_round_valueNext = {3'd0, _zz_r_round_valueNext_1};
  assign _zz_r_control1_valueNext_1 = r_control1_willIncrement;
  assign _zz_r_control1_valueNext = {1'd0, _zz_r_control1_valueNext_1};
  assign _zz_r_control2_valueNext_1 = r_control2_willIncrement;
  assign _zz_r_control2_valueNext = {1'd0, _zz_r_control2_valueNext_1};
  assign _zz_r_control_valueNext_1 = r_control_willIncrement;
  assign _zz_r_control_valueNext = {4'd0, _zz_r_control_valueNext_1};
  assign _zz_r_roundConstant = (r_roundConstant <<< 1);
  assign _zz_io_ct1_payload_1 = r_control1_value[1 : 0];
  assign _zz_io_ct1_payload_3 = r_control1_value[1 : 0];
  assign _zz_io_ct1_payload_5 = r_control1_value[1 : 0];
  assign _zz_io_ct1_payload_7 = r_control1_value[1 : 0];
  assign _zz_io_ct2_payload_1 = r_control2_value[1 : 0];
  assign _zz_io_ct2_payload_3 = r_control2_value[1 : 0];
  assign _zz_io_ct2_payload_5 = r_control2_value[1 : 0];
  assign _zz_io_ct2_payload_7 = r_control2_value[1 : 0];
  AddRoundKey r_addroundkey1 (
    .io_a    (r_stateReg1_0_0[7:0]      ), //i
    .io_k    (r_keyReg1_0_0[7:0]        ), //i
    .io_b    (r_addroundkey1_io_b[7:0]  )  //o
  );
  AddRoundKey r_addroundkey2 (
    .io_a    (r_stateReg2_0_0[7:0]      ), //i
    .io_k    (r_keyReg2_0_0[7:0]        ), //i
    .io_b    (r_addroundkey2_io_b[7:0]  )  //o
  );
  SBoxMasked r_sbox (
    .io_clk        (io_clk                 ), //i
    .io_reset      (io_reset               ), //i
    .io_sbIn0      (r_sbox_io_sbIn0[7:0]   ), //i
    .io_sbIn1      (r_sbox_io_sbIn1[7:0]   ), //i
    .io_m          (io_m[27:0]             ), //i
    .io_sbOut0     (r_sbox_io_sbOut0[7:0]  ), //o
    .io_sbOut1     (r_sbox_io_sbOut1[7:0]  ), //o
    .io_clk_1      (io_clk                 ), //i
    .io_reset_1    (io_reset               )  //i
  );
  MixColumns r_mixcolumns1 (
    .io_mcIn1     (r_stateReg1_0_0[7:0]          ), //i
    .io_mcIn2     (r_stateReg1_1_0[7:0]          ), //i
    .io_mcIn3     (r_stateReg1_2_0[7:0]          ), //i
    .io_mcIn4     (r_stateReg1_3_0[7:0]          ), //i
    .io_mcOut1    (r_mixcolumns1_io_mcOut1[7:0]  ), //o
    .io_mcOut2    (r_mixcolumns1_io_mcOut2[7:0]  ), //o
    .io_mcOut3    (r_mixcolumns1_io_mcOut3[7:0]  ), //o
    .io_mcOut4    (r_mixcolumns1_io_mcOut4[7:0]  )  //o
  );
  MixColumns r_mixcolumns2 (
    .io_mcIn1     (r_stateReg2_0_0[7:0]          ), //i
    .io_mcIn2     (r_stateReg2_1_0[7:0]          ), //i
    .io_mcIn3     (r_stateReg2_2_0[7:0]          ), //i
    .io_mcIn4     (r_stateReg2_3_0[7:0]          ), //i
    .io_mcOut1    (r_mixcolumns2_io_mcOut1[7:0]  ), //o
    .io_mcOut2    (r_mixcolumns2_io_mcOut2[7:0]  ), //o
    .io_mcOut3    (r_mixcolumns2_io_mcOut3[7:0]  ), //o
    .io_mcOut4    (r_mixcolumns2_io_mcOut4[7:0]  )  //o
  );
  always @(*) begin
    case(_zz_io_ct1_payload_1)
      2'b00 : begin
        _zz_io_ct1_payload = r_stateReg1_0_0;
      end
      2'b01 : begin
        _zz_io_ct1_payload = r_stateReg1_0_1;
      end
      2'b10 : begin
        _zz_io_ct1_payload = r_stateReg1_0_2;
      end
      default : begin
        _zz_io_ct1_payload = r_stateReg1_0_3;
      end
    endcase
  end

  always @(*) begin
    case(_zz_io_ct1_payload_3)
      2'b00 : begin
        _zz_io_ct1_payload_2 = r_stateReg1_1_0;
      end
      2'b01 : begin
        _zz_io_ct1_payload_2 = r_stateReg1_1_1;
      end
      2'b10 : begin
        _zz_io_ct1_payload_2 = r_stateReg1_1_2;
      end
      default : begin
        _zz_io_ct1_payload_2 = r_stateReg1_1_3;
      end
    endcase
  end

  always @(*) begin
    case(_zz_io_ct1_payload_5)
      2'b00 : begin
        _zz_io_ct1_payload_4 = r_stateReg1_2_0;
      end
      2'b01 : begin
        _zz_io_ct1_payload_4 = r_stateReg1_2_1;
      end
      2'b10 : begin
        _zz_io_ct1_payload_4 = r_stateReg1_2_2;
      end
      default : begin
        _zz_io_ct1_payload_4 = r_stateReg1_2_3;
      end
    endcase
  end

  always @(*) begin
    case(_zz_io_ct1_payload_7)
      2'b00 : begin
        _zz_io_ct1_payload_6 = r_stateReg1_3_0;
      end
      2'b01 : begin
        _zz_io_ct1_payload_6 = r_stateReg1_3_1;
      end
      2'b10 : begin
        _zz_io_ct1_payload_6 = r_stateReg1_3_2;
      end
      default : begin
        _zz_io_ct1_payload_6 = r_stateReg1_3_3;
      end
    endcase
  end

  always @(*) begin
    case(_zz_io_ct2_payload_1)
      2'b00 : begin
        _zz_io_ct2_payload = r_stateReg2_0_0;
      end
      2'b01 : begin
        _zz_io_ct2_payload = r_stateReg2_0_1;
      end
      2'b10 : begin
        _zz_io_ct2_payload = r_stateReg2_0_2;
      end
      default : begin
        _zz_io_ct2_payload = r_stateReg2_0_3;
      end
    endcase
  end

  always @(*) begin
    case(_zz_io_ct2_payload_3)
      2'b00 : begin
        _zz_io_ct2_payload_2 = r_stateReg2_1_0;
      end
      2'b01 : begin
        _zz_io_ct2_payload_2 = r_stateReg2_1_1;
      end
      2'b10 : begin
        _zz_io_ct2_payload_2 = r_stateReg2_1_2;
      end
      default : begin
        _zz_io_ct2_payload_2 = r_stateReg2_1_3;
      end
    endcase
  end

  always @(*) begin
    case(_zz_io_ct2_payload_5)
      2'b00 : begin
        _zz_io_ct2_payload_4 = r_stateReg2_2_0;
      end
      2'b01 : begin
        _zz_io_ct2_payload_4 = r_stateReg2_2_1;
      end
      2'b10 : begin
        _zz_io_ct2_payload_4 = r_stateReg2_2_2;
      end
      default : begin
        _zz_io_ct2_payload_4 = r_stateReg2_2_3;
      end
    endcase
  end

  always @(*) begin
    case(_zz_io_ct2_payload_7)
      2'b00 : begin
        _zz_io_ct2_payload_6 = r_stateReg2_3_0;
      end
      2'b01 : begin
        _zz_io_ct2_payload_6 = r_stateReg2_3_1;
      end
      2'b10 : begin
        _zz_io_ct2_payload_6 = r_stateReg2_3_2;
      end
      default : begin
        _zz_io_ct2_payload_6 = r_stateReg2_3_3;
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(r_fsmState)
      States2_sIdle : r_fsmState_string = "sIdle ";
      States2_sInit : r_fsmState_string = "sInit ";
      States2_sRound : r_fsmState_string = "sRound";
      States2_sDone : r_fsmState_string = "sDone ";
      default : r_fsmState_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    r_round_willIncrement = 1'b0;
    if(r_control_willOverflow) begin
      r_round_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    r_round_willClear = 1'b0;
    case(r_fsmState)
      States2_sIdle : begin
        r_round_willClear = 1'b1;
      end
      States2_sInit : begin
      end
      States2_sRound : begin
      end
      default : begin
      end
    endcase
  end

  assign r_round_willOverflowIfInc = (r_round_value == 4'b1011);
  assign r_round_willOverflow = (r_round_willOverflowIfInc && r_round_willIncrement);
  always @(*) begin
    if(r_round_willOverflow) begin
      r_round_valueNext = 4'b0001;
    end else begin
      r_round_valueNext = (r_round_value + _zz_r_round_valueNext);
    end
    if(r_round_willClear) begin
      r_round_valueNext = 4'b0001;
    end
  end

  always @(*) begin
    r_control1_willIncrement = 1'b0;
    case(r_fsmState)
      States2_sIdle : begin
      end
      States2_sInit : begin
        if(when_AES_Masked_l348) begin
          r_control1_willIncrement = 1'b1;
        end
      end
      States2_sRound : begin
      end
      default : begin
        if(io_ct1_fire) begin
          r_control1_willIncrement = 1'b1;
        end
      end
    endcase
  end

  always @(*) begin
    r_control1_willClear = 1'b0;
    case(r_fsmState)
      States2_sIdle : begin
        r_control1_willClear = 1'b1;
      end
      States2_sInit : begin
      end
      States2_sRound : begin
      end
      default : begin
      end
    endcase
  end

  assign r_control1_willOverflowIfInc = (r_control1_value == 2'b11);
  assign r_control1_willOverflow = (r_control1_willOverflowIfInc && r_control1_willIncrement);
  always @(*) begin
    r_control1_valueNext = (r_control1_value + _zz_r_control1_valueNext);
    if(r_control1_willClear) begin
      r_control1_valueNext = 2'b00;
    end
  end

  always @(*) begin
    r_control2_willIncrement = 1'b0;
    case(r_fsmState)
      States2_sIdle : begin
      end
      States2_sInit : begin
        if(when_AES_Masked_l359) begin
          r_control2_willIncrement = 1'b1;
        end
      end
      States2_sRound : begin
      end
      default : begin
        if(!io_ct1_fire) begin
          if(io_ct2_fire) begin
            r_control2_willIncrement = 1'b1;
          end
        end
      end
    endcase
  end

  always @(*) begin
    r_control2_willClear = 1'b0;
    case(r_fsmState)
      States2_sIdle : begin
        r_control2_willClear = 1'b1;
      end
      States2_sInit : begin
      end
      States2_sRound : begin
      end
      default : begin
      end
    endcase
  end

  assign r_control2_willOverflowIfInc = (r_control2_value == 2'b11);
  assign r_control2_willOverflow = (r_control2_willOverflowIfInc && r_control2_willIncrement);
  always @(*) begin
    r_control2_valueNext = (r_control2_value + _zz_r_control2_valueNext);
    if(r_control2_willClear) begin
      r_control2_valueNext = 2'b00;
    end
  end

  always @(*) begin
    r_control_willIncrement = 1'b0;
    case(r_fsmState)
      States2_sIdle : begin
      end
      States2_sInit : begin
        if(when_AES_Masked_l344) begin
          r_control_willIncrement = 1'b1;
        end
      end
      States2_sRound : begin
        r_control_willIncrement = 1'b1;
      end
      default : begin
        if(io_ct1_fire) begin
          r_control_willIncrement = 1'b1;
        end else begin
          if(io_ct2_fire) begin
            r_control_willIncrement = 1'b1;
          end
        end
      end
    endcase
  end

  always @(*) begin
    r_control_willClear = 1'b0;
    case(r_fsmState)
      States2_sIdle : begin
        r_control_willClear = 1'b1;
      end
      States2_sInit : begin
        if(when_AES_Masked_l372) begin
          r_control_willClear = 1'b1;
        end
      end
      States2_sRound : begin
        if(when_AES_Masked_l381) begin
          if(when_AES_Masked_l383) begin
            r_control_willClear = 1'b1;
          end
        end
      end
      default : begin
      end
    endcase
  end

  assign r_control_willOverflowIfInc = (r_control_value == 5'h18);
  assign r_control_willOverflow = (r_control_willOverflowIfInc && r_control_willIncrement);
  always @(*) begin
    if(r_control_willOverflow) begin
      r_control_valueNext = 5'h0;
    end else begin
      r_control_valueNext = (r_control_value + _zz_r_control_valueNext);
    end
    if(r_control_willClear) begin
      r_control_valueNext = 5'h0;
    end
  end

  assign when_AES_Masked_l44 = (r_roundConstant < 8'h80);
  always @(*) begin
    r_rc = 8'h0;
    case(r_fsmState)
      States2_sIdle : begin
      end
      States2_sInit : begin
      end
      States2_sRound : begin
        if(when_AES_Masked_l403) begin
          r_rc = r_roundConstant;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    r_stateRotation = 1'b0;
    case(r_fsmState)
      States2_sIdle : begin
      end
      States2_sInit : begin
      end
      States2_sRound : begin
        if(when_AES_Masked_l381) begin
          r_stateRotation = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    r_shiftRowsRotation = 1'b0;
    case(r_fsmState)
      States2_sIdle : begin
      end
      States2_sInit : begin
      end
      States2_sRound : begin
        if(when_AES_Masked_l388) begin
          r_shiftRowsRotation = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    r_mixColumnsRotation = 1'b0;
    case(r_fsmState)
      States2_sIdle : begin
      end
      States2_sInit : begin
      end
      States2_sRound : begin
        if(when_AES_Masked_l391) begin
          r_mixColumnsRotation = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    r_keyRotation = 1'b0;
    case(r_fsmState)
      States2_sIdle : begin
      end
      States2_sInit : begin
      end
      States2_sRound : begin
        if(when_AES_Masked_l394) begin
          r_keyRotation = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    r_keyRotation2 = 1'b0;
    case(r_fsmState)
      States2_sIdle : begin
      end
      States2_sInit : begin
      end
      States2_sRound : begin
        if(when_AES_Masked_l394) begin
          if(when_AES_Masked_l396) begin
            r_keyRotation2 = 1'b1;
          end
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    r_keySboxRotation = 1'b0;
    case(r_fsmState)
      States2_sIdle : begin
      end
      States2_sInit : begin
      end
      States2_sRound : begin
        if(when_AES_Masked_l400) begin
          r_keySboxRotation = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    r_keyRCRotation = 1'b0;
    case(r_fsmState)
      States2_sIdle : begin
      end
      States2_sInit : begin
      end
      States2_sRound : begin
        if(when_AES_Masked_l406) begin
          r_keyRCRotation = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign r_finalKeyAdd = (r_round_value == 4'b1011);
  assign r_finalRound = (r_round_value == 4'b1010);
  assign when_AES_Masked_l83 = (r_control_value < 5'h10);
  always @(*) begin
    if(when_AES_Masked_l83) begin
      r_sbox_io_sbIn0 = r_addroundkey1_io_b;
    end else begin
      r_sbox_io_sbIn0 = r_keyReg1_1_3;
    end
  end

  always @(*) begin
    if(when_AES_Masked_l83) begin
      r_sbox_io_sbIn1 = r_addroundkey2_io_b;
    end else begin
      r_sbox_io_sbIn1 = r_keyReg2_1_3;
    end
  end

  always @(*) begin
    io_pt1_ready = 1'b0;
    case(r_fsmState)
      States2_sIdle : begin
      end
      States2_sInit : begin
        if(when_AES_Masked_l336) begin
          io_pt1_ready = 1'b1;
        end
      end
      States2_sRound : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_pt2_ready = 1'b0;
    case(r_fsmState)
      States2_sIdle : begin
      end
      States2_sInit : begin
        if(!when_AES_Masked_l336) begin
          io_pt2_ready = 1'b1;
        end
      end
      States2_sRound : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_key1_ready = 1'b0;
    case(r_fsmState)
      States2_sIdle : begin
      end
      States2_sInit : begin
        if(when_AES_Masked_l336) begin
          io_key1_ready = 1'b1;
        end
      end
      States2_sRound : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_key2_ready = 1'b0;
    case(r_fsmState)
      States2_sIdle : begin
      end
      States2_sInit : begin
        if(!when_AES_Masked_l336) begin
          io_key2_ready = 1'b1;
        end
      end
      States2_sRound : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_ct1_valid = 1'b0;
    case(r_fsmState)
      States2_sIdle : begin
      end
      States2_sInit : begin
      end
      States2_sRound : begin
      end
      default : begin
        if(when_AES_Masked_l416) begin
          io_ct1_valid = 1'b1;
        end
      end
    endcase
  end

  always @(*) begin
    io_ct2_valid = 1'b0;
    case(r_fsmState)
      States2_sIdle : begin
      end
      States2_sInit : begin
      end
      States2_sRound : begin
      end
      default : begin
        if(!when_AES_Masked_l416) begin
          io_ct2_valid = 1'b1;
        end
      end
    endcase
  end

  always @(*) begin
    io_ct1_payload = 32'h0;
    case(r_fsmState)
      States2_sIdle : begin
      end
      States2_sInit : begin
      end
      States2_sRound : begin
      end
      default : begin
        if(io_ct1_fire) begin
          io_ct1_payload = {{{_zz_io_ct1_payload,_zz_io_ct1_payload_2},_zz_io_ct1_payload_4},_zz_io_ct1_payload_6};
        end
      end
    endcase
  end

  always @(*) begin
    io_ct2_payload = 32'h0;
    case(r_fsmState)
      States2_sIdle : begin
      end
      States2_sInit : begin
      end
      States2_sRound : begin
      end
      default : begin
        if(!io_ct1_fire) begin
          if(io_ct2_fire) begin
            io_ct2_payload = {{{_zz_io_ct2_payload,_zz_io_ct2_payload_2},_zz_io_ct2_payload_4},_zz_io_ct2_payload_6};
          end
        end
      end
    endcase
  end

  always @(*) begin
    io_done = 1'b0;
    case(r_fsmState)
      States2_sIdle : begin
      end
      States2_sInit : begin
      end
      States2_sRound : begin
      end
      default : begin
        io_done = 1'b1;
      end
    endcase
  end

  assign when_AES_Masked_l336 = (r_control_value < 5'h04);
  assign io_pt1_fire = (io_pt1_valid && io_pt1_ready);
  assign io_key1_fire = (io_key1_valid && io_key1_ready);
  assign io_pt2_fire = (io_pt2_valid && io_pt2_ready);
  assign io_key2_fire = (io_key2_valid && io_key2_ready);
  assign when_AES_Masked_l344 = ((io_pt1_fire && io_key1_fire) || (io_pt2_fire && io_key2_fire));
  assign io_pt1_fire_1 = (io_pt1_valid && io_pt1_ready);
  assign io_key1_fire_1 = (io_key1_valid && io_key1_ready);
  assign when_AES_Masked_l348 = (io_pt1_fire_1 && io_key1_fire_1);
  assign _zz_1 = ({3'd0,1'b1} <<< r_control1_value[1 : 0]);
  assign _zz_r_stateReg1_0_0 = io_pt1_payload[31 : 24];
  assign _zz_2 = ({3'd0,1'b1} <<< r_control1_value[1 : 0]);
  assign _zz_r_stateReg1_1_0 = io_pt1_payload[23 : 16];
  assign _zz_3 = ({3'd0,1'b1} <<< r_control1_value[1 : 0]);
  assign _zz_r_stateReg1_2_0 = io_pt1_payload[15 : 8];
  assign _zz_4 = ({3'd0,1'b1} <<< r_control1_value[1 : 0]);
  assign _zz_r_stateReg1_3_0 = io_pt1_payload[7 : 0];
  assign _zz_5 = ({3'd0,1'b1} <<< r_control1_value[1 : 0]);
  assign _zz_r_keyReg1_0_0 = io_key1_payload[31 : 24];
  assign _zz_6 = ({3'd0,1'b1} <<< r_control1_value[1 : 0]);
  assign _zz_r_keyReg1_1_0 = io_key1_payload[23 : 16];
  assign _zz_7 = ({3'd0,1'b1} <<< r_control1_value[1 : 0]);
  assign _zz_r_keyReg1_2_0 = io_key1_payload[15 : 8];
  assign _zz_8 = ({3'd0,1'b1} <<< r_control1_value[1 : 0]);
  assign _zz_r_keyReg1_3_0 = io_key1_payload[7 : 0];
  assign io_pt2_fire_1 = (io_pt2_valid && io_pt2_ready);
  assign io_key2_fire_1 = (io_key2_valid && io_key2_ready);
  assign when_AES_Masked_l359 = (io_pt2_fire_1 && io_key2_fire_1);
  assign _zz_9 = ({3'd0,1'b1} <<< r_control2_value[1 : 0]);
  assign _zz_r_keyReg2_0_0 = io_key2_payload[31 : 24];
  assign _zz_10 = ({3'd0,1'b1} <<< r_control2_value[1 : 0]);
  assign _zz_r_keyReg2_1_0 = io_key2_payload[23 : 16];
  assign _zz_11 = ({3'd0,1'b1} <<< r_control2_value[1 : 0]);
  assign _zz_r_keyReg2_2_0 = io_key2_payload[15 : 8];
  assign _zz_12 = ({3'd0,1'b1} <<< r_control2_value[1 : 0]);
  assign _zz_r_keyReg2_3_0 = io_key2_payload[7 : 0];
  assign _zz_13 = ({3'd0,1'b1} <<< r_control2_value[1 : 0]);
  assign _zz_r_stateReg2_0_0 = io_pt2_payload[31 : 24];
  assign _zz_14 = ({3'd0,1'b1} <<< r_control2_value[1 : 0]);
  assign _zz_r_stateReg2_1_0 = io_pt2_payload[23 : 16];
  assign _zz_15 = ({3'd0,1'b1} <<< r_control2_value[1 : 0]);
  assign _zz_r_stateReg2_2_0 = io_pt2_payload[15 : 8];
  assign _zz_16 = ({3'd0,1'b1} <<< r_control2_value[1 : 0]);
  assign _zz_r_stateReg2_3_0 = io_pt2_payload[7 : 0];
  assign when_AES_Masked_l372 = (r_control_value == 5'h07);
  assign when_AES_Masked_l381 = (r_control_value < 5'h14);
  assign when_AES_Masked_l383 = ((r_control_value == 5'h0f) && (r_round_value == 4'b1011));
  assign when_AES_Masked_l388 = (r_control_value == 5'h14);
  assign when_AES_Masked_l391 = (5'h14 < r_control_value);
  assign when_AES_Masked_l394 = (r_control_value < 5'h10);
  assign when_AES_Masked_l396 = ((r_control_value < 5'h0c) && (4'b0001 < r_round_value));
  assign when_AES_Masked_l400 = ((5'h10 <= r_control_value) && (r_control_value < 5'h14));
  assign when_AES_Masked_l403 = (r_control_value == 5'h14);
  assign when_AES_Masked_l406 = ((5'h14 <= r_control_value) && (r_control_value < 5'h18));
  assign when_AES_Masked_l416 = (r_control_value < 5'h04);
  assign io_ct1_fire = (io_ct1_valid && io_ct1_ready);
  assign io_ct2_fire = (io_ct2_valid && io_ct2_ready);
  assign when_AES_Masked_l433 = (r_control_value == 5'h08);
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      r_stateReg1_0_0 <= 8'h0;
      r_stateReg1_0_1 <= 8'h0;
      r_stateReg1_0_2 <= 8'h0;
      r_stateReg1_0_3 <= 8'h0;
      r_stateReg1_1_0 <= 8'h0;
      r_stateReg1_1_1 <= 8'h0;
      r_stateReg1_1_2 <= 8'h0;
      r_stateReg1_1_3 <= 8'h0;
      r_stateReg1_2_0 <= 8'h0;
      r_stateReg1_2_1 <= 8'h0;
      r_stateReg1_2_2 <= 8'h0;
      r_stateReg1_2_3 <= 8'h0;
      r_stateReg1_3_0 <= 8'h0;
      r_stateReg1_3_1 <= 8'h0;
      r_stateReg1_3_2 <= 8'h0;
      r_stateReg1_3_3 <= 8'h0;
      r_stateReg2_0_0 <= 8'h0;
      r_stateReg2_0_1 <= 8'h0;
      r_stateReg2_0_2 <= 8'h0;
      r_stateReg2_0_3 <= 8'h0;
      r_stateReg2_1_0 <= 8'h0;
      r_stateReg2_1_1 <= 8'h0;
      r_stateReg2_1_2 <= 8'h0;
      r_stateReg2_1_3 <= 8'h0;
      r_stateReg2_2_0 <= 8'h0;
      r_stateReg2_2_1 <= 8'h0;
      r_stateReg2_2_2 <= 8'h0;
      r_stateReg2_2_3 <= 8'h0;
      r_stateReg2_3_0 <= 8'h0;
      r_stateReg2_3_1 <= 8'h0;
      r_stateReg2_3_2 <= 8'h0;
      r_stateReg2_3_3 <= 8'h0;
      r_keyReg1_0_0 <= 8'h0;
      r_keyReg1_0_1 <= 8'h0;
      r_keyReg1_0_2 <= 8'h0;
      r_keyReg1_0_3 <= 8'h0;
      r_keyReg1_1_0 <= 8'h0;
      r_keyReg1_1_1 <= 8'h0;
      r_keyReg1_1_2 <= 8'h0;
      r_keyReg1_1_3 <= 8'h0;
      r_keyReg1_2_0 <= 8'h0;
      r_keyReg1_2_1 <= 8'h0;
      r_keyReg1_2_2 <= 8'h0;
      r_keyReg1_2_3 <= 8'h0;
      r_keyReg1_3_0 <= 8'h0;
      r_keyReg1_3_1 <= 8'h0;
      r_keyReg1_3_2 <= 8'h0;
      r_keyReg1_3_3 <= 8'h0;
      r_keyReg2_0_0 <= 8'h0;
      r_keyReg2_0_1 <= 8'h0;
      r_keyReg2_0_2 <= 8'h0;
      r_keyReg2_0_3 <= 8'h0;
      r_keyReg2_1_0 <= 8'h0;
      r_keyReg2_1_1 <= 8'h0;
      r_keyReg2_1_2 <= 8'h0;
      r_keyReg2_1_3 <= 8'h0;
      r_keyReg2_2_0 <= 8'h0;
      r_keyReg2_2_1 <= 8'h0;
      r_keyReg2_2_2 <= 8'h0;
      r_keyReg2_2_3 <= 8'h0;
      r_keyReg2_3_0 <= 8'h0;
      r_keyReg2_3_1 <= 8'h0;
      r_keyReg2_3_2 <= 8'h0;
      r_keyReg2_3_3 <= 8'h0;
      r_fsmState <= States2_sIdle;
      r_round_value <= 4'b0001;
      r_control1_value <= 2'b00;
      r_control2_value <= 2'b00;
      r_control_value <= 5'h0;
      r_roundConstant <= 8'h01;
    end else begin
      r_round_value <= r_round_valueNext;
      r_control1_value <= r_control1_valueNext;
      r_control2_value <= r_control2_valueNext;
      r_control_value <= r_control_valueNext;
      if(r_control_willOverflow) begin
        if(when_AES_Masked_l44) begin
          r_roundConstant <= (r_roundConstant <<< 1);
        end else begin
          r_roundConstant <= (_zz_r_roundConstant ^ 8'h1b);
        end
      end
      if(r_stateRotation) begin
        r_stateReg1_0_0 <= r_stateReg1_1_0;
        r_stateReg1_1_0 <= r_stateReg1_2_0;
        r_stateReg1_2_0 <= r_stateReg1_3_0;
        r_stateReg1_3_0 <= r_stateReg1_0_1;
        r_stateReg1_0_1 <= r_stateReg1_1_1;
        r_stateReg1_1_1 <= r_stateReg1_2_1;
        r_stateReg1_2_1 <= r_stateReg1_3_1;
        r_stateReg1_3_1 <= r_stateReg1_0_2;
        r_stateReg1_0_2 <= r_stateReg1_1_2;
        r_stateReg1_1_2 <= r_stateReg1_2_2;
        r_stateReg1_2_2 <= r_stateReg1_3_2;
        r_stateReg1_3_2 <= r_stateReg1_0_3;
        r_stateReg1_0_3 <= r_stateReg1_1_3;
        r_stateReg1_1_3 <= r_stateReg1_2_3;
        r_stateReg1_2_3 <= r_stateReg1_3_3;
        r_stateReg1_3_3 <= r_sbox_io_sbOut0;
        if(r_finalKeyAdd) begin
          r_stateReg1_3_3 <= r_addroundkey1_io_b;
        end
        r_stateReg2_0_0 <= r_stateReg2_1_0;
        r_stateReg2_1_0 <= r_stateReg2_2_0;
        r_stateReg2_2_0 <= r_stateReg2_3_0;
        r_stateReg2_3_0 <= r_stateReg2_0_1;
        r_stateReg2_0_1 <= r_stateReg2_1_1;
        r_stateReg2_1_1 <= r_stateReg2_2_1;
        r_stateReg2_2_1 <= r_stateReg2_3_1;
        r_stateReg2_3_1 <= r_stateReg2_0_2;
        r_stateReg2_0_2 <= r_stateReg2_1_2;
        r_stateReg2_1_2 <= r_stateReg2_2_2;
        r_stateReg2_2_2 <= r_stateReg2_3_2;
        r_stateReg2_3_2 <= r_stateReg2_0_3;
        r_stateReg2_0_3 <= r_stateReg2_1_3;
        r_stateReg2_1_3 <= r_stateReg2_2_3;
        r_stateReg2_2_3 <= r_stateReg2_3_3;
        r_stateReg2_3_3 <= r_sbox_io_sbOut1;
        if(r_finalKeyAdd) begin
          r_stateReg2_3_3 <= r_addroundkey2_io_b;
        end
      end else begin
        if(r_shiftRowsRotation) begin
          r_stateReg1_0_0 <= r_stateReg1_0_0;
          r_stateReg1_0_1 <= r_stateReg1_0_1;
          r_stateReg1_0_2 <= r_stateReg1_0_2;
          r_stateReg1_0_3 <= r_stateReg1_0_3;
          r_stateReg1_1_0 <= r_stateReg1_1_1;
          r_stateReg1_1_1 <= r_stateReg1_1_2;
          r_stateReg1_1_2 <= r_stateReg1_1_3;
          r_stateReg1_1_3 <= r_stateReg1_1_0;
          r_stateReg1_2_0 <= r_stateReg1_2_2;
          r_stateReg1_2_1 <= r_stateReg1_2_3;
          r_stateReg1_2_2 <= r_stateReg1_2_0;
          r_stateReg1_2_3 <= r_stateReg1_2_1;
          r_stateReg1_3_0 <= r_stateReg1_3_3;
          r_stateReg1_3_1 <= r_stateReg1_3_0;
          r_stateReg1_3_2 <= r_stateReg1_3_1;
          r_stateReg1_3_3 <= r_stateReg1_3_2;
          r_stateReg2_0_0 <= r_stateReg2_0_0;
          r_stateReg2_0_1 <= r_stateReg2_0_1;
          r_stateReg2_0_2 <= r_stateReg2_0_2;
          r_stateReg2_0_3 <= r_stateReg2_0_3;
          r_stateReg2_1_0 <= r_stateReg2_1_1;
          r_stateReg2_1_1 <= r_stateReg2_1_2;
          r_stateReg2_1_2 <= r_stateReg2_1_3;
          r_stateReg2_1_3 <= r_stateReg2_1_0;
          r_stateReg2_2_0 <= r_stateReg2_2_2;
          r_stateReg2_2_1 <= r_stateReg2_2_3;
          r_stateReg2_2_2 <= r_stateReg2_2_0;
          r_stateReg2_2_3 <= r_stateReg2_2_1;
          r_stateReg2_3_0 <= r_stateReg2_3_3;
          r_stateReg2_3_1 <= r_stateReg2_3_0;
          r_stateReg2_3_2 <= r_stateReg2_3_1;
          r_stateReg2_3_3 <= r_stateReg2_3_2;
        end else begin
          if(r_mixColumnsRotation) begin
            r_stateReg1_0_0 <= r_stateReg1_0_1;
            r_stateReg1_1_0 <= r_stateReg1_1_1;
            r_stateReg1_2_0 <= r_stateReg1_2_1;
            r_stateReg1_3_0 <= r_stateReg1_3_1;
            r_stateReg1_0_1 <= r_stateReg1_0_2;
            r_stateReg1_1_1 <= r_stateReg1_1_2;
            r_stateReg1_2_1 <= r_stateReg1_2_2;
            r_stateReg1_3_1 <= r_stateReg1_3_2;
            r_stateReg1_0_2 <= r_stateReg1_0_3;
            r_stateReg1_1_2 <= r_stateReg1_1_3;
            r_stateReg1_2_2 <= r_stateReg1_2_3;
            r_stateReg1_3_2 <= r_stateReg1_3_3;
            r_stateReg1_0_3 <= r_mixcolumns1_io_mcOut1;
            r_stateReg1_1_3 <= r_mixcolumns1_io_mcOut2;
            r_stateReg1_2_3 <= r_mixcolumns1_io_mcOut3;
            r_stateReg1_3_3 <= r_mixcolumns1_io_mcOut4;
            if(r_finalRound) begin
              r_stateReg1_0_3 <= r_stateReg1_0_0;
              r_stateReg1_1_3 <= r_stateReg1_1_0;
              r_stateReg1_2_3 <= r_stateReg1_2_0;
              r_stateReg1_3_3 <= r_stateReg1_3_0;
            end
            r_stateReg2_0_0 <= r_stateReg2_0_1;
            r_stateReg2_1_0 <= r_stateReg2_1_1;
            r_stateReg2_2_0 <= r_stateReg2_2_1;
            r_stateReg2_3_0 <= r_stateReg2_3_1;
            r_stateReg2_0_1 <= r_stateReg2_0_2;
            r_stateReg2_1_1 <= r_stateReg2_1_2;
            r_stateReg2_2_1 <= r_stateReg2_2_2;
            r_stateReg2_3_1 <= r_stateReg2_3_2;
            r_stateReg2_0_2 <= r_stateReg2_0_3;
            r_stateReg2_1_2 <= r_stateReg2_1_3;
            r_stateReg2_2_2 <= r_stateReg2_2_3;
            r_stateReg2_3_2 <= r_stateReg2_3_3;
            r_stateReg2_0_3 <= r_mixcolumns2_io_mcOut1;
            r_stateReg2_1_3 <= r_mixcolumns2_io_mcOut2;
            r_stateReg2_2_3 <= r_mixcolumns2_io_mcOut3;
            r_stateReg2_3_3 <= r_mixcolumns2_io_mcOut4;
            if(r_finalRound) begin
              r_stateReg2_0_3 <= r_stateReg2_0_0;
              r_stateReg2_1_3 <= r_stateReg2_1_0;
              r_stateReg2_2_3 <= r_stateReg2_2_0;
              r_stateReg2_3_3 <= r_stateReg2_3_0;
            end
          end
        end
      end
      if(r_keyRotation) begin
        r_keyReg1_0_0 <= r_keyReg1_1_0;
        r_keyReg1_1_0 <= r_keyReg1_2_0;
        r_keyReg1_2_0 <= r_keyReg1_3_0;
        r_keyReg1_0_1 <= r_keyReg1_1_1;
        r_keyReg1_1_1 <= r_keyReg1_2_1;
        r_keyReg1_2_1 <= r_keyReg1_3_1;
        r_keyReg1_0_2 <= r_keyReg1_1_2;
        r_keyReg1_1_2 <= r_keyReg1_2_2;
        r_keyReg1_2_2 <= r_keyReg1_3_2;
        r_keyReg1_0_3 <= r_keyReg1_1_3;
        r_keyReg1_1_3 <= r_keyReg1_2_3;
        r_keyReg1_2_3 <= r_keyReg1_3_3;
        r_keyReg1_3_0 <= r_keyReg1_0_1;
        r_keyReg1_3_1 <= r_keyReg1_0_2;
        r_keyReg1_3_2 <= r_keyReg1_0_3;
        r_keyReg1_3_3 <= r_keyReg1_0_0;
        r_keyReg2_0_0 <= r_keyReg2_1_0;
        r_keyReg2_1_0 <= r_keyReg2_2_0;
        r_keyReg2_2_0 <= r_keyReg2_3_0;
        r_keyReg2_0_1 <= r_keyReg2_1_1;
        r_keyReg2_1_1 <= r_keyReg2_2_1;
        r_keyReg2_2_1 <= r_keyReg2_3_1;
        r_keyReg2_0_2 <= r_keyReg2_1_2;
        r_keyReg2_1_2 <= r_keyReg2_2_2;
        r_keyReg2_2_2 <= r_keyReg2_3_2;
        r_keyReg2_0_3 <= r_keyReg2_1_3;
        r_keyReg2_1_3 <= r_keyReg2_2_3;
        r_keyReg2_2_3 <= r_keyReg2_3_3;
        r_keyReg2_3_0 <= r_keyReg2_0_1;
        r_keyReg2_3_1 <= r_keyReg2_0_2;
        r_keyReg2_3_2 <= r_keyReg2_0_3;
        r_keyReg2_3_3 <= r_keyReg2_0_0;
        if(r_keyRotation2) begin
          r_keyReg1_3_0 <= (r_keyReg1_0_0 ^ r_keyReg1_0_1);
          r_keyReg1_3_1 <= r_keyReg1_0_2;
          r_keyReg1_3_2 <= r_keyReg1_0_3;
          r_keyReg1_3_3 <= r_keyReg1_0_0;
          r_keyReg2_3_0 <= (r_keyReg2_0_0 ^ r_keyReg2_0_1);
          r_keyReg2_3_1 <= r_keyReg2_0_2;
          r_keyReg2_3_2 <= r_keyReg2_0_3;
          r_keyReg2_3_3 <= r_keyReg2_0_0;
        end
      end else begin
        if(r_keySboxRotation) begin
          r_keyReg1_1_3 <= r_keyReg1_2_3;
          r_keyReg1_2_3 <= r_keyReg1_3_3;
          r_keyReg1_3_3 <= r_keyReg1_0_3;
          r_keyReg1_0_3 <= r_keyReg1_1_3;
          r_keyReg2_1_3 <= r_keyReg2_2_3;
          r_keyReg2_2_3 <= r_keyReg2_3_3;
          r_keyReg2_3_3 <= r_keyReg2_0_3;
          r_keyReg2_0_3 <= r_keyReg2_1_3;
        end else begin
          if(r_keyRCRotation) begin
            r_keyReg1_0_0 <= r_keyReg1_1_0;
            r_keyReg1_1_0 <= r_keyReg1_2_0;
            r_keyReg1_2_0 <= r_keyReg1_3_0;
            r_keyReg1_3_0 <= ((r_sbox_io_sbOut0 ^ r_keyReg1_0_0) ^ r_rc);
            r_keyReg2_0_0 <= r_keyReg2_1_0;
            r_keyReg2_1_0 <= r_keyReg2_2_0;
            r_keyReg2_2_0 <= r_keyReg2_3_0;
            r_keyReg2_3_0 <= (r_sbox_io_sbOut1 ^ r_keyReg2_0_0);
          end
        end
      end
      case(r_fsmState)
        States2_sIdle : begin
          r_fsmState <= States2_sIdle;
          r_stateReg1_0_0 <= 8'h0;
          r_stateReg1_0_1 <= 8'h0;
          r_stateReg1_0_2 <= 8'h0;
          r_stateReg1_0_3 <= 8'h0;
          r_stateReg1_1_0 <= 8'h0;
          r_stateReg1_1_1 <= 8'h0;
          r_stateReg1_1_2 <= 8'h0;
          r_stateReg1_1_3 <= 8'h0;
          r_stateReg1_2_0 <= 8'h0;
          r_stateReg1_2_1 <= 8'h0;
          r_stateReg1_2_2 <= 8'h0;
          r_stateReg1_2_3 <= 8'h0;
          r_stateReg1_3_0 <= 8'h0;
          r_stateReg1_3_1 <= 8'h0;
          r_stateReg1_3_2 <= 8'h0;
          r_stateReg1_3_3 <= 8'h0;
          r_stateReg2_0_0 <= 8'h0;
          r_stateReg2_0_1 <= 8'h0;
          r_stateReg2_0_2 <= 8'h0;
          r_stateReg2_0_3 <= 8'h0;
          r_stateReg2_1_0 <= 8'h0;
          r_stateReg2_1_1 <= 8'h0;
          r_stateReg2_1_2 <= 8'h0;
          r_stateReg2_1_3 <= 8'h0;
          r_stateReg2_2_0 <= 8'h0;
          r_stateReg2_2_1 <= 8'h0;
          r_stateReg2_2_2 <= 8'h0;
          r_stateReg2_2_3 <= 8'h0;
          r_stateReg2_3_0 <= 8'h0;
          r_stateReg2_3_1 <= 8'h0;
          r_stateReg2_3_2 <= 8'h0;
          r_stateReg2_3_3 <= 8'h0;
          r_keyReg1_0_0 <= 8'h0;
          r_keyReg1_0_1 <= 8'h0;
          r_keyReg1_0_2 <= 8'h0;
          r_keyReg1_0_3 <= 8'h0;
          r_keyReg1_1_0 <= 8'h0;
          r_keyReg1_1_1 <= 8'h0;
          r_keyReg1_1_2 <= 8'h0;
          r_keyReg1_1_3 <= 8'h0;
          r_keyReg1_2_0 <= 8'h0;
          r_keyReg1_2_1 <= 8'h0;
          r_keyReg1_2_2 <= 8'h0;
          r_keyReg1_2_3 <= 8'h0;
          r_keyReg1_3_0 <= 8'h0;
          r_keyReg1_3_1 <= 8'h0;
          r_keyReg1_3_2 <= 8'h0;
          r_keyReg1_3_3 <= 8'h0;
          r_keyReg2_0_0 <= 8'h0;
          r_keyReg2_0_1 <= 8'h0;
          r_keyReg2_0_2 <= 8'h0;
          r_keyReg2_0_3 <= 8'h0;
          r_keyReg2_1_0 <= 8'h0;
          r_keyReg2_1_1 <= 8'h0;
          r_keyReg2_1_2 <= 8'h0;
          r_keyReg2_1_3 <= 8'h0;
          r_keyReg2_2_0 <= 8'h0;
          r_keyReg2_2_1 <= 8'h0;
          r_keyReg2_2_2 <= 8'h0;
          r_keyReg2_2_3 <= 8'h0;
          r_keyReg2_3_0 <= 8'h0;
          r_keyReg2_3_1 <= 8'h0;
          r_keyReg2_3_2 <= 8'h0;
          r_keyReg2_3_3 <= 8'h0;
          r_roundConstant <= 8'h01;
          if(io_enable) begin
            r_fsmState <= States2_sInit;
          end
        end
        States2_sInit : begin
          r_fsmState <= States2_sInit;
          if(when_AES_Masked_l348) begin
            if(_zz_1[0]) begin
              r_stateReg1_0_0 <= _zz_r_stateReg1_0_0;
            end
            if(_zz_1[1]) begin
              r_stateReg1_0_1 <= _zz_r_stateReg1_0_0;
            end
            if(_zz_1[2]) begin
              r_stateReg1_0_2 <= _zz_r_stateReg1_0_0;
            end
            if(_zz_1[3]) begin
              r_stateReg1_0_3 <= _zz_r_stateReg1_0_0;
            end
            if(_zz_2[0]) begin
              r_stateReg1_1_0 <= _zz_r_stateReg1_1_0;
            end
            if(_zz_2[1]) begin
              r_stateReg1_1_1 <= _zz_r_stateReg1_1_0;
            end
            if(_zz_2[2]) begin
              r_stateReg1_1_2 <= _zz_r_stateReg1_1_0;
            end
            if(_zz_2[3]) begin
              r_stateReg1_1_3 <= _zz_r_stateReg1_1_0;
            end
            if(_zz_3[0]) begin
              r_stateReg1_2_0 <= _zz_r_stateReg1_2_0;
            end
            if(_zz_3[1]) begin
              r_stateReg1_2_1 <= _zz_r_stateReg1_2_0;
            end
            if(_zz_3[2]) begin
              r_stateReg1_2_2 <= _zz_r_stateReg1_2_0;
            end
            if(_zz_3[3]) begin
              r_stateReg1_2_3 <= _zz_r_stateReg1_2_0;
            end
            if(_zz_4[0]) begin
              r_stateReg1_3_0 <= _zz_r_stateReg1_3_0;
            end
            if(_zz_4[1]) begin
              r_stateReg1_3_1 <= _zz_r_stateReg1_3_0;
            end
            if(_zz_4[2]) begin
              r_stateReg1_3_2 <= _zz_r_stateReg1_3_0;
            end
            if(_zz_4[3]) begin
              r_stateReg1_3_3 <= _zz_r_stateReg1_3_0;
            end
            if(_zz_5[0]) begin
              r_keyReg1_0_0 <= _zz_r_keyReg1_0_0;
            end
            if(_zz_5[1]) begin
              r_keyReg1_0_1 <= _zz_r_keyReg1_0_0;
            end
            if(_zz_5[2]) begin
              r_keyReg1_0_2 <= _zz_r_keyReg1_0_0;
            end
            if(_zz_5[3]) begin
              r_keyReg1_0_3 <= _zz_r_keyReg1_0_0;
            end
            if(_zz_6[0]) begin
              r_keyReg1_1_0 <= _zz_r_keyReg1_1_0;
            end
            if(_zz_6[1]) begin
              r_keyReg1_1_1 <= _zz_r_keyReg1_1_0;
            end
            if(_zz_6[2]) begin
              r_keyReg1_1_2 <= _zz_r_keyReg1_1_0;
            end
            if(_zz_6[3]) begin
              r_keyReg1_1_3 <= _zz_r_keyReg1_1_0;
            end
            if(_zz_7[0]) begin
              r_keyReg1_2_0 <= _zz_r_keyReg1_2_0;
            end
            if(_zz_7[1]) begin
              r_keyReg1_2_1 <= _zz_r_keyReg1_2_0;
            end
            if(_zz_7[2]) begin
              r_keyReg1_2_2 <= _zz_r_keyReg1_2_0;
            end
            if(_zz_7[3]) begin
              r_keyReg1_2_3 <= _zz_r_keyReg1_2_0;
            end
            if(_zz_8[0]) begin
              r_keyReg1_3_0 <= _zz_r_keyReg1_3_0;
            end
            if(_zz_8[1]) begin
              r_keyReg1_3_1 <= _zz_r_keyReg1_3_0;
            end
            if(_zz_8[2]) begin
              r_keyReg1_3_2 <= _zz_r_keyReg1_3_0;
            end
            if(_zz_8[3]) begin
              r_keyReg1_3_3 <= _zz_r_keyReg1_3_0;
            end
          end
          if(when_AES_Masked_l359) begin
            if(_zz_9[0]) begin
              r_keyReg2_0_0 <= _zz_r_keyReg2_0_0;
            end
            if(_zz_9[1]) begin
              r_keyReg2_0_1 <= _zz_r_keyReg2_0_0;
            end
            if(_zz_9[2]) begin
              r_keyReg2_0_2 <= _zz_r_keyReg2_0_0;
            end
            if(_zz_9[3]) begin
              r_keyReg2_0_3 <= _zz_r_keyReg2_0_0;
            end
            if(_zz_10[0]) begin
              r_keyReg2_1_0 <= _zz_r_keyReg2_1_0;
            end
            if(_zz_10[1]) begin
              r_keyReg2_1_1 <= _zz_r_keyReg2_1_0;
            end
            if(_zz_10[2]) begin
              r_keyReg2_1_2 <= _zz_r_keyReg2_1_0;
            end
            if(_zz_10[3]) begin
              r_keyReg2_1_3 <= _zz_r_keyReg2_1_0;
            end
            if(_zz_11[0]) begin
              r_keyReg2_2_0 <= _zz_r_keyReg2_2_0;
            end
            if(_zz_11[1]) begin
              r_keyReg2_2_1 <= _zz_r_keyReg2_2_0;
            end
            if(_zz_11[2]) begin
              r_keyReg2_2_2 <= _zz_r_keyReg2_2_0;
            end
            if(_zz_11[3]) begin
              r_keyReg2_2_3 <= _zz_r_keyReg2_2_0;
            end
            if(_zz_12[0]) begin
              r_keyReg2_3_0 <= _zz_r_keyReg2_3_0;
            end
            if(_zz_12[1]) begin
              r_keyReg2_3_1 <= _zz_r_keyReg2_3_0;
            end
            if(_zz_12[2]) begin
              r_keyReg2_3_2 <= _zz_r_keyReg2_3_0;
            end
            if(_zz_12[3]) begin
              r_keyReg2_3_3 <= _zz_r_keyReg2_3_0;
            end
            if(_zz_13[0]) begin
              r_stateReg2_0_0 <= _zz_r_stateReg2_0_0;
            end
            if(_zz_13[1]) begin
              r_stateReg2_0_1 <= _zz_r_stateReg2_0_0;
            end
            if(_zz_13[2]) begin
              r_stateReg2_0_2 <= _zz_r_stateReg2_0_0;
            end
            if(_zz_13[3]) begin
              r_stateReg2_0_3 <= _zz_r_stateReg2_0_0;
            end
            if(_zz_14[0]) begin
              r_stateReg2_1_0 <= _zz_r_stateReg2_1_0;
            end
            if(_zz_14[1]) begin
              r_stateReg2_1_1 <= _zz_r_stateReg2_1_0;
            end
            if(_zz_14[2]) begin
              r_stateReg2_1_2 <= _zz_r_stateReg2_1_0;
            end
            if(_zz_14[3]) begin
              r_stateReg2_1_3 <= _zz_r_stateReg2_1_0;
            end
            if(_zz_15[0]) begin
              r_stateReg2_2_0 <= _zz_r_stateReg2_2_0;
            end
            if(_zz_15[1]) begin
              r_stateReg2_2_1 <= _zz_r_stateReg2_2_0;
            end
            if(_zz_15[2]) begin
              r_stateReg2_2_2 <= _zz_r_stateReg2_2_0;
            end
            if(_zz_15[3]) begin
              r_stateReg2_2_3 <= _zz_r_stateReg2_2_0;
            end
            if(_zz_16[0]) begin
              r_stateReg2_3_0 <= _zz_r_stateReg2_3_0;
            end
            if(_zz_16[1]) begin
              r_stateReg2_3_1 <= _zz_r_stateReg2_3_0;
            end
            if(_zz_16[2]) begin
              r_stateReg2_3_2 <= _zz_r_stateReg2_3_0;
            end
            if(_zz_16[3]) begin
              r_stateReg2_3_3 <= _zz_r_stateReg2_3_0;
            end
          end
          if(when_AES_Masked_l372) begin
            r_fsmState <= States2_sRound;
          end
        end
        States2_sRound : begin
          r_fsmState <= States2_sRound;
          if(when_AES_Masked_l381) begin
            if(when_AES_Masked_l383) begin
              r_fsmState <= States2_sDone;
            end
          end
        end
        default : begin
          r_fsmState <= States2_sDone;
          if(when_AES_Masked_l433) begin
            r_fsmState <= States2_sIdle;
          end
        end
      endcase
    end
  end


endmodule

//MixColumns replaced by MixColumns

module MixColumns (
  input      [7:0]    io_mcIn1,
  input      [7:0]    io_mcIn2,
  input      [7:0]    io_mcIn3,
  input      [7:0]    io_mcIn4,
  output     [7:0]    io_mcOut1,
  output     [7:0]    io_mcOut2,
  output     [7:0]    io_mcOut3,
  output     [7:0]    io_mcOut4
);

  wire       [8:0]    _zz__zz_io_mcOut1;
  wire       [8:0]    _zz__zz_io_mcOut1_1;
  wire       [8:0]    _zz__zz_io_mcOut2;
  wire       [8:0]    _zz__zz_io_mcOut2_1;
  wire       [8:0]    _zz__zz_io_mcOut3;
  wire       [8:0]    _zz__zz_io_mcOut3_1;
  wire       [8:0]    _zz__zz_io_mcOut4;
  wire       [8:0]    _zz__zz_io_mcOut4_1;
  wire       [7:0]    a1;
  wire       [7:0]    a2;
  wire       [7:0]    a3;
  wire       [7:0]    a0;
  reg        [8:0]    _zz_io_mcOut1;
  wire                when_MixColumns_l26;
  reg        [8:0]    _zz_io_mcOut1_1;
  wire                when_MixColumns_l26_1;
  reg        [8:0]    _zz_io_mcOut2;
  wire                when_MixColumns_l26_2;
  reg        [8:0]    _zz_io_mcOut2_1;
  wire                when_MixColumns_l26_3;
  reg        [8:0]    _zz_io_mcOut3;
  wire                when_MixColumns_l26_4;
  reg        [8:0]    _zz_io_mcOut3_1;
  wire                when_MixColumns_l26_5;
  reg        [8:0]    _zz_io_mcOut4;
  wire                when_MixColumns_l26_6;
  reg        [8:0]    _zz_io_mcOut4_1;
  wire                when_MixColumns_l26_7;

  assign _zz__zz_io_mcOut1 = ({1'd0,a0} <<< 1);
  assign _zz__zz_io_mcOut1_1 = ({1'd0,a1} <<< 1);
  assign _zz__zz_io_mcOut2 = ({1'd0,a1} <<< 1);
  assign _zz__zz_io_mcOut2_1 = ({1'd0,a2} <<< 1);
  assign _zz__zz_io_mcOut3 = ({1'd0,a2} <<< 1);
  assign _zz__zz_io_mcOut3_1 = ({1'd0,a3} <<< 1);
  assign _zz__zz_io_mcOut4 = ({1'd0,a0} <<< 1);
  assign _zz__zz_io_mcOut4_1 = ({1'd0,a3} <<< 1);
  assign a0 = io_mcIn1;
  assign a1 = io_mcIn2;
  assign a2 = io_mcIn3;
  assign a3 = io_mcIn4;
  assign when_MixColumns_l26 = a0[7];
  always @(*) begin
    if(when_MixColumns_l26) begin
      _zz_io_mcOut1 = (_zz__zz_io_mcOut1 ^ 9'h11b);
    end else begin
      _zz_io_mcOut1 = ({1'd0,a0} <<< 1);
    end
  end

  assign when_MixColumns_l26_1 = a1[7];
  always @(*) begin
    if(when_MixColumns_l26_1) begin
      _zz_io_mcOut1_1 = (_zz__zz_io_mcOut1_1 ^ 9'h11b);
    end else begin
      _zz_io_mcOut1_1 = ({1'd0,a1} <<< 1);
    end
  end

  assign io_mcOut1 = (((_zz_io_mcOut1[7 : 0] ^ (_zz_io_mcOut1_1[7 : 0] ^ a1)) ^ a2) ^ a3);
  assign when_MixColumns_l26_2 = a1[7];
  always @(*) begin
    if(when_MixColumns_l26_2) begin
      _zz_io_mcOut2 = (_zz__zz_io_mcOut2 ^ 9'h11b);
    end else begin
      _zz_io_mcOut2 = ({1'd0,a1} <<< 1);
    end
  end

  assign when_MixColumns_l26_3 = a2[7];
  always @(*) begin
    if(when_MixColumns_l26_3) begin
      _zz_io_mcOut2_1 = (_zz__zz_io_mcOut2_1 ^ 9'h11b);
    end else begin
      _zz_io_mcOut2_1 = ({1'd0,a2} <<< 1);
    end
  end

  assign io_mcOut2 = (((a0 ^ _zz_io_mcOut2[7 : 0]) ^ (_zz_io_mcOut2_1[7 : 0] ^ a2)) ^ a3);
  assign when_MixColumns_l26_4 = a2[7];
  always @(*) begin
    if(when_MixColumns_l26_4) begin
      _zz_io_mcOut3 = (_zz__zz_io_mcOut3 ^ 9'h11b);
    end else begin
      _zz_io_mcOut3 = ({1'd0,a2} <<< 1);
    end
  end

  assign when_MixColumns_l26_5 = a3[7];
  always @(*) begin
    if(when_MixColumns_l26_5) begin
      _zz_io_mcOut3_1 = (_zz__zz_io_mcOut3_1 ^ 9'h11b);
    end else begin
      _zz_io_mcOut3_1 = ({1'd0,a3} <<< 1);
    end
  end

  assign io_mcOut3 = (((a0 ^ a1) ^ _zz_io_mcOut3[7 : 0]) ^ (_zz_io_mcOut3_1[7 : 0] ^ a3));
  assign when_MixColumns_l26_6 = a0[7];
  always @(*) begin
    if(when_MixColumns_l26_6) begin
      _zz_io_mcOut4 = (_zz__zz_io_mcOut4 ^ 9'h11b);
    end else begin
      _zz_io_mcOut4 = ({1'd0,a0} <<< 1);
    end
  end

  assign when_MixColumns_l26_7 = a3[7];
  always @(*) begin
    if(when_MixColumns_l26_7) begin
      _zz_io_mcOut4_1 = (_zz__zz_io_mcOut4_1 ^ 9'h11b);
    end else begin
      _zz_io_mcOut4_1 = ({1'd0,a3} <<< 1);
    end
  end

  assign io_mcOut4 = ((((_zz_io_mcOut4[7 : 0] ^ a0) ^ a1) ^ a2) ^ _zz_io_mcOut4_1[7 : 0]);

endmodule

module SBoxMasked (
  input               io_clk,
  input               io_reset,
  input      [7:0]    io_sbIn0,
  input      [7:0]    io_sbIn1,
  input      [27:0]   io_m,
  output     [7:0]    io_sbOut0,
  output     [7:0]    io_sbOut1,
  input               io_clk_1,
  input               io_reset_1
);

  wire       [7:0]    convert0_io_output;
  wire       [7:0]    convert1_io_output;
  wire       [7:0]    convert2_io_output;
  wire       [7:0]    convert3_io_output;
  wire       [7:0]    inv_io_z_0;
  wire       [7:0]    inv_io_z_1;
  reg                 dummy;

  NewBasis convert0 (
    .io_input        (io_sbIn0[7:0]            ), //i
    .io_direction    (1'b0                     ), //i
    .io_output       (convert0_io_output[7:0]  ), //o
    .io_clk          (io_clk_1                 ), //i
    .io_reset        (io_reset_1               )  //i
  );
  NewBasis convert1 (
    .io_input        (io_sbIn1[7:0]            ), //i
    .io_direction    (1'b0                     ), //i
    .io_output       (convert1_io_output[7:0]  ), //o
    .io_clk          (io_clk_1                 ), //i
    .io_reset        (io_reset_1               )  //i
  );
  NewBasis convert2 (
    .io_input        (inv_io_z_0[7:0]          ), //i
    .io_direction    (1'b1                     ), //i
    .io_output       (convert2_io_output[7:0]  ), //o
    .io_clk          (io_clk_1                 ), //i
    .io_reset        (io_reset_1               )  //i
  );
  NewBasis convert3 (
    .io_input        (inv_io_z_1[7:0]          ), //i
    .io_direction    (1'b1                     ), //i
    .io_output       (convert3_io_output[7:0]  ), //o
    .io_clk          (io_clk_1                 ), //i
    .io_reset        (io_reset_1               )  //i
  );
  G256Inv2Shares5Stages inv (
    .io_clk      (io_clk                   ), //i
    .io_reset    (io_reset                 ), //i
    .io_x_0      (convert0_io_output[7:0]  ), //i
    .io_x_1      (convert1_io_output[7:0]  ), //i
    .io_m        (io_m[27:0]               ), //i
    .io_z_0      (inv_io_z_0[7:0]          ), //o
    .io_z_1      (inv_io_z_1[7:0]          )  //o
  );
  assign io_sbOut0 = (convert2_io_output ^ 8'h63);
  assign io_sbOut1 = convert3_io_output;

endmodule

//AddRoundKey replaced by AddRoundKey

module AddRoundKey (
  input      [7:0]    io_a,
  input      [7:0]    io_k,
  output     [7:0]    io_b
);


  assign io_b = (io_a ^ io_k);

endmodule

module G256Inv2Shares5Stages (
  input               io_clk,
  input               io_reset,
  input      [7:0]    io_x_0,
  input      [7:0]    io_x_1,
  input      [27:0]   io_m,
  output     [7:0]    io_z_0,
  output     [7:0]    io_z_1
);

  wire       [7:0]    r_mul1_io_m;
  wire       [3:0]    r_mul2_io_m;
  wire       [3:0]    r_mul3_io_m;
  wire       [3:0]    r_inv_io_x_0;
  wire       [3:0]    r_inv_io_x_1;
  wire       [11:0]   r_inv_io_m;
  wire       [3:0]    g16SqSc_2_io_t;
  wire       [3:0]    g16SqSc_3_io_t;
  wire       [3:0]    r_mul1_io_z_0;
  wire       [3:0]    r_mul1_io_z_1;
  wire       [3:0]    r_mul2_io_z_0;
  wire       [3:0]    r_mul2_io_z_1;
  wire       [3:0]    r_mul3_io_z_0;
  wire       [3:0]    r_mul3_io_z_1;
  wire       [3:0]    r_inv_io_z_0;
  wire       [3:0]    r_inv_io_z_1;
  wire       [3:0]    g16SqSc_2_io_x;
  wire       [3:0]    g16SqSc_3_io_x;
  wire       [3:0]    r_a_0;
  wire       [3:0]    r_a_1;
  wire       [3:0]    r_b_0;
  wire       [3:0]    r_b_1;
  wire       [3:0]    r_d_0;
  wire       [3:0]    r_d_1;
  wire       [3:0]    r_e_0;
  wire       [3:0]    r_e_1;
  wire       [3:0]    r_f_0;
  wire       [3:0]    r_f_1;
  wire       [3:0]    r_p_0;
  wire       [3:0]    r_p_1;
  wire       [3:0]    r_q_0;
  wire       [3:0]    r_q_1;
  reg        [3:0]    r_a1_0;
  reg        [3:0]    r_a1_1;
  reg        [3:0]    r_a2_0;
  reg        [3:0]    r_a2_1;
  reg        [3:0]    r_a3_0;
  reg        [3:0]    r_a3_1;
  reg        [3:0]    r_b1_0;
  reg        [3:0]    r_b1_1;
  reg        [3:0]    r_b2_0;
  reg        [3:0]    r_b2_1;
  reg        [3:0]    r_b3_0;
  reg        [3:0]    r_b3_1;
  reg        [3:0]    r_c_0;
  reg        [3:0]    r_c_1;

  G16Mul2SharesDepMul r_mul1 (
    .io_clk        (io_clk              ), //i
    .io_reset      (io_reset            ), //i
    .io_x_0        (r_a_0[3:0]          ), //i
    .io_x_1        (r_a_1[3:0]          ), //i
    .io_y_0        (r_b_0[3:0]          ), //i
    .io_y_1        (r_b_1[3:0]          ), //i
    .io_m          (r_mul1_io_m[7:0]    ), //i
    .io_z_0        (r_mul1_io_z_0[3:0]  ), //o
    .io_z_1        (r_mul1_io_z_1[3:0]  ), //o
    .io_clk_1      (io_clk              ), //i
    .io_reset_1    (io_reset            )  //i
  );
  G16Mul2SharesIndepMul r_mul2 (
    .io_clk      (io_clk              ), //i
    .io_reset    (io_reset            ), //i
    .io_x_0      (r_b3_0[3:0]         ), //i
    .io_x_1      (r_b3_1[3:0]         ), //i
    .io_y_0      (r_f_0[3:0]          ), //i
    .io_y_1      (r_f_1[3:0]          ), //i
    .io_m        (r_mul2_io_m[3:0]    ), //i
    .io_z_0      (r_mul2_io_z_0[3:0]  ), //o
    .io_z_1      (r_mul2_io_z_1[3:0]  )  //o
  );
  G16Mul2SharesIndepMul r_mul3 (
    .io_clk      (io_clk              ), //i
    .io_reset    (io_reset            ), //i
    .io_x_0      (r_a3_0[3:0]         ), //i
    .io_x_1      (r_a3_1[3:0]         ), //i
    .io_y_0      (r_f_0[3:0]          ), //i
    .io_y_1      (r_f_1[3:0]          ), //i
    .io_m        (r_mul3_io_m[3:0]    ), //i
    .io_z_0      (r_mul3_io_z_0[3:0]  ), //o
    .io_z_1      (r_mul3_io_z_1[3:0]  )  //o
  );
  G16Inv2SharesDep r_inv (
    .io_clk        (io_clk             ), //i
    .io_reset      (io_reset           ), //i
    .io_x_0        (r_inv_io_x_0[3:0]  ), //i
    .io_x_1        (r_inv_io_x_1[3:0]  ), //i
    .io_m          (r_inv_io_m[11:0]   ), //i
    .io_z_0        (r_inv_io_z_0[3:0]  ), //o
    .io_z_1        (r_inv_io_z_1[3:0]  ), //o
    .io_clk_1      (io_clk             ), //i
    .io_reset_1    (io_reset           )  //i
  );
  G16SqSc g16SqSc_2 (
    .io_t    (g16SqSc_2_io_t[3:0]  ), //i
    .io_x    (g16SqSc_2_io_x[3:0]  )  //o
  );
  G16SqSc g16SqSc_3 (
    .io_t    (g16SqSc_3_io_t[3:0]  ), //i
    .io_x    (g16SqSc_3_io_x[3:0]  )  //o
  );
  assign r_a_0 = io_x_0[7 : 4];
  assign r_b_0 = io_x_0[3 : 0];
  assign r_a_1 = io_x_1[7 : 4];
  assign r_b_1 = io_x_1[3 : 0];
  assign g16SqSc_2_io_t = (r_a_0 ^ r_b_0);
  assign g16SqSc_3_io_t = (r_a_1 ^ r_b_1);
  assign r_mul1_io_m = io_m[27 : 20];
  assign r_d_0 = r_mul1_io_z_0;
  assign r_d_1 = r_mul1_io_z_1;
  assign r_inv_io_x_0 = (r_c_0 ^ r_d_0);
  assign r_inv_io_x_1 = (r_c_1 ^ r_d_1);
  assign r_inv_io_m = io_m[19 : 8];
  assign r_f_0 = r_inv_io_z_0;
  assign r_f_1 = r_inv_io_z_1;
  assign r_mul2_io_m = io_m[7 : 4];
  assign r_p_0 = r_mul2_io_z_0;
  assign r_p_1 = r_mul2_io_z_1;
  assign r_mul3_io_m = io_m[3 : 0];
  assign r_q_0 = r_mul3_io_z_0;
  assign r_q_1 = r_mul3_io_z_1;
  assign io_z_0 = {r_p_0,r_q_0};
  assign io_z_1 = {r_p_1,r_q_1};
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      r_a1_0 <= 4'b0000;
      r_a1_1 <= 4'b0000;
      r_a2_0 <= 4'b0000;
      r_a2_1 <= 4'b0000;
      r_a3_0 <= 4'b0000;
      r_a3_1 <= 4'b0000;
      r_b1_0 <= 4'b0000;
      r_b1_1 <= 4'b0000;
      r_b2_0 <= 4'b0000;
      r_b2_1 <= 4'b0000;
      r_b3_0 <= 4'b0000;
      r_b3_1 <= 4'b0000;
      r_c_0 <= 4'b0000;
      r_c_1 <= 4'b0000;
    end else begin
      r_a1_0 <= r_a_0;
      r_a2_0 <= r_a1_0;
      r_a3_0 <= r_a2_0;
      r_b1_0 <= r_b_0;
      r_b2_0 <= r_b1_0;
      r_b3_0 <= r_b2_0;
      r_a1_1 <= r_a_1;
      r_a2_1 <= r_a1_1;
      r_a3_1 <= r_a2_1;
      r_b1_1 <= r_b_1;
      r_b2_1 <= r_b1_1;
      r_b3_1 <= r_b2_1;
      r_c_0 <= g16SqSc_2_io_x;
      r_c_1 <= g16SqSc_3_io_x;
    end
  end


endmodule

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

module NewBasis (
  input      [7:0]    io_input,
  input               io_direction,
  output reg [7:0]    io_output,
  input               io_clk,
  input               io_reset
);

  wire                dummy;
  wire       [7:0]    a;
  reg        [7:0]    b;
  reg        [7:0]    c;
  wire                when_NewBasis_l35;

  assign dummy = 1'b0;
  assign a = io_input;
  always @(*) begin
    b[7] = (((((a[7] ^ a[6]) ^ a[5]) ^ a[2]) ^ a[1]) ^ a[0]);
    b[6] = (((a[6] ^ a[5]) ^ a[4]) ^ a[0]);
    b[5] = (((a[6] ^ a[5]) ^ a[1]) ^ a[0]);
    b[4] = (((a[7] ^ a[6]) ^ a[5]) ^ a[0]);
    b[3] = ((((a[7] ^ a[4]) ^ a[3]) ^ a[1]) ^ a[0]);
    b[2] = a[0];
    b[1] = ((a[6] ^ a[5]) ^ a[0]);
    b[0] = ((((a[6] ^ a[3]) ^ a[2]) ^ a[1]) ^ a[0]);
  end

  always @(*) begin
    c[7] = (a[5] ^ a[3]);
    c[6] = (a[7] ^ a[3]);
    c[5] = (a[6] ^ a[0]);
    c[4] = ((a[7] ^ a[5]) ^ a[3]);
    c[3] = ((((a[7] ^ a[6]) ^ a[5]) ^ a[4]) ^ a[3]);
    c[2] = ((((a[6] ^ a[5]) ^ a[3]) ^ a[2]) ^ a[0]);
    c[1] = ((a[5] ^ a[4]) ^ a[1]);
    c[0] = ((a[6] ^ a[4]) ^ a[1]);
  end

  assign when_NewBasis_l35 = (! io_direction);
  always @(*) begin
    if(when_NewBasis_l35) begin
      io_output = b;
    end else begin
      io_output = c;
    end
  end


endmodule

//G16SqSc replaced by G16SqSc

module G16SqSc (
  input      [3:0]    io_t,
  output     [3:0]    io_x
);

  wire       [1:0]    square1_io_t;
  wire       [1:0]    square1_io_x;
  wire       [1:0]    square2_io_x;
  wire       [1:0]    scale_io_x;
  wire       [1:0]    a;
  wire       [1:0]    b;
  wire       [1:0]    c;
  wire       [1:0]    p;
  wire       [1:0]    q;

  G4Sq square1 (
    .io_t    (square1_io_t[1:0]  ), //i
    .io_x    (square1_io_x[1:0]  )  //o
  );
  G4Sq square2 (
    .io_t    (b[1:0]             ), //i
    .io_x    (square2_io_x[1:0]  )  //o
  );
  G4ScaleN2 scale (
    .io_t    (c[1:0]           ), //i
    .io_x    (scale_io_x[1:0]  )  //o
  );
  assign square1_io_t = (a ^ b);
  assign p = square1_io_x;
  assign c = square2_io_x;
  assign q = scale_io_x;
  assign a = io_t[3 : 2];
  assign b = io_t[1 : 0];
  assign io_x = {p,q};

endmodule

module G16Inv2SharesDep (
  input               io_clk,
  input               io_reset,
  input      [3:0]    io_x_0,
  input      [3:0]    io_x_1,
  input      [11:0]   io_m,
  output     [3:0]    io_z_0,
  output     [3:0]    io_z_1,
  input               io_clk_1,
  input               io_reset_1
);

  wire       [3:0]    g4Mul2SharesDepMul_3_io_m;
  wire       [3:0]    g4Mul2SharesDepMul_4_io_m;
  wire       [3:0]    g4Mul2SharesDepMul_5_io_m;
  wire       [1:0]    g4Sq_8_io_t;
  wire       [1:0]    g4Sq_9_io_t;
  wire       [1:0]    g4Sq_10_io_t;
  wire       [1:0]    g4Sq_11_io_t;
  wire       [1:0]    g4Mul2SharesDepMul_3_io_z_0;
  wire       [1:0]    g4Mul2SharesDepMul_3_io_z_1;
  wire       [1:0]    g4Mul2SharesDepMul_4_io_z_0;
  wire       [1:0]    g4Mul2SharesDepMul_4_io_z_1;
  wire       [1:0]    g4Mul2SharesDepMul_5_io_z_0;
  wire       [1:0]    g4Mul2SharesDepMul_5_io_z_1;
  wire       [1:0]    g4Sq_8_io_x;
  wire       [1:0]    g4ScaleN_16_io_x;
  wire       [1:0]    g4Sq_9_io_x;
  wire       [1:0]    g4Sq_10_io_x;
  wire       [1:0]    g4ScaleN_17_io_x;
  wire       [1:0]    g4Sq_11_io_x;
  wire       [1:0]    _zz_io_x_0;
  wire       [1:0]    _zz_io_x_1;
  wire       [1:0]    _zz_io_y_0;
  wire       [1:0]    _zz_io_y_1;
  wire       [1:0]    _zz_io_y_0_1;
  wire       [1:0]    _zz_io_y_1_1;
  reg        [1:0]    _zz_io_t;
  reg        [1:0]    _zz_io_t_1;
  reg        [1:0]    _zz_io_x_0_1;
  reg        [1:0]    _zz_io_x_1_1;
  reg        [1:0]    _zz_io_x_0_2;
  reg        [1:0]    _zz_io_x_1_2;

  G4Mul2SharesDepMul g4Mul2SharesDepMul_3 (
    .io_clk        (io_clk                            ), //i
    .io_reset      (io_reset                          ), //i
    .io_x_0        (_zz_io_x_0[1:0]                   ), //i
    .io_x_1        (_zz_io_x_1[1:0]                   ), //i
    .io_y_0        (_zz_io_y_0[1:0]                   ), //i
    .io_y_1        (_zz_io_y_1[1:0]                   ), //i
    .io_m          (g4Mul2SharesDepMul_3_io_m[3:0]    ), //i
    .io_z_0        (g4Mul2SharesDepMul_3_io_z_0[1:0]  ), //o
    .io_z_1        (g4Mul2SharesDepMul_3_io_z_1[1:0]  ), //o
    .io_clk_1      (io_clk_1                          ), //i
    .io_reset_1    (io_reset_1                        )  //i
  );
  G4Mul2SharesDepMul g4Mul2SharesDepMul_4 (
    .io_clk        (io_clk                            ), //i
    .io_reset      (io_reset                          ), //i
    .io_x_0        (_zz_io_x_0_2[1:0]                 ), //i
    .io_x_1        (_zz_io_x_1_2[1:0]                 ), //i
    .io_y_0        (_zz_io_y_0_1[1:0]                 ), //i
    .io_y_1        (_zz_io_y_1_1[1:0]                 ), //i
    .io_m          (g4Mul2SharesDepMul_4_io_m[3:0]    ), //i
    .io_z_0        (g4Mul2SharesDepMul_4_io_z_0[1:0]  ), //o
    .io_z_1        (g4Mul2SharesDepMul_4_io_z_1[1:0]  ), //o
    .io_clk_1      (io_clk_1                          ), //i
    .io_reset_1    (io_reset_1                        )  //i
  );
  G4Mul2SharesDepMul g4Mul2SharesDepMul_5 (
    .io_clk        (io_clk                            ), //i
    .io_reset      (io_reset                          ), //i
    .io_x_0        (_zz_io_x_0_1[1:0]                 ), //i
    .io_x_1        (_zz_io_x_1_1[1:0]                 ), //i
    .io_y_0        (_zz_io_y_0_1[1:0]                 ), //i
    .io_y_1        (_zz_io_y_1_1[1:0]                 ), //i
    .io_m          (g4Mul2SharesDepMul_5_io_m[3:0]    ), //i
    .io_z_0        (g4Mul2SharesDepMul_5_io_z_0[1:0]  ), //o
    .io_z_1        (g4Mul2SharesDepMul_5_io_z_1[1:0]  ), //o
    .io_clk_1      (io_clk_1                          ), //i
    .io_reset_1    (io_reset_1                        )  //i
  );
  G4Sq g4Sq_8 (
    .io_t    (g4Sq_8_io_t[1:0]  ), //i
    .io_x    (g4Sq_8_io_x[1:0]  )  //o
  );
  G4ScaleN g4ScaleN_16 (
    .io_t    (g4Sq_8_io_x[1:0]       ), //i
    .io_x    (g4ScaleN_16_io_x[1:0]  )  //o
  );
  G4Sq g4Sq_9 (
    .io_t    (g4Sq_9_io_t[1:0]  ), //i
    .io_x    (g4Sq_9_io_x[1:0]  )  //o
  );
  G4Sq g4Sq_10 (
    .io_t    (g4Sq_10_io_t[1:0]  ), //i
    .io_x    (g4Sq_10_io_x[1:0]  )  //o
  );
  G4ScaleN g4ScaleN_17 (
    .io_t    (g4Sq_10_io_x[1:0]      ), //i
    .io_x    (g4ScaleN_17_io_x[1:0]  )  //o
  );
  G4Sq g4Sq_11 (
    .io_t    (g4Sq_11_io_t[1:0]  ), //i
    .io_x    (g4Sq_11_io_x[1:0]  )  //o
  );
  assign _zz_io_x_0 = io_x_0[3 : 2];
  assign _zz_io_y_0 = io_x_0[1 : 0];
  assign g4Sq_8_io_t = (_zz_io_x_0 ^ _zz_io_y_0);
  assign g4Sq_9_io_t = (_zz_io_t ^ g4Mul2SharesDepMul_3_io_z_0);
  assign _zz_io_y_0_1 = g4Sq_9_io_x;
  assign _zz_io_x_1 = io_x_1[3 : 2];
  assign _zz_io_y_1 = io_x_1[1 : 0];
  assign g4Sq_10_io_t = (_zz_io_x_1 ^ _zz_io_y_1);
  assign g4Sq_11_io_t = (_zz_io_t_1 ^ g4Mul2SharesDepMul_3_io_z_1);
  assign _zz_io_y_1_1 = g4Sq_11_io_x;
  assign g4Mul2SharesDepMul_3_io_m = io_m[11 : 8];
  assign g4Mul2SharesDepMul_4_io_m = io_m[7 : 4];
  assign g4Mul2SharesDepMul_5_io_m = io_m[3 : 0];
  assign io_z_0 = {g4Mul2SharesDepMul_4_io_z_0,g4Mul2SharesDepMul_5_io_z_0};
  assign io_z_1 = {g4Mul2SharesDepMul_4_io_z_1,g4Mul2SharesDepMul_5_io_z_1};
  always @(posedge io_clk_1 or posedge io_reset_1) begin
    if(io_reset_1) begin
      _zz_io_t <= 2'b00;
      _zz_io_t_1 <= 2'b00;
      _zz_io_x_0_1 <= 2'b00;
      _zz_io_x_1_1 <= 2'b00;
      _zz_io_x_0_2 <= 2'b00;
      _zz_io_x_1_2 <= 2'b00;
    end else begin
      _zz_io_x_0_1 <= _zz_io_x_0;
      _zz_io_x_0_2 <= _zz_io_y_0;
      _zz_io_t <= g4ScaleN_16_io_x;
      _zz_io_x_1_1 <= _zz_io_x_1;
      _zz_io_x_1_2 <= _zz_io_y_1;
      _zz_io_t_1 <= g4ScaleN_17_io_x;
    end
  end


endmodule

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

module G16Mul2SharesIndepMul (
  input               io_clk,
  input               io_reset,
  input      [3:0]    io_x_0,
  input      [3:0]    io_x_1,
  input      [3:0]    io_y_0,
  input      [3:0]    io_y_1,
  input      [3:0]    io_m,
  output     [3:0]    io_z_0,
  output     [3:0]    io_z_1
);

  wire       [3:0]    r_mul1_io_x;
  wire       [3:0]    r_mul2_io_x;
  wire       [3:0]    r_mul3_io_x;
  wire       [3:0]    r_mul4_io_x;
  reg        [3:0]    r_r0;
  reg        [3:0]    r_r1;
  reg        [3:0]    r_r2;
  reg        [3:0]    r_r3;

  G16Mul r_mul1 (
    .io_a    (io_x_0[3:0]       ), //i
    .io_b    (io_y_0[3:0]       ), //i
    .io_x    (r_mul1_io_x[3:0]  )  //o
  );
  G16Mul r_mul2 (
    .io_a    (io_x_0[3:0]       ), //i
    .io_b    (io_y_1[3:0]       ), //i
    .io_x    (r_mul2_io_x[3:0]  )  //o
  );
  G16Mul r_mul3 (
    .io_a    (io_x_1[3:0]       ), //i
    .io_b    (io_y_0[3:0]       ), //i
    .io_x    (r_mul3_io_x[3:0]  )  //o
  );
  G16Mul r_mul4 (
    .io_a    (io_x_1[3:0]       ), //i
    .io_b    (io_y_1[3:0]       ), //i
    .io_x    (r_mul4_io_x[3:0]  )  //o
  );
  assign io_z_0 = (r_r0 ^ r_r1);
  assign io_z_1 = (r_r2 ^ r_r3);
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      r_r0 <= 4'b0000;
      r_r1 <= 4'b0000;
      r_r2 <= 4'b0000;
      r_r3 <= 4'b0000;
    end else begin
      r_r0 <= r_mul1_io_x;
      r_r1 <= (r_mul2_io_x ^ io_m);
      r_r2 <= (r_mul3_io_x ^ io_m);
      r_r3 <= r_mul4_io_x;
    end
  end


endmodule

module G16Mul2SharesDepMul (
  input               io_clk,
  input               io_reset,
  input      [3:0]    io_x_0,
  input      [3:0]    io_x_1,
  input      [3:0]    io_y_0,
  input      [3:0]    io_y_1,
  input      [7:0]    io_m,
  output     [3:0]    io_z_0,
  output     [3:0]    io_z_1,
  input               io_clk_1,
  input               io_reset_1
);

  wire       [3:0]    g16Mul_18_io_b;
  wire       [3:0]    g16Mul_19_io_b;
  wire       [3:0]    g16Mul_14_io_x;
  wire       [3:0]    g16Mul_15_io_x;
  wire       [3:0]    g16Mul_16_io_x;
  wire       [3:0]    g16Mul_17_io_x;
  wire       [3:0]    g16Mul_18_io_x;
  wire       [3:0]    g16Mul_19_io_x;
  reg        [3:0]    _zz_io_b;
  reg        [3:0]    _zz_io_b_1;
  reg        [3:0]    _zz_io_z_0;
  reg        [3:0]    _zz_io_z_1;
  reg        [3:0]    _zz_io_a;
  reg        [3:0]    _zz_io_a_1;
  reg        [3:0]    _zz_io_b_2;
  reg        [3:0]    _zz_io_b_3;

  G16Mul g16Mul_14 (
    .io_a    (_zz_io_a[3:0]        ), //i
    .io_b    (_zz_io_b[3:0]        ), //i
    .io_x    (g16Mul_14_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_15 (
    .io_a    (_zz_io_a_1[3:0]      ), //i
    .io_b    (_zz_io_b_1[3:0]      ), //i
    .io_x    (g16Mul_15_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_16 (
    .io_a    (_zz_io_a[3:0]        ), //i
    .io_b    (_zz_io_b_2[3:0]      ), //i
    .io_x    (g16Mul_16_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_17 (
    .io_a    (_zz_io_a_1[3:0]      ), //i
    .io_b    (_zz_io_b_3[3:0]      ), //i
    .io_x    (g16Mul_17_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_18 (
    .io_a    (io_x_0[3:0]          ), //i
    .io_b    (g16Mul_18_io_b[3:0]  ), //i
    .io_x    (g16Mul_18_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_19 (
    .io_a    (io_x_1[3:0]          ), //i
    .io_b    (g16Mul_19_io_b[3:0]  ), //i
    .io_x    (g16Mul_19_io_x[3:0]  )  //o
  );
  assign io_z_0 = ((g16Mul_16_io_x ^ g16Mul_14_io_x) ^ _zz_io_z_0);
  assign io_z_1 = ((g16Mul_17_io_x ^ g16Mul_15_io_x) ^ _zz_io_z_1);
  assign g16Mul_18_io_b = io_m[7 : 4];
  assign g16Mul_19_io_b = io_m[7 : 4];
  always @(posedge io_clk_1 or posedge io_reset_1) begin
    if(io_reset_1) begin
      _zz_io_b <= 4'b0000;
      _zz_io_b_1 <= 4'b0000;
      _zz_io_z_0 <= 4'b0000;
      _zz_io_z_1 <= 4'b0000;
      _zz_io_a <= 4'b0000;
      _zz_io_a_1 <= 4'b0000;
      _zz_io_b_2 <= 4'b0000;
      _zz_io_b_3 <= 4'b0000;
    end else begin
      _zz_io_a <= io_x_0;
      _zz_io_a_1 <= io_x_1;
      _zz_io_b_2 <= io_y_0;
      _zz_io_b_3 <= io_y_1;
      _zz_io_b <= (io_y_1 ^ io_m[7 : 4]);
      _zz_io_b_1 <= (io_y_0 ^ io_m[7 : 4]);
      _zz_io_z_0 <= (g16Mul_18_io_x ^ io_m[3 : 0]);
      _zz_io_z_1 <= (g16Mul_19_io_x ^ io_m[3 : 0]);
    end
  end


endmodule

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

module G4ScaleN2 (
  input      [1:0]    io_t,
  output     [1:0]    io_x
);


  assign io_x = {(io_t[1] ^ io_t[0]),io_t[1]};

endmodule

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

module G4Sq (
  input      [1:0]    io_t,
  output     [1:0]    io_x
);


  assign io_x = {io_t[0],io_t[1]};

endmodule

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

module G4Mul2SharesDepMul (
  input               io_clk,
  input               io_reset,
  input      [1:0]    io_x_0,
  input      [1:0]    io_x_1,
  input      [1:0]    io_y_0,
  input      [1:0]    io_y_1,
  input      [3:0]    io_m,
  output     [1:0]    io_z_0,
  output     [1:0]    io_z_1,
  input               io_clk_1,
  input               io_reset_1
);

  wire       [1:0]    g4Mul_64_io_b;
  wire       [1:0]    g4Mul_65_io_b;
  wire       [1:0]    g4Mul_60_io_x;
  wire       [1:0]    g4Mul_61_io_x;
  wire       [1:0]    g4Mul_62_io_x;
  wire       [1:0]    g4Mul_63_io_x;
  wire       [1:0]    g4Mul_64_io_x;
  wire       [1:0]    g4Mul_65_io_x;
  reg        [1:0]    _zz_io_b;
  reg        [1:0]    _zz_io_b_1;
  reg        [1:0]    _zz_io_z_0;
  reg        [1:0]    _zz_io_z_1;
  reg        [1:0]    _zz_io_a;
  reg        [1:0]    _zz_io_a_1;
  reg        [1:0]    _zz_io_b_2;
  reg        [1:0]    _zz_io_b_3;

  G4Mul g4Mul_60 (
    .io_a    (_zz_io_a[1:0]       ), //i
    .io_b    (_zz_io_b[1:0]       ), //i
    .io_x    (g4Mul_60_io_x[1:0]  )  //o
  );
  G4Mul g4Mul_61 (
    .io_a    (_zz_io_a_1[1:0]     ), //i
    .io_b    (_zz_io_b_1[1:0]     ), //i
    .io_x    (g4Mul_61_io_x[1:0]  )  //o
  );
  G4Mul g4Mul_62 (
    .io_a    (_zz_io_a[1:0]       ), //i
    .io_b    (_zz_io_b_2[1:0]     ), //i
    .io_x    (g4Mul_62_io_x[1:0]  )  //o
  );
  G4Mul g4Mul_63 (
    .io_a    (_zz_io_a_1[1:0]     ), //i
    .io_b    (_zz_io_b_3[1:0]     ), //i
    .io_x    (g4Mul_63_io_x[1:0]  )  //o
  );
  G4Mul g4Mul_64 (
    .io_a    (io_x_0[1:0]         ), //i
    .io_b    (g4Mul_64_io_b[1:0]  ), //i
    .io_x    (g4Mul_64_io_x[1:0]  )  //o
  );
  G4Mul g4Mul_65 (
    .io_a    (io_x_1[1:0]         ), //i
    .io_b    (g4Mul_65_io_b[1:0]  ), //i
    .io_x    (g4Mul_65_io_x[1:0]  )  //o
  );
  assign io_z_0 = ((g4Mul_62_io_x ^ g4Mul_60_io_x) ^ _zz_io_z_0);
  assign io_z_1 = ((g4Mul_63_io_x ^ g4Mul_61_io_x) ^ _zz_io_z_1);
  assign g4Mul_64_io_b = io_m[3 : 2];
  assign g4Mul_65_io_b = io_m[3 : 2];
  always @(posedge io_clk_1 or posedge io_reset_1) begin
    if(io_reset_1) begin
      _zz_io_b <= 2'b00;
      _zz_io_b_1 <= 2'b00;
      _zz_io_z_0 <= 2'b00;
      _zz_io_z_1 <= 2'b00;
      _zz_io_a <= 2'b00;
      _zz_io_a_1 <= 2'b00;
      _zz_io_b_2 <= 2'b00;
      _zz_io_b_3 <= 2'b00;
    end else begin
      _zz_io_a <= io_x_0;
      _zz_io_a_1 <= io_x_1;
      _zz_io_b_2 <= io_y_0;
      _zz_io_b_3 <= io_y_1;
      _zz_io_b <= (io_y_1 ^ io_m[3 : 2]);
      _zz_io_b_1 <= (io_y_0 ^ io_m[3 : 2]);
      _zz_io_z_0 <= (g4Mul_64_io_x ^ io_m[1 : 0]);
      _zz_io_z_1 <= (g4Mul_65_io_x ^ io_m[1 : 0]);
    end
  end


endmodule

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

module G16Mul (
  input      [3:0]    io_a,
  input      [3:0]    io_b,
  output     [3:0]    io_x
);

  wire       [1:0]    mul1_io_a;
  wire       [1:0]    mul1_io_b;
  wire       [1:0]    mul1_io_x;
  wire       [1:0]    mul2_io_x;
  wire       [1:0]    mul3_io_x;
  wire       [1:0]    scale_io_x;
  wire       [1:0]    a;
  wire       [1:0]    b;
  wire       [1:0]    c;
  wire       [1:0]    d;
  wire       [1:0]    e;
  wire       [1:0]    f;
  wire       [1:0]    p;
  wire       [1:0]    q;

  G4Mul mul1 (
    .io_a    (mul1_io_a[1:0]  ), //i
    .io_b    (mul1_io_b[1:0]  ), //i
    .io_x    (mul1_io_x[1:0]  )  //o
  );
  G4Mul mul2 (
    .io_a    (a[1:0]          ), //i
    .io_b    (c[1:0]          ), //i
    .io_x    (mul2_io_x[1:0]  )  //o
  );
  G4Mul mul3 (
    .io_a    (b[1:0]          ), //i
    .io_b    (d[1:0]          ), //i
    .io_x    (mul3_io_x[1:0]  )  //o
  );
  G4ScaleN scale (
    .io_t    (e[1:0]           ), //i
    .io_x    (scale_io_x[1:0]  )  //o
  );
  assign mul1_io_a = (a ^ b);
  assign mul1_io_b = (c ^ d);
  assign e = mul1_io_x;
  assign f = scale_io_x;
  assign p = (mul2_io_x ^ f);
  assign q = (mul3_io_x ^ f);
  assign a = io_a[3 : 2];
  assign b = io_a[1 : 0];
  assign c = io_b[3 : 2];
  assign d = io_b[1 : 0];
  assign io_x = {p,q};

endmodule

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

module G4ScaleN (
  input      [1:0]    io_t,
  output     [1:0]    io_x
);


  assign io_x = {io_t[0],(io_t[1] ^ io_t[0])};

endmodule

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

module G4Mul (
  input      [1:0]    io_a,
  input      [1:0]    io_b,
  output     [1:0]    io_x
);

  wire       [0:0]    a;
  wire       [0:0]    b;
  wire       [0:0]    c;
  wire       [0:0]    d;
  wire       [0:0]    e;
  wire       [0:0]    p;
  wire       [0:0]    q;

  assign a = io_a[1];
  assign b = io_a[0];
  assign c = io_b[1];
  assign d = io_b[0];
  assign e = ((a ^ b) & (c ^ d));
  assign p = ((a & c) ^ e);
  assign q = ((b & d) ^ e);
  assign io_x = {p,q};

endmodule
