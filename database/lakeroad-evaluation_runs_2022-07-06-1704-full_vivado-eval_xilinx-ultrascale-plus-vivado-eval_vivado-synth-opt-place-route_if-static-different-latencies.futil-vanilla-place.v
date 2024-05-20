// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 03:25:42 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route//if-static-different-latencies.futil-vanilla-place.v
// Design      : main
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "af301be9" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module main
   (go,
    clk,
    reset,
    done,
    .i_addr0(\<const0> ),
    i_write_data,
    i_write_en,
    i_clk,
    i_read_data,
    i_done);
  input go;
  input clk;
  input reset;
  output done;
  output [31:0]i_write_data;
  output i_write_en;
  output i_clk;
  input [31:0]i_read_data;
  input i_done;
  output \<const0> ;

  wire \<const0> ;
  wire clk;
  wire comb_reg_done;
  wire cond0_go_in;
  wire done;
  wire go;
  wire i_done;
  wire [31:0]i_read_data;
  wire [31:0]i_write_data;
  wire i_write_en;
  wire reset;
  wire t0_done;
  wire t1_done;
  wire t1_write_en;
  wire t2_done;
  wire t2_write_en;
  wire t3_done;
  wire t3_write_en;
  wire t4_done;
  wire t4_write_en;
  wire true_go_in;

  assign i_clk = clk;
  GND GND
       (.G(\<const0> ));
  std_reg__parameterized0 comb_reg
       (.clk(clk),
        .comb_reg_done(comb_reg_done),
        .cond0_go_in(cond0_go_in),
        .reset(reset));
  std_reg__parameterized1 fsm
       (.clk(clk),
        .comb_reg_done(comb_reg_done),
        .cond0_go_in(cond0_go_in),
        .done(done),
        .go(go),
        .i_done(i_done),
        .i_read_data(i_read_data),
        .i_write_data(i_write_data),
        .i_write_en(i_write_en),
        .reset(reset),
        .t0_done(t0_done),
        .t1_done(t1_done),
        .t1_write_en(t1_write_en),
        .t2_done(t2_done),
        .t2_write_en(t2_write_en),
        .t3_done(t3_done),
        .t3_write_en(t3_write_en),
        .t4_done(t4_done),
        .t4_write_en(t4_write_en),
        .true_go_in(true_go_in));
  std_reg t0
       (.clk(clk),
        .reset(reset),
        .t0_done(t0_done),
        .true_go_in(true_go_in));
  std_reg_0 t1
       (.clk(clk),
        .reset(reset),
        .t1_done(t1_done),
        .t1_write_en(t1_write_en));
  std_reg_1 t2
       (.clk(clk),
        .reset(reset),
        .t2_done(t2_done),
        .t2_write_en(t2_write_en));
  std_reg_2 t3
       (.clk(clk),
        .reset(reset),
        .t3_done(t3_done),
        .t3_write_en(t3_write_en));
  std_reg_3 t4
       (.clk(clk),
        .reset(reset),
        .t4_done(t4_done),
        .t4_write_en(t4_write_en));
endmodule

