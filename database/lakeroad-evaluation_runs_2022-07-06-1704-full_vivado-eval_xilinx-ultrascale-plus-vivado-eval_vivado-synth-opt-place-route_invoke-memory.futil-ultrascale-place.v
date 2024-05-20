// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 03:19:13 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route//invoke-memory.futil-ultrascale-place.v
// Design      : main
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module copy
   (d_addr0,
    d_write_data,
    d_write_en,
    done,
    reset,
    clk,
    go,
    d_done,
    s_read_data);
  output [2:0]d_addr0;
  output [31:0]d_write_data;
  output d_write_en;
  output done;
  input reset;
  input clk;
  input go;
  input d_done;
  input [31:0]s_read_data;

  wire N_done;
  wire [2:0]N_out;
  wire [2:0]add_left;
  wire [2:0]add_out;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire cond0_go_in;
  wire [2:0]d_addr0;
  wire d_done;
  wire [31:0]d_write_data;
  wire d_write_en;
  wire done;
  wire go;
  wire [2:0]lt_left;
  wire lt_n_0;
  wire reset;
  wire [31:0]s_read_data;
  wire upd_index_go_in;

  std_reg N
       (.E(upd_index_go_in),
        .N_done(N_done),
        .Q(N_out),
        .clk(clk),
        .out0(add_out),
        .reset(reset));
  std_add add
       (.a(add_left),
        .b(upd_index_go_in),
        .out0(add_out));
  std_reg__parameterized0 comb_reg
       (.b(cond0_go_in),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .\out_reg[0]_0 (lt_n_0),
        .reset(reset));
  std_reg_0 fsm
       (.N_done(N_done),
        .Q(N_out),
        .a(add_left),
        .b(upd_index_go_in),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .d_addr0(d_addr0),
        .d_done(d_done),
        .d_write_data(d_write_data),
        .d_write_en(d_write_en),
        .done(done),
        .done_reg(lt_left),
        .go(go),
        .\out_reg[1]_0 (cond0_go_in),
        .reset(reset),
        .s_read_data(s_read_data));
  std_lt lt
       (.a(lt_left),
        .b(cond0_go_in),
        .carry_8(lt_n_0),
        .comb_reg_out(comb_reg_out));
endmodule

