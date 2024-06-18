// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 03:14:52 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route//while.futil-vanilla-synth.v
// Design      : main
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

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
  wire comb_reg_out;
  wire cond0_go_in;
  wire done;
  wire fsm_n_33;
  wire fsm_n_34;
  wire fsm_n_35;
  wire fsm_n_36;
  wire fsm_n_37;
  wire fsm_n_38;
  wire fsm_n_39;
  wire fsm_n_40;
  wire fsm_n_41;
  wire fsm_n_42;
  wire fsm_n_43;
  wire fsm_n_44;
  wire fsm_n_45;
  wire fsm_n_46;
  wire fsm_n_47;
  wire fsm_n_48;
  wire fsm_n_49;
  wire go;
  wire i_done;
  wire [31:0]i_read_data;
  wire [31:0]i_write_data;
  wire i_write_en;
  wire lt_out;
  wire reset;

  assign i_clk = clk;
  GND GND
       (.G(\<const0> ));
  std_reg comb_reg
       (.CO(lt_out),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .cond0_go_in(cond0_go_in),
        .\out_reg[0]_0 (fsm_n_40),
        .reset(reset));
  std_reg__parameterized0 fsm
       (.DI(fsm_n_49),
        .S({fsm_n_33,fsm_n_34,fsm_n_35,fsm_n_36,fsm_n_37,fsm_n_38,fsm_n_39}),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .cond0_go_in(cond0_go_in),
        .done(done),
        .go(go),
        .i_done(i_done),
        .i_read_data(i_read_data),
        .\i_read_data[17] ({fsm_n_41,fsm_n_42,fsm_n_43,fsm_n_44,fsm_n_45,fsm_n_46,fsm_n_47,fsm_n_48}),
        .i_write_data(i_write_data),
        .i_write_en(i_write_en),
        .\out_reg[0]_0 (fsm_n_40),
        .reset(reset));
  std_lt lt
       (.CO(lt_out),
        .DI(fsm_n_49),
        .S({fsm_n_33,fsm_n_34,fsm_n_35,fsm_n_36,fsm_n_37,fsm_n_38,fsm_n_39}),
        .out_carry__0_0({fsm_n_41,fsm_n_42,fsm_n_43,fsm_n_44,fsm_n_45,fsm_n_46,fsm_n_47,fsm_n_48}));
endmodule