module std_reg
   (t0_done,
    reset,
    true_go_in,
    clk);
  output t0_done;
  input reset;
  input true_go_in;
  input clk;

  wire \<const1> ;
  wire clk;
  wire reset;
  wire t0_done;
  wire true_go_in;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(true_go_in),
        .Q(t0_done),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg_0
   (t1_done,
    reset,
    t1_write_en,
    clk);
  output t1_done;
  input reset;
  input t1_write_en;
  input clk;

  wire \<const1> ;
  wire clk;
  wire reset;
  wire t1_done;
  wire t1_write_en;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(t1_write_en),
        .Q(t1_done),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg_1
   (t2_done,
    reset,
    t2_write_en,
    clk);
  output t2_done;
  input reset;
  input t2_write_en;
  input clk;

  wire \<const1> ;
  wire clk;
  wire reset;
  wire t2_done;
  wire t2_write_en;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(t2_write_en),
        .Q(t2_done),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg_2
   (t3_done,
    reset,
    t3_write_en,
    clk);
  output t3_done;
  input reset;
  input t3_write_en;
  input clk;

  wire \<const1> ;
  wire clk;
  wire reset;
  wire t3_done;
  wire t3_write_en;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(t3_write_en),
        .Q(t3_done),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg_3
   (t4_done,
    reset,
    t4_write_en,
    clk);
  output t4_done;
  input reset;
  input t4_write_en;
  input clk;

  wire \<const1> ;
  wire clk;
  wire reset;
  wire t4_done;
  wire t4_write_en;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(t4_write_en),
        .Q(t4_done),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized0
   (comb_reg_done,
    reset,
    cond0_go_in,
    clk);
  output comb_reg_done;
  input reset;
  input cond0_go_in;
  input clk;

  wire \<const1> ;
  wire clk;
  wire comb_reg_done;
  wire cond0_go_in;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(cond0_go_in),
        .Q(comb_reg_done),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized1
   (i_write_data,
    done,
    cond0_go_in,
    i_write_en,
    t2_write_en,
    t4_write_en,
    t3_write_en,
    t1_write_en,
    true_go_in,
    i_done,
    go,
    i_read_data,
    t4_done,
    comb_reg_done,
    reset,
    clk,
    t1_done,
    t3_done,
    t2_done,
    t0_done);
  output [31:0]i_write_data;
  output done;
  output cond0_go_in;
  output i_write_en;
  output t2_write_en;
  output t4_write_en;
  output t3_write_en;
  output t1_write_en;
  output true_go_in;
  input i_done;
  input go;
  input [31:0]i_read_data;
  input t4_done;
  input comb_reg_done;
  input reset;
  input clk;
  input t1_done;
  input t3_done;
  input t2_done;
  input t0_done;

  wire \<const0> ;
  wire GND_2;
  wire [31:0]add_out;
  wire clk;
  wire comb_reg_done;
  wire cond0_go_in;
  wire done;
  wire [1:0]fsm_out;
  wire fsm_write_en;
  wire go;
  wire i_done;
  wire [31:0]i_read_data;
  wire [31:0]i_write_data;
  wire \i_write_data[15]_INST_0_i_1_n_0 ;
  wire \i_write_data[15]_INST_0_i_2_n_0 ;
  wire \i_write_data[15]_INST_0_i_3_n_0 ;
  wire \i_write_data[15]_INST_0_i_4_n_0 ;
  wire \i_write_data[15]_INST_0_i_5_n_0 ;
  wire \i_write_data[15]_INST_0_i_6_n_0 ;
  wire \i_write_data[15]_INST_0_i_7_n_0 ;
  wire \i_write_data[15]_INST_0_i_8_n_0 ;
  wire \i_write_data[15]_INST_0_i_9_n_0 ;
  wire \i_write_data[23]_INST_0_i_1_n_0 ;
  wire \i_write_data[23]_INST_0_i_2_n_0 ;
  wire \i_write_data[23]_INST_0_i_3_n_0 ;
  wire \i_write_data[23]_INST_0_i_4_n_0 ;
  wire \i_write_data[23]_INST_0_i_5_n_0 ;
  wire \i_write_data[23]_INST_0_i_6_n_0 ;
  wire \i_write_data[23]_INST_0_i_7_n_0 ;
  wire \i_write_data[23]_INST_0_i_8_n_0 ;
  wire \i_write_data[23]_INST_0_i_9_n_0 ;
  wire \i_write_data[31]_INST_0_i_2_n_0 ;
  wire \i_write_data[31]_INST_0_i_3_n_0 ;
  wire \i_write_data[31]_INST_0_i_4_n_0 ;
  wire \i_write_data[31]_INST_0_i_5_n_0 ;
  wire \i_write_data[31]_INST_0_i_6_n_0 ;
  wire \i_write_data[31]_INST_0_i_7_n_0 ;
  wire \i_write_data[31]_INST_0_i_8_n_0 ;
  wire \i_write_data[31]_INST_0_i_9_n_0 ;
  wire \i_write_data[7]_INST_0_i_10_n_0 ;
  wire \i_write_data[7]_INST_0_i_1_n_0 ;
  wire \i_write_data[7]_INST_0_i_2_n_0 ;
  wire \i_write_data[7]_INST_0_i_3_n_0 ;
  wire \i_write_data[7]_INST_0_i_4_n_0 ;
  wire \i_write_data[7]_INST_0_i_5_n_0 ;
  wire \i_write_data[7]_INST_0_i_6_n_0 ;
  wire \i_write_data[7]_INST_0_i_7_n_0 ;
  wire \i_write_data[7]_INST_0_i_8_n_0 ;
  wire \i_write_data[7]_INST_0_i_9_n_0 ;
  wire i_write_en;
  wire \out[0]_i_1_n_0 ;
  wire \out[1]_i_2_n_0 ;
  wire reset;
  wire t0_done;
  wire t1_done;
  wire t1_write_en;
  wire t2_done;
  wire t2_write_en;
  wire t3_done;
  wire t3_write_en;
  wire t4_done;
  wire t4_write_en;
  wire true_go_in;
  wire [7:0]\NLW_i_write_data[15]_INST_0_i_1_CO_UNCONNECTED ;
  wire [7:0]\NLW_i_write_data[23]_INST_0_i_1_CO_UNCONNECTED ;
  wire [7:0]\NLW_i_write_data[7]_INST_0_i_1_CO_UNCONNECTED ;

  GND GND
       (.G(\<const0> ));
  GND GND_1
       (.G(GND_2));
  LUT2 #(
    .INIT(4'h8)) 
    done_INST_0
       (.I0(fsm_out[1]),
        .I1(fsm_out[0]),
        .O(done));
  LUT4 #(
    .INIT(16'h0002)) 
    done_i_1
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(comb_reg_done),
        .O(cond0_go_in));
  LUT5 #(
    .INIT(32'h04000000)) 
    done_i_1__0
       (.I0(t4_done),
        .I1(go),
        .I2(fsm_out[1]),
        .I3(fsm_out[0]),
        .I4(t1_done),
        .O(t2_write_en));
  LUT5 #(
    .INIT(32'h00200000)) 
    done_i_1__1
       (.I0(t3_done),
        .I1(t4_done),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .O(t4_write_en));
  LUT5 #(
    .INIT(32'h04000000)) 
    done_i_1__2
       (.I0(t4_done),
        .I1(go),
        .I2(fsm_out[1]),
        .I3(fsm_out[0]),
        .I4(t2_done),
        .O(t3_write_en));
  LUT5 #(
    .INIT(32'h00200000)) 
    done_i_1__3
       (.I0(t0_done),
        .I1(t4_done),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .O(t1_write_en));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    done_i_1__4
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(go),
        .I3(t4_done),
        .O(true_go_in));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[0]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[0]),
        .O(i_write_data[0]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[10]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[10]),
        .O(i_write_data[10]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[11]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[11]),
        .O(i_write_data[11]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[12]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[12]),
        .O(i_write_data[12]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[13]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[13]),
        .O(i_write_data[13]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[14]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[14]),
        .O(i_write_data[14]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[15]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[15]),
        .O(i_write_data[15]));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \i_write_data[15]_INST_0_i_1 
       (.CI(\i_write_data[7]_INST_0_i_1_n_0 ),
        .CI_TOP(GND_2),
        .CO({\i_write_data[15]_INST_0_i_1_n_0 ,\NLW_i_write_data[15]_INST_0_i_1_CO_UNCONNECTED [6:0]}),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(add_out[15:8]),
        .S({\i_write_data[15]_INST_0_i_2_n_0 ,\i_write_data[15]_INST_0_i_3_n_0 ,\i_write_data[15]_INST_0_i_4_n_0 ,\i_write_data[15]_INST_0_i_5_n_0 ,\i_write_data[15]_INST_0_i_6_n_0 ,\i_write_data[15]_INST_0_i_7_n_0 ,\i_write_data[15]_INST_0_i_8_n_0 ,\i_write_data[15]_INST_0_i_9_n_0 }));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[15]_INST_0_i_2 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[15]),
        .O(\i_write_data[15]_INST_0_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[15]_INST_0_i_3 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[14]),
        .O(\i_write_data[15]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[15]_INST_0_i_4 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[13]),
        .O(\i_write_data[15]_INST_0_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[15]_INST_0_i_5 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[12]),
        .O(\i_write_data[15]_INST_0_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[15]_INST_0_i_6 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[11]),
        .O(\i_write_data[15]_INST_0_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[15]_INST_0_i_7 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[10]),
        .O(\i_write_data[15]_INST_0_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[15]_INST_0_i_8 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[9]),
        .O(\i_write_data[15]_INST_0_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[15]_INST_0_i_9 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[8]),
        .O(\i_write_data[15]_INST_0_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[16]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[16]),
        .O(i_write_data[16]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[17]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[17]),
        .O(i_write_data[17]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[18]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[18]),
        .O(i_write_data[18]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[19]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[19]),
        .O(i_write_data[19]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[1]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[1]),
        .O(i_write_data[1]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[20]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[20]),
        .O(i_write_data[20]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[21]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[21]),
        .O(i_write_data[21]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[22]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[22]),
        .O(i_write_data[22]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[23]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[23]),
        .O(i_write_data[23]));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \i_write_data[23]_INST_0_i_1 
       (.CI(\i_write_data[15]_INST_0_i_1_n_0 ),
        .CI_TOP(GND_2),
        .CO({\i_write_data[23]_INST_0_i_1_n_0 ,\NLW_i_write_data[23]_INST_0_i_1_CO_UNCONNECTED [6:0]}),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(add_out[23:16]),
        .S({\i_write_data[23]_INST_0_i_2_n_0 ,\i_write_data[23]_INST_0_i_3_n_0 ,\i_write_data[23]_INST_0_i_4_n_0 ,\i_write_data[23]_INST_0_i_5_n_0 ,\i_write_data[23]_INST_0_i_6_n_0 ,\i_write_data[23]_INST_0_i_7_n_0 ,\i_write_data[23]_INST_0_i_8_n_0 ,\i_write_data[23]_INST_0_i_9_n_0 }));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[23]_INST_0_i_2 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[23]),
        .O(\i_write_data[23]_INST_0_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[23]_INST_0_i_3 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[22]),
        .O(\i_write_data[23]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[23]_INST_0_i_4 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[21]),
        .O(\i_write_data[23]_INST_0_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[23]_INST_0_i_5 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[20]),
        .O(\i_write_data[23]_INST_0_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[23]_INST_0_i_6 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[19]),
        .O(\i_write_data[23]_INST_0_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[23]_INST_0_i_7 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[18]),
        .O(\i_write_data[23]_INST_0_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[23]_INST_0_i_8 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[17]),
        .O(\i_write_data[23]_INST_0_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[23]_INST_0_i_9 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[16]),
        .O(\i_write_data[23]_INST_0_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[24]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[24]),
        .O(i_write_data[24]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[25]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[25]),
        .O(i_write_data[25]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[26]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[26]),
        .O(i_write_data[26]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[27]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[27]),
        .O(i_write_data[27]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[28]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[28]),
        .O(i_write_data[28]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[29]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[29]),
        .O(i_write_data[29]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[2]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[2]),
        .O(i_write_data[2]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[30]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[30]),
        .O(i_write_data[30]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[31]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[31]),
        .O(i_write_data[31]));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \i_write_data[31]_INST_0_i_1 
       (.CI(\i_write_data[23]_INST_0_i_1_n_0 ),
        .CI_TOP(GND_2),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(add_out[31:24]),
        .S({\i_write_data[31]_INST_0_i_2_n_0 ,\i_write_data[31]_INST_0_i_3_n_0 ,\i_write_data[31]_INST_0_i_4_n_0 ,\i_write_data[31]_INST_0_i_5_n_0 ,\i_write_data[31]_INST_0_i_6_n_0 ,\i_write_data[31]_INST_0_i_7_n_0 ,\i_write_data[31]_INST_0_i_8_n_0 ,\i_write_data[31]_INST_0_i_9_n_0 }));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[31]_INST_0_i_2 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[31]),
        .O(\i_write_data[31]_INST_0_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[31]_INST_0_i_3 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[30]),
        .O(\i_write_data[31]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[31]_INST_0_i_4 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[29]),
        .O(\i_write_data[31]_INST_0_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[31]_INST_0_i_5 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[28]),
        .O(\i_write_data[31]_INST_0_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[31]_INST_0_i_6 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[27]),
        .O(\i_write_data[31]_INST_0_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[31]_INST_0_i_7 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[26]),
        .O(\i_write_data[31]_INST_0_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[31]_INST_0_i_8 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[25]),
        .O(\i_write_data[31]_INST_0_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[31]_INST_0_i_9 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[24]),
        .O(\i_write_data[31]_INST_0_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[3]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[3]),
        .O(i_write_data[3]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[4]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[4]),
        .O(i_write_data[4]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[5]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[5]),
        .O(i_write_data[5]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[6]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[6]),
        .O(i_write_data[6]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[7]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[7]),
        .O(i_write_data[7]));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \i_write_data[7]_INST_0_i_1 
       (.CI(\<const0> ),
        .CI_TOP(GND_2),
        .CO({\i_write_data[7]_INST_0_i_1_n_0 ,\NLW_i_write_data[7]_INST_0_i_1_CO_UNCONNECTED [6:0]}),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\i_write_data[7]_INST_0_i_2_n_0 }),
        .O(add_out[7:0]),
        .S({\i_write_data[7]_INST_0_i_3_n_0 ,\i_write_data[7]_INST_0_i_4_n_0 ,\i_write_data[7]_INST_0_i_5_n_0 ,\i_write_data[7]_INST_0_i_6_n_0 ,\i_write_data[7]_INST_0_i_7_n_0 ,\i_write_data[7]_INST_0_i_8_n_0 ,\i_write_data[7]_INST_0_i_9_n_0 ,\i_write_data[7]_INST_0_i_10_n_0 }));
  LUT5 #(
    .INIT(32'h00100000)) 
    \i_write_data[7]_INST_0_i_10 
       (.I0(i_read_data[0]),
        .I1(i_done),
        .I2(go),
        .I3(fsm_out[0]),
        .I4(fsm_out[1]),
        .O(\i_write_data[7]_INST_0_i_10_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[7]_INST_0_i_2 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[0]),
        .O(\i_write_data[7]_INST_0_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[7]_INST_0_i_3 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[7]),
        .O(\i_write_data[7]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[7]_INST_0_i_4 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[6]),
        .O(\i_write_data[7]_INST_0_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[7]_INST_0_i_5 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[5]),
        .O(\i_write_data[7]_INST_0_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[7]_INST_0_i_6 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[4]),
        .O(\i_write_data[7]_INST_0_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[7]_INST_0_i_7 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[3]),
        .O(\i_write_data[7]_INST_0_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[7]_INST_0_i_8 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[2]),
        .O(\i_write_data[7]_INST_0_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[7]_INST_0_i_9 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(i_read_data[1]),
        .O(\i_write_data[7]_INST_0_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[8]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[8]),
        .O(i_write_data[8]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \i_write_data[9]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(add_out[9]),
        .O(i_write_data[9]));
  LUT4 #(
    .INIT(16'h0020)) 
    i_write_en_INST_0
       (.I0(fsm_out[1]),
        .I1(fsm_out[0]),
        .I2(go),
        .I3(i_done),
        .O(i_write_en));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00A08800)) 
    \out[0]_i_1 
       (.I0(go),
        .I1(t4_done),
        .I2(i_done),
        .I3(fsm_out[0]),
        .I4(fsm_out[1]),
        .O(\out[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFCAFFCA0F000F000)) 
    \out[1]_i_1 
       (.I0(i_done),
        .I1(t4_done),
        .I2(fsm_out[1]),
        .I3(fsm_out[0]),
        .I4(comb_reg_done),
        .I5(go),
        .O(fsm_write_en));
  LUT6 #(
    .INIT(64'h0000C0C0A0A0F000)) 
    \out[1]_i_2 
       (.I0(t4_done),
        .I1(i_done),
        .I2(go),
        .I3(comb_reg_done),
        .I4(fsm_out[0]),
        .I5(fsm_out[1]),
        .O(\out[1]_i_2_n_0 ));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(\out[0]_i_1_n_0 ),
        .Q(fsm_out[0]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(\out[1]_i_2_n_0 ),
        .Q(fsm_out[1]),
        .R(reset));
endmodule
