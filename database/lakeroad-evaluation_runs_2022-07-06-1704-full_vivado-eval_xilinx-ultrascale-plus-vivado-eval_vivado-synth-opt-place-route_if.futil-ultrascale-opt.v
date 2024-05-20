// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 03:32:02 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route//if.futil-ultrascale-opt.v
// Design      : main
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module lakeroad_xilinx_ultrascale_plus_ult32_2
   (out0,
    a);
  output out0;
  input [0:0]a;

  wire \<const0> ;
  wire \<const1> ;
  wire ONE;
  wire [0:0]a;
  wire [7:7]co_11;
  wire [7:7]co_3;
  wire [7:7]co_7;
  wire [7:0]luts_O5_0;
  wire [7:0]luts_O6_1;
  wire out0;
  wire [7:0]NLW_carry_17_CO_UNCONNECTED;
  wire [7:0]NLW_carry_26_CO_UNCONNECTED;
  wire [7:0]NLW_carry_35_CO_UNCONNECTED;
  wire [7:0]NLW_carry_8_CO_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
    C_LUT_2
       (.I0(a),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[2]),
        .O6(luts_O6_1[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT1 #(
    .INIT(2'h1)) 
    D_LUT_3
       (.I0(a),
        .O(luts_O6_1[3]));
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
    carry_17
       (.CI(co_3),
        .CI_TOP(\<const0> ),
        .CO({co_7,NLW_carry_17_CO_UNCONNECTED[6:0]}),
        .DI({ONE,ONE,ONE,ONE,ONE,ONE,ONE,ONE}),
        .S({ONE,ONE,ONE,ONE,ONE,ONE,ONE,ONE}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry_26
       (.CI(co_7),
        .CI_TOP(\<const0> ),
        .CO({co_11,NLW_carry_26_CO_UNCONNECTED[6:0]}),
        .DI({ONE,ONE,ONE,ONE,ONE,ONE,ONE,ONE}),
        .S({ONE,ONE,ONE,ONE,ONE,ONE,ONE,ONE}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry_35
       (.CI(co_11),
        .CI_TOP(\<const0> ),
        .CO({out0,NLW_carry_35_CO_UNCONNECTED[6:0]}),
        .DI({ONE,ONE,ONE,ONE,ONE,ONE,ONE,ONE}),
        .S({ONE,ONE,ONE,ONE,ONE,ONE,ONE,ONE}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry_8
       (.CI(\<const0> ),
        .CI_TOP(\<const0> ),
        .CO({co_3,NLW_carry_8_CO_UNCONNECTED[6:0]}),
        .DI({ONE,ONE,ONE,ONE,ONE,luts_O5_0[2],ONE,ONE}),
        .S({ONE,ONE,ONE,ONE,luts_O6_1[3:2],ONE,ONE}));
endmodule

(* NETLIST_CHECKSUM = "89e24698" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module main
   (go,
    clk,
    reset,
    done,
    mem_addr0,
    mem_write_data,
    mem_write_en,
    mem_clk,
    mem_read_data,
    mem_done);
  input go;
  input clk;
  input reset;
  output done;
  output mem_addr0;
  output [31:0]mem_write_data;
  output mem_write_en;
  output mem_clk;
  input [31:0]mem_read_data;
  input mem_done;

  wire \<const0> ;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_n_2;
  wire comb_reg_n_3;
  wire comb_reg_out;
  wire cond0_go_in;
  wire done;
  wire fsm_n_0;
  wire [1:0]fsm_out;
  wire go;
  wire lt_out;
  wire mem_done;
  wire [3:2]\^mem_write_data ;
  wire mem_write_en;
  wire reset;

  assign mem_addr0 = \<const0> ;
  assign mem_clk = clk;
  assign mem_write_data[31] = \<const0> ;
  assign mem_write_data[30] = \<const0> ;
  assign mem_write_data[29] = \<const0> ;
  assign mem_write_data[28] = \<const0> ;
  assign mem_write_data[27] = \<const0> ;
  assign mem_write_data[26] = \<const0> ;
  assign mem_write_data[25] = \<const0> ;
  assign mem_write_data[24] = \<const0> ;
  assign mem_write_data[23] = \<const0> ;
  assign mem_write_data[22] = \<const0> ;
  assign mem_write_data[21] = \<const0> ;
  assign mem_write_data[20] = \<const0> ;
  assign mem_write_data[19] = \<const0> ;
  assign mem_write_data[18] = \<const0> ;
  assign mem_write_data[17] = \<const0> ;
  assign mem_write_data[16] = \<const0> ;
  assign mem_write_data[15] = \<const0> ;
  assign mem_write_data[14] = \<const0> ;
  assign mem_write_data[13] = \<const0> ;
  assign mem_write_data[12] = \<const0> ;
  assign mem_write_data[11] = \<const0> ;
  assign mem_write_data[10] = \<const0> ;
  assign mem_write_data[9] = \<const0> ;
  assign mem_write_data[8] = \<const0> ;
  assign mem_write_data[7] = \<const0> ;
  assign mem_write_data[6] = \<const0> ;
  assign mem_write_data[5] = \<const0> ;
  assign mem_write_data[4] = \<const0> ;
  assign mem_write_data[3:2] = \^mem_write_data [3:2];
  assign mem_write_data[1] = \^mem_write_data [3];
  assign mem_write_data[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  std_reg comb_reg
       (.D({comb_reg_n_2,comb_reg_n_3}),
        .Q(fsm_out),
        .a(cond0_go_in),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .go(go),
        .mem_done(mem_done),
        .\out_reg[0]_0 (fsm_n_0),
        .reset(reset));
  std_reg__parameterized0 fsm
       (.D({comb_reg_n_2,comb_reg_n_3}),
        .Q(fsm_out),
        .a(cond0_go_in),
        .carry_35(fsm_n_0),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .done(done),
        .go(go),
        .mem_done(mem_done),
        .mem_write_data(\^mem_write_data ),
        .mem_write_en(mem_write_en),
        .out0(lt_out),
        .reset(reset));
  std_lt lt
       (.a(cond0_go_in),
        .out0(lt_out));
endmodule

module std_lt
   (out0,
    a);
  output out0;
  input [0:0]a;

  wire [0:0]a;
  wire out0;

  lakeroad_xilinx_ultrascale_plus_ult32_2 _impl
       (.a(a),
        .out0(out0));
endmodule

module std_reg
   (comb_reg_done,
    comb_reg_out,
    D,
    reset,
    a,
    clk,
    \out_reg[0]_0 ,
    go,
    mem_done,
    Q);
  output comb_reg_done;
  output comb_reg_out;
  output [1:0]D;
  input reset;
  input [0:0]a;
  input clk;
  input \out_reg[0]_0 ;
  input go;
  input mem_done;
  input [1:0]Q;

  wire \<const1> ;
  wire [1:0]D;
  wire [1:0]Q;
  wire [0:0]a;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire go;
  wire mem_done;
  wire \out_reg[0]_0 ;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(a),
        .Q(comb_reg_done),
        .R(reset));
  LUT6 #(
    .INIT(64'h000088888888C000)) 
    \out[0]_i_1__0 
       (.I0(mem_done),
        .I1(go),
        .I2(comb_reg_out),
        .I3(comb_reg_done),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h0000CC00CC004040)) 
    \out[1]_i_2 
       (.I0(comb_reg_out),
        .I1(go),
        .I2(comb_reg_done),
        .I3(mem_done),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(D[1]));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\out_reg[0]_0 ),
        .Q(comb_reg_out),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized0
   (carry_35,
    Q,
    done,
    a,
    mem_write_data,
    mem_write_en,
    out0,
    comb_reg_done,
    go,
    comb_reg_out,
    reset,
    D,
    clk,
    mem_done);
  output carry_35;
  output [1:0]Q;
  output done;
  output [0:0]a;
  output [1:0]mem_write_data;
  output mem_write_en;
  input out0;
  input comb_reg_done;
  input go;
  input comb_reg_out;
  input reset;
  input [1:0]D;
  input clk;
  input mem_done;

  wire [1:0]D;
  wire [1:0]Q;
  wire [0:0]a;
  wire carry_35;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire done;
  wire fsm_write_en;
  wire go;
  wire mem_done;
  wire [1:0]mem_write_data;
  wire mem_write_en;
  wire out0;
  wire reset;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    A_LUT_0_i_1
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(comb_reg_done),
        .I3(go),
        .O(a));
  LUT2 #(
    .INIT(4'h8)) 
    done_INST_0
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(done));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \mem_write_data[1]_INST_0 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(go),
        .I3(mem_done),
        .O(mem_write_data[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0040)) 
    \mem_write_data[2]_INST_0 
       (.I0(mem_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .O(mem_write_data[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0440)) 
    mem_write_en_INST_0
       (.I0(mem_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .O(mem_write_en));
  LUT6 #(
    .INIT(64'hFFFEFFFF00020000)) 
    \out[0]_i_1 
       (.I0(out0),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(comb_reg_done),
        .I4(go),
        .I5(comb_reg_out),
        .O(carry_35));
  LUT5 #(
    .INIT(32'hEBC0E8C0)) 
    \out[1]_i_1 
       (.I0(mem_done),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(go),
        .I4(comb_reg_done),
        .O(fsm_write_en));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(D[0]),
        .Q(Q[0]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(D[1]),
        .Q(Q[1]),
        .R(reset));
endmodule