module std_lt
   (CO,
    DI,
    out_carry__0_0,
    S);
  output [0:0]CO;
  input [0:0]DI;
  input [7:0]out_carry__0_0;
  input [6:0]S;

  wire \<const0> ;
  wire [0:0]CO;
  wire [0:0]DI;
  wire GND_2;
  wire [6:0]S;
  wire [7:0]out_carry__0_0;
  wire out_carry__0_n_2;
  wire out_carry__0_n_3;
  wire out_carry__0_n_4;
  wire out_carry__0_n_5;
  wire out_carry__0_n_6;
  wire out_carry__0_n_7;
  wire out_carry_n_0;
  wire out_carry_n_1;
  wire out_carry_n_2;
  wire out_carry_n_3;
  wire out_carry_n_4;
  wire out_carry_n_5;
  wire out_carry_n_6;
  wire out_carry_n_7;

  GND GND
       (.G(\<const0> ));
  GND GND_1
       (.G(GND_2));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY8 out_carry
       (.CI(\<const0> ),
        .CI_TOP(GND_2),
        .CO({out_carry_n_0,out_carry_n_1,out_carry_n_2,out_carry_n_3,out_carry_n_4,out_carry_n_5,out_carry_n_6,out_carry_n_7}),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,DI}),
        .S(out_carry__0_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY8 out_carry__0
       (.CI(out_carry_n_0),
        .CI_TOP(GND_2),
        .CO({CO,out_carry__0_n_2,out_carry__0_n_3,out_carry__0_n_4,out_carry__0_n_5,out_carry__0_n_6,out_carry__0_n_7}),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .S({\<const0> ,S}));
endmodule

module std_reg
   (comb_reg_done,
    comb_reg_out,
    reset,
    cond0_go_in,
    clk,
    \out_reg[0]_0 ,
    CO);
  output comb_reg_done;
  output comb_reg_out;
  input reset;
  input cond0_go_in;
  input clk;
  input \out_reg[0]_0 ;
  input [0:0]CO;

  wire \<const1> ;
  wire [0:0]CO;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire cond0_go_in;
  wire \out[0]_i_1__0_n_0 ;
  wire \out_reg[0]_0 ;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(cond0_go_in),
        .Q(comb_reg_done),
        .R(reset));
  LUT3 #(
    .INIT(8'hB8)) 
    \out[0]_i_1__0 
       (.I0(comb_reg_out),
        .I1(\out_reg[0]_0 ),
        .I2(CO),
        .O(\out[0]_i_1__0_n_0 ));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\out[0]_i_1__0_n_0 ),
        .Q(comb_reg_out),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized0
   (i_write_en,
    i_write_data,
    S,
    \out_reg[0]_0 ,
    \i_read_data[17] ,
    DI,
    cond0_go_in,
    done,
    i_read_data,
    go,
    i_done,
    reset,
    clk,
    comb_reg_done,
    comb_reg_out);
  output i_write_en;
  output [31:0]i_write_data;
  output [6:0]S;
  output \out_reg[0]_0 ;
  output [7:0]\i_read_data[17] ;
  output [0:0]DI;
  output cond0_go_in;
  output done;
  input [31:0]i_read_data;
  input go;
  input i_done;
  input reset;
  input clk;
  input comb_reg_done;
  input comb_reg_out;

  wire \<const0> ;
  wire [0:0]DI;
  wire GND_2;
  wire [6:0]S;
  wire [31:0]add_out;
  wire [31:1]add_right;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire cond0_go_in;
  wire done;
  wire [2:0]fsm_out;
  wire fsm_write_en;
  wire go;
  wire i_done;
  wire [31:0]i_read_data;
  wire [7:0]\i_read_data[17] ;
  wire [31:0]i_write_data;
  wire \i_write_data[15]_INST_0_i_1_n_0 ;
  wire \i_write_data[15]_INST_0_i_1_n_1 ;
  wire \i_write_data[15]_INST_0_i_1_n_2 ;
  wire \i_write_data[15]_INST_0_i_1_n_3 ;
  wire \i_write_data[15]_INST_0_i_1_n_4 ;
  wire \i_write_data[15]_INST_0_i_1_n_5 ;
  wire \i_write_data[15]_INST_0_i_1_n_6 ;
  wire \i_write_data[15]_INST_0_i_1_n_7 ;
  wire \i_write_data[23]_INST_0_i_1_n_0 ;
  wire \i_write_data[23]_INST_0_i_1_n_1 ;
  wire \i_write_data[23]_INST_0_i_1_n_2 ;
  wire \i_write_data[23]_INST_0_i_1_n_3 ;
  wire \i_write_data[23]_INST_0_i_1_n_4 ;
  wire \i_write_data[23]_INST_0_i_1_n_5 ;
  wire \i_write_data[23]_INST_0_i_1_n_6 ;
  wire \i_write_data[23]_INST_0_i_1_n_7 ;
  wire \i_write_data[31]_INST_0_i_1_n_1 ;
  wire \i_write_data[31]_INST_0_i_1_n_2 ;
  wire \i_write_data[31]_INST_0_i_1_n_3 ;
  wire \i_write_data[31]_INST_0_i_1_n_4 ;
  wire \i_write_data[31]_INST_0_i_1_n_5 ;
  wire \i_write_data[31]_INST_0_i_1_n_6 ;
  wire \i_write_data[31]_INST_0_i_1_n_7 ;
  wire \i_write_data[7]_INST_0_i_1_n_0 ;
  wire \i_write_data[7]_INST_0_i_1_n_1 ;
  wire \i_write_data[7]_INST_0_i_1_n_2 ;
  wire \i_write_data[7]_INST_0_i_1_n_3 ;
  wire \i_write_data[7]_INST_0_i_1_n_4 ;
  wire \i_write_data[7]_INST_0_i_1_n_5 ;
  wire \i_write_data[7]_INST_0_i_1_n_6 ;
  wire \i_write_data[7]_INST_0_i_1_n_7 ;
  wire \i_write_data[7]_INST_0_i_9_n_0 ;
  wire i_write_en;
  wire \out[0]_i_1_n_0 ;
  wire \out[0]_i_2_n_0 ;
  wire \out[1]_i_1_n_0 ;
  wire \out[2]_i_2_n_0 ;
  wire \out_reg[0]_0 ;
  wire reset;

  GND GND
       (.G(\<const0> ));
  GND GND_1
       (.G(GND_2));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h04)) 
    done_INST_0
       (.I0(fsm_out[1]),
        .I1(fsm_out[2]),
        .I2(fsm_out[0]),
        .O(done));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h04000004)) 
    done_i_1
       (.I0(comb_reg_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .O(cond0_go_in));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[0]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[0]),
        .O(i_write_data[0]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[10]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[10]),
        .O(i_write_data[10]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[11]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[11]),
        .O(i_write_data[11]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[12]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[12]),
        .O(i_write_data[12]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[13]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[13]),
        .O(i_write_data[13]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[14]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[14]),
        .O(i_write_data[14]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[15]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[15]),
        .O(i_write_data[15]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \i_write_data[15]_INST_0_i_1 
       (.CI(\i_write_data[7]_INST_0_i_1_n_0 ),
        .CI_TOP(GND_2),
        .CO({\i_write_data[15]_INST_0_i_1_n_0 ,\i_write_data[15]_INST_0_i_1_n_1 ,\i_write_data[15]_INST_0_i_1_n_2 ,\i_write_data[15]_INST_0_i_1_n_3 ,\i_write_data[15]_INST_0_i_1_n_4 ,\i_write_data[15]_INST_0_i_1_n_5 ,\i_write_data[15]_INST_0_i_1_n_6 ,\i_write_data[15]_INST_0_i_1_n_7 }),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(add_out[15:8]),
        .S(add_right[15:8]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[15]_INST_0_i_2 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[15]),
        .O(add_right[15]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[15]_INST_0_i_3 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[14]),
        .O(add_right[14]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[15]_INST_0_i_4 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[13]),
        .O(add_right[13]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[15]_INST_0_i_5 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[12]),
        .O(add_right[12]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[15]_INST_0_i_6 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[11]),
        .O(add_right[11]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[15]_INST_0_i_7 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[10]),
        .O(add_right[10]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[15]_INST_0_i_8 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[9]),
        .O(add_right[9]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[15]_INST_0_i_9 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[8]),
        .O(add_right[8]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[16]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[16]),
        .O(i_write_data[16]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[17]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[17]),
        .O(i_write_data[17]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[18]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[18]),
        .O(i_write_data[18]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[19]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[19]),
        .O(i_write_data[19]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[1]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[1]),
        .O(i_write_data[1]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[20]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[20]),
        .O(i_write_data[20]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[21]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[21]),
        .O(i_write_data[21]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[22]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[22]),
        .O(i_write_data[22]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[23]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[23]),
        .O(i_write_data[23]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \i_write_data[23]_INST_0_i_1 
       (.CI(\i_write_data[15]_INST_0_i_1_n_0 ),
        .CI_TOP(GND_2),
        .CO({\i_write_data[23]_INST_0_i_1_n_0 ,\i_write_data[23]_INST_0_i_1_n_1 ,\i_write_data[23]_INST_0_i_1_n_2 ,\i_write_data[23]_INST_0_i_1_n_3 ,\i_write_data[23]_INST_0_i_1_n_4 ,\i_write_data[23]_INST_0_i_1_n_5 ,\i_write_data[23]_INST_0_i_1_n_6 ,\i_write_data[23]_INST_0_i_1_n_7 }),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(add_out[23:16]),
        .S(add_right[23:16]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[23]_INST_0_i_2 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[23]),
        .O(add_right[23]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[23]_INST_0_i_3 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[22]),
        .O(add_right[22]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[23]_INST_0_i_4 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[21]),
        .O(add_right[21]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[23]_INST_0_i_5 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[20]),
        .O(add_right[20]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[23]_INST_0_i_6 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[19]),
        .O(add_right[19]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[23]_INST_0_i_7 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[18]),
        .O(add_right[18]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[23]_INST_0_i_8 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[17]),
        .O(add_right[17]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[23]_INST_0_i_9 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[16]),
        .O(add_right[16]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[24]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[24]),
        .O(i_write_data[24]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[25]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[25]),
        .O(i_write_data[25]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[26]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[26]),
        .O(i_write_data[26]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[27]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[27]),
        .O(i_write_data[27]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[28]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[28]),
        .O(i_write_data[28]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[29]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[29]),
        .O(i_write_data[29]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[2]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[2]),
        .O(i_write_data[2]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[30]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[30]),
        .O(i_write_data[30]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[31]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[31]),
        .O(i_write_data[31]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \i_write_data[31]_INST_0_i_1 
       (.CI(\i_write_data[23]_INST_0_i_1_n_0 ),
        .CI_TOP(GND_2),
        .CO({\i_write_data[31]_INST_0_i_1_n_1 ,\i_write_data[31]_INST_0_i_1_n_2 ,\i_write_data[31]_INST_0_i_1_n_3 ,\i_write_data[31]_INST_0_i_1_n_4 ,\i_write_data[31]_INST_0_i_1_n_5 ,\i_write_data[31]_INST_0_i_1_n_6 ,\i_write_data[31]_INST_0_i_1_n_7 }),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(add_out[31:24]),
        .S(add_right[31:24]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[31]_INST_0_i_2 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[31]),
        .O(add_right[31]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[31]_INST_0_i_3 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[30]),
        .O(add_right[30]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[31]_INST_0_i_4 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[29]),
        .O(add_right[29]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[31]_INST_0_i_5 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[28]),
        .O(add_right[28]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[31]_INST_0_i_6 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[27]),
        .O(add_right[27]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[31]_INST_0_i_7 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[26]),
        .O(add_right[26]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[31]_INST_0_i_8 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[25]),
        .O(add_right[25]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[31]_INST_0_i_9 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[24]),
        .O(add_right[24]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[3]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[3]),
        .O(i_write_data[3]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[4]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[4]),
        .O(i_write_data[4]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[5]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[5]),
        .O(i_write_data[5]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[6]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[6]),
        .O(i_write_data[6]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[7]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[7]),
        .O(i_write_data[7]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \i_write_data[7]_INST_0_i_1 
       (.CI(\<const0> ),
        .CI_TOP(GND_2),
        .CO({\i_write_data[7]_INST_0_i_1_n_0 ,\i_write_data[7]_INST_0_i_1_n_1 ,\i_write_data[7]_INST_0_i_1_n_2 ,\i_write_data[7]_INST_0_i_1_n_3 ,\i_write_data[7]_INST_0_i_1_n_4 ,\i_write_data[7]_INST_0_i_1_n_5 ,\i_write_data[7]_INST_0_i_1_n_6 ,\i_write_data[7]_INST_0_i_1_n_7 }),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,i_write_en}),
        .O(add_out[7:0]),
        .S({add_right[7:1],\i_write_data[7]_INST_0_i_9_n_0 }));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[7]_INST_0_i_2 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[7]),
        .O(add_right[7]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[7]_INST_0_i_3 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[6]),
        .O(add_right[6]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[7]_INST_0_i_4 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[5]),
        .O(add_right[5]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[7]_INST_0_i_5 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[4]),
        .O(add_right[4]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[7]_INST_0_i_6 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[3]),
        .O(add_right[3]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[7]_INST_0_i_7 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[2]),
        .O(add_right[2]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[7]_INST_0_i_8 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[1]),
        .O(add_right[1]));
  LUT6 #(
    .INIT(64'h0000000000140000)) 
    \i_write_data[7]_INST_0_i_9 
       (.I0(i_read_data[0]),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(fsm_out[2]),
        .I4(go),
        .I5(i_done),
        .O(\i_write_data[7]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[8]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[8]),
        .O(i_write_data[8]));
  LUT6 #(
    .INIT(64'h0004040000000000)) 
    \i_write_data[9]_INST_0 
       (.I0(i_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(add_out[9]),
        .O(i_write_data[9]));
  LUT5 #(
    .INIT(32'h00000600)) 
    i_write_en_INST_0
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(fsm_out[2]),
        .I3(go),
        .I4(i_done),
        .O(i_write_en));
  LUT6 #(
    .INIT(64'h080800000F000808)) 
    \out[0]_i_1 
       (.I0(comb_reg_out),
        .I1(comb_reg_done),
        .I2(\out[0]_i_2_n_0 ),
        .I3(i_done),
        .I4(fsm_out[1]),
        .I5(fsm_out[0]),
        .O(\out[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \out[0]_i_2 
       (.I0(fsm_out[2]),
        .I1(go),
        .O(\out[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h06000000)) 
    \out[1]_i_1 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(fsm_out[2]),
        .I3(go),
        .I4(i_done),
        .O(\out[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h03030303EB280000)) 
    \out[2]_i_1 
       (.I0(i_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(comb_reg_done),
        .I4(go),
        .I5(fsm_out[2]),
        .O(fsm_write_en));
  LUT6 #(
    .INIT(64'h0000400400000000)) 
    \out[2]_i_2 
       (.I0(comb_reg_out),
        .I1(comb_reg_done),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(fsm_out[2]),
        .I5(go),
        .O(\out[2]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hF1)) 
    out_carry_i_1
       (.I0(i_read_data[31]),
        .I1(i_read_data[30]),
        .I2(\out_reg[0]_0 ),
        .O(S[6]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFFFF6FF)) 
    out_carry_i_10
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(fsm_out[2]),
        .I3(go),
        .I4(comb_reg_done),
        .O(\out_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h0000000004000004)) 
    out_carry_i_1__0
       (.I0(comb_reg_done),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(i_read_data[3]),
        .O(DI));
  LUT3 #(
    .INIT(8'hF1)) 
    out_carry_i_2
       (.I0(i_read_data[29]),
        .I1(i_read_data[28]),
        .I2(\out_reg[0]_0 ),
        .O(S[5]));
  LUT3 #(
    .INIT(8'hF1)) 
    out_carry_i_2__0
       (.I0(i_read_data[17]),
        .I1(i_read_data[16]),
        .I2(\out_reg[0]_0 ),
        .O(\i_read_data[17] [7]));
  LUT3 #(
    .INIT(8'hF1)) 
    out_carry_i_3
       (.I0(i_read_data[27]),
        .I1(i_read_data[26]),
        .I2(\out_reg[0]_0 ),
        .O(S[4]));
  LUT3 #(
    .INIT(8'hF1)) 
    out_carry_i_3__0
       (.I0(i_read_data[15]),
        .I1(i_read_data[14]),
        .I2(\out_reg[0]_0 ),
        .O(\i_read_data[17] [6]));
  LUT3 #(
    .INIT(8'hF1)) 
    out_carry_i_4
       (.I0(i_read_data[25]),
        .I1(i_read_data[24]),
        .I2(\out_reg[0]_0 ),
        .O(S[3]));
  LUT3 #(
    .INIT(8'hF1)) 
    out_carry_i_4__0
       (.I0(i_read_data[13]),
        .I1(i_read_data[12]),
        .I2(\out_reg[0]_0 ),
        .O(\i_read_data[17] [5]));
  LUT3 #(
    .INIT(8'hF1)) 
    out_carry_i_5
       (.I0(i_read_data[23]),
        .I1(i_read_data[22]),
        .I2(\out_reg[0]_0 ),
        .O(S[2]));
  LUT3 #(
    .INIT(8'hF1)) 
    out_carry_i_5__0
       (.I0(i_read_data[11]),
        .I1(i_read_data[10]),
        .I2(\out_reg[0]_0 ),
        .O(\i_read_data[17] [4]));
  LUT3 #(
    .INIT(8'hF1)) 
    out_carry_i_6
       (.I0(i_read_data[21]),
        .I1(i_read_data[20]),
        .I2(\out_reg[0]_0 ),
        .O(S[1]));
  LUT3 #(
    .INIT(8'hF1)) 
    out_carry_i_6__0
       (.I0(i_read_data[9]),
        .I1(i_read_data[8]),
        .I2(\out_reg[0]_0 ),
        .O(\i_read_data[17] [3]));
  LUT3 #(
    .INIT(8'hF1)) 
    out_carry_i_7
       (.I0(i_read_data[19]),
        .I1(i_read_data[18]),
        .I2(\out_reg[0]_0 ),
        .O(S[0]));
  LUT3 #(
    .INIT(8'hF1)) 
    out_carry_i_7__0
       (.I0(i_read_data[7]),
        .I1(i_read_data[6]),
        .I2(\out_reg[0]_0 ),
        .O(\i_read_data[17] [2]));
  LUT3 #(
    .INIT(8'hF1)) 
    out_carry_i_8
       (.I0(i_read_data[5]),
        .I1(i_read_data[4]),
        .I2(\out_reg[0]_0 ),
        .O(\i_read_data[17] [1]));
  LUT3 #(
    .INIT(8'hF4)) 
    out_carry_i_9
       (.I0(i_read_data[2]),
        .I1(i_read_data[3]),
        .I2(\out_reg[0]_0 ),
        .O(\i_read_data[17] [0]));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(\out[0]_i_1_n_0 ),
        .Q(fsm_out[0]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(\out[1]_i_1_n_0 ),
        .Q(fsm_out[1]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(\out[2]_i_2_n_0 ),
        .Q(fsm_out[2]),
        .R(reset));
endmodule