module lakeroad_xilinx_ultrascale_plus_add3_2
   (out0,
    a,
    b);
  output [2:0]out0;
  input [2:0]a;
  input [0:0]b;

  wire \<const0> ;
  wire \<const1> ;
  wire ZERO;
  wire [2:0]a;
  wire [0:0]b;
  wire [7:0]luts_O5_0;
  wire [7:0]luts_O6_1;
  wire [2:0]out0;

  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    A_LUT_0
       (.I0(a[0]),
        .I1(b),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[0]),
        .O6(luts_O6_1[0]));
  GND GND
       (.G(\<const0> ));
  (* OPT_MODIFIED = "PROPCONST" *) 
  GND GND_1
       (.G(ZERO));
  VCC VCC
       (.P(\<const1> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry_8
       (.CI(\<const0> ),
        .CI_TOP(\<const0> ),
        .DI({ZERO,ZERO,ZERO,ZERO,ZERO,ZERO,ZERO,luts_O5_0[0]}),
        .O(out0),
        .S({ZERO,ZERO,ZERO,ZERO,ZERO,a[2:1],luts_O6_1[0]}));
endmodule

module lakeroad_xilinx_ultrascale_plus_ult3_2
   (carry_8_0,
    b,
    comb_reg_out,
    a);
  output carry_8_0;
  input [0:0]b;
  input comb_reg_out;
  input [2:0]a;

  wire \<const0> ;
  wire \<const1> ;
  wire ONE;
  wire [2:0]a;
  wire [0:0]b;
  wire carry_8_0;
  wire comb_reg_out;
  wire lt_out;
  wire [7:0]luts_O5_0;
  wire [7:0]luts_O6_1;
  wire [7:0]NLW_carry_8_CO_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
    A_LUT_0
       (.I0(a[0]),
        .I1(b),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[0]),
        .O6(luts_O6_1[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
    B_LUT_1
       (.I0(a[1]),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[1]),
        .O6(luts_O6_1[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
    C_LUT_2
       (.I0(a[2]),
        .I1(b),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[2]),
        .O6(luts_O6_1[2]));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* OPT_MODIFIED = "PROPCONST" *) 
  VCC VCC_1
       (.P(ONE));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry_8
       (.CI(\<const0> ),
        .CI_TOP(\<const0> ),
        .CO({lt_out,NLW_carry_8_CO_UNCONNECTED[6:0]}),
        .DI({ONE,ONE,ONE,ONE,ONE,luts_O5_0[2:0]}),
        .S({ONE,ONE,ONE,ONE,ONE,luts_O6_1[2:0]}));
  LUT3 #(
    .INIT(8'hB8)) 
    \out[0]_i_1__0 
       (.I0(lt_out),
        .I1(b),
        .I2(comb_reg_out),
        .O(carry_8_0));
endmodule

(* ECO_CHECKSUM = "94628400" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module main
   (go,
    clk,
    reset,
    done,
    d_addr0,
    d_write_data,
    d_write_en,
    d_clk,
    d_read_data,
    d_done,
    s_addr0,
    s_write_data,
    s_write_en,
    s_clk,
    s_read_data,
    s_done);
  input go;
  input clk;
  input reset;
  output done;
  output [2:0]d_addr0;
  output [31:0]d_write_data;
  output d_write_en;
  output d_clk;
  input [31:0]d_read_data;
  input d_done;
  output [2:0]s_addr0;
  output [31:0]s_write_data;
  output s_write_en;
  output s_clk;
  input [31:0]s_read_data;
  input s_done;

  wire \<const0> ;
  wire clk;
  wire [2:0]d_addr0;
  wire d_done;
  wire [31:0]d_write_data;
  wire d_write_en;
  wire done;
  wire go;
  wire reset;
  wire [31:0]s_read_data;

  assign d_clk = clk;
  assign s_addr0[2:0] = d_addr0;
  assign s_clk = clk;
  assign s_write_data[31] = \<const0> ;
  assign s_write_data[30] = \<const0> ;
  assign s_write_data[29] = \<const0> ;
  assign s_write_data[28] = \<const0> ;
  assign s_write_data[27] = \<const0> ;
  assign s_write_data[26] = \<const0> ;
  assign s_write_data[25] = \<const0> ;
  assign s_write_data[24] = \<const0> ;
  assign s_write_data[23] = \<const0> ;
  assign s_write_data[22] = \<const0> ;
  assign s_write_data[21] = \<const0> ;
  assign s_write_data[20] = \<const0> ;
  assign s_write_data[19] = \<const0> ;
  assign s_write_data[18] = \<const0> ;
  assign s_write_data[17] = \<const0> ;
  assign s_write_data[16] = \<const0> ;
  assign s_write_data[15] = \<const0> ;
  assign s_write_data[14] = \<const0> ;
  assign s_write_data[13] = \<const0> ;
  assign s_write_data[12] = \<const0> ;
  assign s_write_data[11] = \<const0> ;
  assign s_write_data[10] = \<const0> ;
  assign s_write_data[9] = \<const0> ;
  assign s_write_data[8] = \<const0> ;
  assign s_write_data[7] = \<const0> ;
  assign s_write_data[6] = \<const0> ;
  assign s_write_data[5] = \<const0> ;
  assign s_write_data[4] = \<const0> ;
  assign s_write_data[3] = \<const0> ;
  assign s_write_data[2] = \<const0> ;
  assign s_write_data[1] = \<const0> ;
  assign s_write_data[0] = \<const0> ;
  assign s_write_en = \<const0> ;
  GND GND
       (.G(\<const0> ));
  copy copy0
       (.clk(clk),
        .d_addr0(d_addr0),
        .d_done(d_done),
        .d_write_data(d_write_data),
        .d_write_en(d_write_en),
        .done(done),
        .go(go),
        .reset(reset),
        .s_read_data(s_read_data));
endmodule

module std_add
   (out0,
    a,
    b);
  output [2:0]out0;
  input [2:0]a;
  input [0:0]b;

  wire [2:0]a;
  wire [0:0]b;
  wire [2:0]out0;

  lakeroad_xilinx_ultrascale_plus_add3_2 _impl
       (.a(a),
        .b(b),
        .out0(out0));
endmodule

module std_lt
   (carry_8,
    b,
    comb_reg_out,
    a);
  output carry_8;
  input [0:0]b;
  input comb_reg_out;
  input [2:0]a;

  wire [2:0]a;
  wire [0:0]b;
  wire carry_8;
  wire comb_reg_out;

  lakeroad_xilinx_ultrascale_plus_ult3_2 _impl
       (.a(a),
        .b(b),
        .carry_8_0(carry_8),
        .comb_reg_out(comb_reg_out));
endmodule

module std_reg
   (N_done,
    Q,
    reset,
    E,
    clk,
    out0);
  output N_done;
  output [2:0]Q;
  input reset;
  input [0:0]E;
  input clk;
  input [2:0]out0;

  wire \<const1> ;
  wire [0:0]E;
  wire N_done;
  wire [2:0]Q;
  wire clk;
  wire [2:0]out0;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(E),
        .Q(N_done),
        .R(reset));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(E),
        .D(out0[0]),
        .Q(Q[0]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(E),
        .D(out0[1]),
        .Q(Q[1]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(E),
        .D(out0[2]),
        .Q(Q[2]),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg_0
   (a,
    b,
    done_reg,
    \out_reg[1]_0 ,
    d_addr0,
    d_write_data,
    d_write_en,
    done,
    go,
    reset,
    clk,
    N_done,
    Q,
    comb_reg_done,
    d_done,
    comb_reg_out,
    s_read_data);
  output [2:0]a;
  output [0:0]b;
  output [2:0]done_reg;
  output [0:0]\out_reg[1]_0 ;
  output [2:0]d_addr0;
  output [31:0]d_write_data;
  output d_write_en;
  output done;
  input go;
  input reset;
  input clk;
  input N_done;
  input [2:0]Q;
  input comb_reg_done;
  input d_done;
  input comb_reg_out;
  input [31:0]s_read_data;

  wire N_done;
  wire [2:0]Q;
  wire [2:0]a;
  wire [0:0]b;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire [2:0]d_addr0;
  wire d_done;
  wire [31:0]d_write_data;
  wire d_write_en;
  wire done;
  wire [2:0]done_reg;
  wire [2:0]fsm_in;
  wire [2:0]fsm_out;
  wire fsm_write_en;
  wire go;
  wire \out[0]_i_2_n_0 ;
  wire \out[2]_i_3_n_0 ;
  wire \out[2]_i_4_n_0 ;
  wire [0:0]\out_reg[1]_0 ;
  wire reset;
  wire [31:0]s_read_data;

  LUT6 #(
    .INIT(64'h0010000000000000)) 
    A_LUT_0_i_1
       (.I0(fsm_out[0]),
        .I1(N_done),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(Q[0]),
        .O(a[0]));
  LUT6 #(
    .INIT(64'h0400010000000000)) 
    A_LUT_0_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[2]),
        .I3(go),
        .I4(fsm_out[1]),
        .I5(Q[0]),
        .O(done_reg[0]));
  LUT5 #(
    .INIT(32'h00000020)) 
    A_LUT_0_i_2
       (.I0(fsm_out[1]),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(N_done),
        .I4(fsm_out[0]),
        .O(b));
  LUT5 #(
    .INIT(32'h00000804)) 
    A_LUT_0_i_2__0
       (.I0(fsm_out[1]),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[0]),
        .I4(comb_reg_done),
        .O(\out_reg[1]_0 ));
  LUT6 #(
    .INIT(64'h0010000000000000)) 
    B_LUT_1_i_1
       (.I0(fsm_out[0]),
        .I1(N_done),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(Q[1]),
        .O(a[1]));
  LUT6 #(
    .INIT(64'h0400010000000000)) 
    B_LUT_1_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[2]),
        .I3(go),
        .I4(fsm_out[1]),
        .I5(Q[1]),
        .O(done_reg[1]));
  LUT6 #(
    .INIT(64'h0010000000000000)) 
    C_LUT_2_i_1
       (.I0(fsm_out[0]),
        .I1(N_done),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(Q[2]),
        .O(a[2]));
  LUT6 #(
    .INIT(64'h0400010000000000)) 
    C_LUT_2_i_1__0
       (.I0(comb_reg_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[2]),
        .I3(go),
        .I4(fsm_out[1]),
        .I5(Q[2]),
        .O(done_reg[2]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[0]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[0]),
        .O(d_write_data[0]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[10]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[10]),
        .O(d_write_data[10]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[11]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[11]),
        .O(d_write_data[11]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[12]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[12]),
        .O(d_write_data[12]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[13]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[13]),
        .O(d_write_data[13]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[14]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[14]),
        .O(d_write_data[14]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[15]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[15]),
        .O(d_write_data[15]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[16]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[16]),
        .O(d_write_data[16]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[17]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[17]),
        .O(d_write_data[17]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[18]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[18]),
        .O(d_write_data[18]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[19]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[19]),
        .O(d_write_data[19]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[1]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[1]),
        .O(d_write_data[1]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[20]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[20]),
        .O(d_write_data[20]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[21]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[21]),
        .O(d_write_data[21]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[22]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[22]),
        .O(d_write_data[22]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[23]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[23]),
        .O(d_write_data[23]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[24]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[24]),
        .O(d_write_data[24]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[25]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[25]),
        .O(d_write_data[25]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[26]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[26]),
        .O(d_write_data[26]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[27]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[27]),
        .O(d_write_data[27]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[28]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[28]),
        .O(d_write_data[28]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[29]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[29]),
        .O(d_write_data[29]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[2]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[2]),
        .O(d_write_data[2]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[30]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[30]),
        .O(d_write_data[30]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[31]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[31]),
        .O(d_write_data[31]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[3]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[3]),
        .O(d_write_data[3]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[4]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[4]),
        .O(d_write_data[4]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[5]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[5]),
        .O(d_write_data[5]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[6]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[6]),
        .O(d_write_data[6]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[7]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[7]),
        .O(d_write_data[7]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[8]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[8]),
        .O(d_write_data[8]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \d_write_data[9]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(s_read_data[9]),
        .O(d_write_data[9]));
  LUT5 #(
    .INIT(32'h00100000)) 
    d_write_en_INST_0
       (.I0(d_done),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .O(d_write_en));
  LUT3 #(
    .INIT(8'h04)) 
    done_INST_0
       (.I0(fsm_out[1]),
        .I1(fsm_out[2]),
        .I2(fsm_out[0]),
        .O(done));
  LUT6 #(
    .INIT(64'h80008000F8000800)) 
    \out[0]_i_1 
       (.I0(comb_reg_done),
        .I1(comb_reg_out),
        .I2(fsm_out[1]),
        .I3(\out[0]_i_2_n_0 ),
        .I4(N_done),
        .I5(fsm_out[0]),
        .O(fsm_in[0]));
  LUT2 #(
    .INIT(4'h2)) 
    \out[0]_i_2 
       (.I0(go),
        .I1(fsm_out[2]),
        .O(\out[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000300000008800)) 
    \out[1]_i_1 
       (.I0(d_done),
        .I1(fsm_out[0]),
        .I2(N_done),
        .I3(go),
        .I4(fsm_out[2]),
        .I5(fsm_out[1]),
        .O(fsm_in[1]));
  LUT6 #(
    .INIT(64'h0000000008000200)) 
    \out[2]_i_2 
       (.I0(comb_reg_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[2]),
        .I3(go),
        .I4(fsm_out[1]),
        .I5(comb_reg_out),
        .O(fsm_in[2]));
  LUT6 #(
    .INIT(64'h0000333330008080)) 
    \out[2]_i_3 
       (.I0(d_done),
        .I1(fsm_out[0]),
        .I2(go),
        .I3(N_done),
        .I4(fsm_out[1]),
        .I5(fsm_out[2]),
        .O(\out[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0033FCBB00330000)) 
    \out[2]_i_4 
       (.I0(d_done),
        .I1(fsm_out[0]),
        .I2(N_done),
        .I3(fsm_out[1]),
        .I4(fsm_out[2]),
        .I5(go),
        .O(\out[2]_i_4_n_0 ));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(fsm_in[0]),
        .Q(fsm_out[0]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(fsm_in[1]),
        .Q(fsm_out[1]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(fsm_in[2]),
        .Q(fsm_out[2]),
        .R(reset));
  MUXF7 \out_reg[2]_i_1 
       (.I0(\out[2]_i_3_n_0 ),
        .I1(\out[2]_i_4_n_0 ),
        .O(fsm_write_en),
        .S(comb_reg_done));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \s_addr0[0]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(Q[0]),
        .O(d_addr0[0]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \s_addr0[1]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(Q[1]),
        .O(d_addr0[1]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \s_addr0[2]_INST_0 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(d_done),
        .I5(Q[2]),
        .O(d_addr0[2]));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized0
   (comb_reg_done,
    comb_reg_out,
    reset,
    b,
    clk,
    \out_reg[0]_0 );
  output comb_reg_done;
  output comb_reg_out;
  input reset;
  input [0:0]b;
  input clk;
  input \out_reg[0]_0 ;

  wire \<const1> ;
  wire [0:0]b;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire \out_reg[0]_0 ;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(b),
        .Q(comb_reg_done),
        .R(reset));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\out_reg[0]_0 ),
        .Q(comb_reg_out),
        .R(reset));
endmodule
