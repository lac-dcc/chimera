// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 02:26:20 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route//unsigned-dot-product.futil-ultrascale-opt.v
// Design      : main
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module lakeroad_xilinx_ultrascale_plus_ult3_2
   (out0,
    a,
    b);
  output out0;
  input [2:0]a;
  input [0:0]b;

  wire \<const0> ;
  wire \<const1> ;
  wire ONE;
  wire [2:0]a;
  wire [0:0]b;
  wire [7:0]luts_O5_0;
  wire [7:0]luts_O6_1;
  wire out0;
  wire [7:0]NLW_carry_8_CO_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
    A_LUT_0
       (.I0(a[0]),
        .I1(\<const0> ),
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
        .CO({out0,NLW_carry_8_CO_UNCONNECTED[6:0]}),
        .DI({ONE,ONE,ONE,ONE,ONE,luts_O5_0[2:0]}),
        .S({ONE,ONE,ONE,ONE,ONE,luts_O6_1[2:0]}));
endmodule

(* NETLIST_CHECKSUM = "3b4eb5be" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module main
   (go,
    clk,
    reset,
    done,
    mem0_addr0,
    mem0_addr1,
    mem0_write_data,
    mem0_write_en,
    mem0_clk,
    mem0_read_data,
    mem0_done,
    mem1_addr0,
    mem1_addr1,
    mem1_write_data,
    mem1_write_en,
    mem1_clk,
    mem1_read_data,
    mem1_done);
  input go;
  input clk;
  input reset;
  output done;
  output [2:0]mem0_addr0;
  output [2:0]mem0_addr1;
  output [31:0]mem0_write_data;
  output mem0_write_en;
  output mem0_clk;
  input [31:0]mem0_read_data;
  input mem0_done;
  output [2:0]mem1_addr0;
  output [2:0]mem1_addr1;
  output [31:0]mem1_write_data;
  output mem1_write_en;
  output mem1_clk;
  input [31:0]mem1_read_data;
  input mem1_done;

  wire \<const0> ;
  wire add_go_in;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire counter_done;
  wire counter_n_1;
  wire [2:0]counter_out;
  wire counter_write_en;
  wire done;
  wire [2:2]fsm_in;
  wire fsm_n_13;
  wire fsm_n_14;
  wire fsm_n_16;
  wire [2:0]fsm_out;
  wire go;
  wire is_less_than0_go_in;
  wire [2:0]lt0_left;
  wire lt0_out;
  wire [2:0]mem0_addr0;
  wire mult_done;
  wire r_2_done;
  wire r_2_n_1;
  wire reset;
  wire t_done;
  wire t_write_en;

  assign mem0_addr1[2] = \<const0> ;
  assign mem0_addr1[1] = \<const0> ;
  assign mem0_addr1[0] = \<const0> ;
  assign mem0_clk = clk;
  assign mem0_write_data[31] = \<const0> ;
  assign mem0_write_data[30] = \<const0> ;
  assign mem0_write_data[29] = \<const0> ;
  assign mem0_write_data[28] = \<const0> ;
  assign mem0_write_data[27] = \<const0> ;
  assign mem0_write_data[26] = \<const0> ;
  assign mem0_write_data[25] = \<const0> ;
  assign mem0_write_data[24] = \<const0> ;
  assign mem0_write_data[23] = \<const0> ;
  assign mem0_write_data[22] = \<const0> ;
  assign mem0_write_data[21] = \<const0> ;
  assign mem0_write_data[20] = \<const0> ;
  assign mem0_write_data[19] = \<const0> ;
  assign mem0_write_data[18] = \<const0> ;
  assign mem0_write_data[17] = \<const0> ;
  assign mem0_write_data[16] = \<const0> ;
  assign mem0_write_data[15] = \<const0> ;
  assign mem0_write_data[14] = \<const0> ;
  assign mem0_write_data[13] = \<const0> ;
  assign mem0_write_data[12] = \<const0> ;
  assign mem0_write_data[11] = \<const0> ;
  assign mem0_write_data[10] = \<const0> ;
  assign mem0_write_data[9] = \<const0> ;
  assign mem0_write_data[8] = \<const0> ;
  assign mem0_write_data[7] = \<const0> ;
  assign mem0_write_data[6] = \<const0> ;
  assign mem0_write_data[5] = \<const0> ;
  assign mem0_write_data[4] = \<const0> ;
  assign mem0_write_data[3] = \<const0> ;
  assign mem0_write_data[2] = \<const0> ;
  assign mem0_write_data[1] = \<const0> ;
  assign mem0_write_data[0] = \<const0> ;
  assign mem0_write_en = \<const0> ;
  assign mem1_addr0[2:0] = mem0_addr0;
  assign mem1_addr1[2] = \<const0> ;
  assign mem1_addr1[1] = \<const0> ;
  assign mem1_addr1[0] = \<const0> ;
  assign mem1_clk = clk;
  assign mem1_write_data[31] = \<const0> ;
  assign mem1_write_data[30] = \<const0> ;
  assign mem1_write_data[29] = \<const0> ;
  assign mem1_write_data[28] = \<const0> ;
  assign mem1_write_data[27] = \<const0> ;
  assign mem1_write_data[26] = \<const0> ;
  assign mem1_write_data[25] = \<const0> ;
  assign mem1_write_data[24] = \<const0> ;
  assign mem1_write_data[23] = \<const0> ;
  assign mem1_write_data[22] = \<const0> ;
  assign mem1_write_data[21] = \<const0> ;
  assign mem1_write_data[20] = \<const0> ;
  assign mem1_write_data[19] = \<const0> ;
  assign mem1_write_data[18] = \<const0> ;
  assign mem1_write_data[17] = \<const0> ;
  assign mem1_write_data[16] = \<const0> ;
  assign mem1_write_data[15] = \<const0> ;
  assign mem1_write_data[14] = \<const0> ;
  assign mem1_write_data[13] = \<const0> ;
  assign mem1_write_data[12] = \<const0> ;
  assign mem1_write_data[11] = \<const0> ;
  assign mem1_write_data[10] = \<const0> ;
  assign mem1_write_data[9] = \<const0> ;
  assign mem1_write_data[8] = \<const0> ;
  assign mem1_write_data[7] = \<const0> ;
  assign mem1_write_data[6] = \<const0> ;
  assign mem1_write_data[5] = \<const0> ;
  assign mem1_write_data[4] = \<const0> ;
  assign mem1_write_data[3] = \<const0> ;
  assign mem1_write_data[2] = \<const0> ;
  assign mem1_write_data[1] = \<const0> ;
  assign mem1_write_data[0] = \<const0> ;
  assign mem1_write_en = \<const0> ;
  GND GND
       (.G(\<const0> ));
  std_reg__parameterized1 comb_reg
       (.D(fsm_in),
        .Q(fsm_out),
        .b(is_less_than0_go_in),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .counter_done(counter_done),
        .go(go),
        .\out_reg[0]_0 (fsm_n_16),
        .reset(reset),
        .t_done(t_done));
  std_reg counter
       (.E(counter_write_en),
        .Q({fsm_out[2],fsm_out[0]}),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .counter_done(counter_done),
        .done_reg_0(counter_n_1),
        .go(go),
        .\out_reg[2]_0 (counter_out),
        .reset(reset));
  std_reg_0 fsm
       (.C_LUT_2(counter_out),
        .D(fsm_in),
        .E(counter_write_en),
        .Q(fsm_out),
        .a(lt0_left),
        .add_go_in(add_go_in),
        .b(is_less_than0_go_in),
        .carry_8(fsm_n_16),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .counter_done(counter_done),
        .done(done),
        .\done_buf_reg[2] (fsm_n_14),
        .go(go),
        .mem0_addr0(mem0_addr0),
        .mult_done(mult_done),
        .out0(lt0_out),
        .\out_reg[0]_0 (fsm_n_13),
        .\out_reg[0]_1 (r_2_n_1),
        .\out_reg[0]_2 (counter_n_1),
        .r_2_done(r_2_done),
        .reset(reset),
        .t_done(t_done),
        .t_write_en(t_write_en));
  std_lt lt0
       (.a(lt0_left),
        .b(is_less_than0_go_in),
        .out0(lt0_out));
  std_mult_pipe mult
       (.Q(fsm_out[2]),
        .clk(clk),
        .\done_buf_reg[0] (fsm_n_13),
        .\done_buf_reg[2] (fsm_n_14),
        .mult_done(mult_done));
  std_reg__parameterized0 r_2
       (.Q(fsm_out[0]),
        .add_go_in(add_go_in),
        .clk(clk),
        .done_reg_0(r_2_n_1),
        .go(go),
        .r_2_done(r_2_done),
        .reset(reset),
        .t_done(t_done));
  std_reg__parameterized0_1 t
       (.clk(clk),
        .reset(reset),
        .t_done(t_done),
        .t_write_en(t_write_en));
endmodule

module std_fp_mult_pipe
   (mult_done,
    clk,
    \done_buf_reg[2]_0 ,
    \done_buf_reg[0]_0 ,
    Q);
  output mult_done;
  input clk;
  input \done_buf_reg[2]_0 ;
  input \done_buf_reg[0]_0 ;
  input [0:0]Q;

  wire \<const0> ;
  wire \<const1> ;
  wire [0:0]Q;
  wire clk;
  wire \done_buf_reg[0]_0 ;
  wire \done_buf_reg[2]_0 ;
  wire \done_buf_reg_n_0_[0] ;
  wire \done_buf_reg_n_0_[1] ;
  wire mult_done;
  wire start;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT5 #(
    .INIT(32'h00000010)) 
    \done_buf[0]_i_1 
       (.I0(\done_buf_reg_n_0_[0] ),
        .I1(mult_done),
        .I2(\done_buf_reg[0]_0 ),
        .I3(\done_buf_reg_n_0_[1] ),
        .I4(Q),
        .O(start));
  FDRE \done_buf_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(start),
        .Q(\done_buf_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE \done_buf_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\done_buf_reg_n_0_[0] ),
        .Q(\done_buf_reg_n_0_[1] ),
        .R(\done_buf_reg[2]_0 ));
  FDRE \done_buf_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\done_buf_reg_n_0_[1] ),
        .Q(mult_done),
        .R(\done_buf_reg[2]_0 ));
endmodule

module std_lt
   (out0,
    a,
    b);
  output out0;
  input [2:0]a;
  input [0:0]b;

  wire [2:0]a;
  wire [0:0]b;
  wire out0;

  lakeroad_xilinx_ultrascale_plus_ult3_2 _impl
       (.a(a),
        .b(b),
        .out0(out0));
endmodule

module std_mult_pipe
   (mult_done,
    clk,
    \done_buf_reg[2] ,
    \done_buf_reg[0] ,
    Q);
  output mult_done;
  input clk;
  input \done_buf_reg[2] ;
  input \done_buf_reg[0] ;
  input [0:0]Q;

  wire [0:0]Q;
  wire clk;
  wire \done_buf_reg[0] ;
  wire \done_buf_reg[2] ;
  wire mult_done;

  std_fp_mult_pipe comp
       (.Q(Q),
        .clk(clk),
        .\done_buf_reg[0]_0 (\done_buf_reg[0] ),
        .\done_buf_reg[2]_0 (\done_buf_reg[2] ),
        .mult_done(mult_done));
endmodule

module std_reg
   (counter_done,
    done_reg_0,
    \out_reg[2]_0 ,
    reset,
    E,
    clk,
    go,
    comb_reg_done,
    Q);
  output counter_done;
  output done_reg_0;
  output [2:0]\out_reg[2]_0 ;
  input reset;
  input [0:0]E;
  input clk;
  input go;
  input comb_reg_done;
  input [1:0]Q;

  wire \<const1> ;
  wire [0:0]E;
  wire [1:0]Q;
  wire clk;
  wire comb_reg_done;
  wire counter_done;
  wire [2:0]counter_in;
  wire done_reg_0;
  wire go;
  wire [2:0]\out_reg[2]_0 ;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(E),
        .Q(counter_done),
        .R(reset));
  LUT2 #(
    .INIT(4'h4)) 
    \out[0]_i_1__0 
       (.I0(\out_reg[2]_0 [0]),
        .I1(Q[1]),
        .O(counter_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \out[1]_i_1__0 
       (.I0(\out_reg[2]_0 [0]),
        .I1(\out_reg[2]_0 [1]),
        .I2(Q[1]),
        .O(counter_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h6A00)) 
    \out[2]_i_2 
       (.I0(\out_reg[2]_0 [2]),
        .I1(\out_reg[2]_0 [1]),
        .I2(\out_reg[2]_0 [0]),
        .I3(Q[1]),
        .O(counter_in[2]));
  LUT4 #(
    .INIT(16'hC088)) 
    \out[2]_i_4 
       (.I0(counter_done),
        .I1(go),
        .I2(comb_reg_done),
        .I3(Q[0]),
        .O(done_reg_0));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(E),
        .D(counter_in[0]),
        .Q(\out_reg[2]_0 [0]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(E),
        .D(counter_in[1]),
        .Q(\out_reg[2]_0 [1]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(E),
        .D(counter_in[2]),
        .Q(\out_reg[2]_0 [2]),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg_0
   (Q,
    add_go_in,
    E,
    a,
    b,
    mem0_addr0,
    t_write_en,
    \out_reg[0]_0 ,
    \done_buf_reg[2] ,
    done,
    carry_8,
    D,
    r_2_done,
    go,
    counter_done,
    comb_reg_done,
    C_LUT_2,
    t_done,
    mult_done,
    \out_reg[0]_1 ,
    \out_reg[0]_2 ,
    out0,
    comb_reg_out,
    reset,
    clk);
  output [2:0]Q;
  output add_go_in;
  output [0:0]E;
  output [2:0]a;
  output [0:0]b;
  output [2:0]mem0_addr0;
  output t_write_en;
  output \out_reg[0]_0 ;
  output \done_buf_reg[2] ;
  output done;
  output carry_8;
  input [0:0]D;
  input r_2_done;
  input go;
  input counter_done;
  input comb_reg_done;
  input [2:0]C_LUT_2;
  input t_done;
  input mult_done;
  input \out_reg[0]_1 ;
  input \out_reg[0]_2 ;
  input out0;
  input comb_reg_out;
  input reset;
  input clk;

  wire [2:0]C_LUT_2;
  wire [0:0]D;
  wire [0:0]E;
  wire [2:0]Q;
  wire [2:0]a;
  wire add_go_in;
  wire [0:0]b;
  wire carry_8;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire counter_done;
  wire done;
  wire \done_buf_reg[2] ;
  wire [1:0]fsm_in;
  wire fsm_write_en;
  wire go;
  wire [2:0]mem0_addr0;
  wire mult_done;
  wire out0;
  wire \out_reg[0]_0 ;
  wire \out_reg[0]_1 ;
  wire \out_reg[0]_2 ;
  wire r_2_done;
  wire reset;
  wire t_done;
  wire t_write_en;

  LUT5 #(
    .INIT(32'h10000000)) 
    A_LUT_0_i_1
       (.I0(Q[1]),
        .I1(comb_reg_done),
        .I2(go),
        .I3(Q[0]),
        .I4(C_LUT_2[0]),
        .O(a[0]));
  LUT5 #(
    .INIT(32'h10000000)) 
    B_LUT_1_i_1
       (.I0(Q[1]),
        .I1(comb_reg_done),
        .I2(go),
        .I3(Q[0]),
        .I4(C_LUT_2[1]),
        .O(a[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h10000000)) 
    C_LUT_2_i_1
       (.I0(Q[1]),
        .I1(comb_reg_done),
        .I2(go),
        .I3(Q[0]),
        .I4(C_LUT_2[2]),
        .O(a[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    C_LUT_2_i_2
       (.I0(Q[0]),
        .I1(go),
        .I2(comb_reg_done),
        .I3(Q[1]),
        .O(b));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h40)) 
    done_INST_0
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(done));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    \done_buf[0]_i_2 
       (.I0(Q[0]),
        .I1(go),
        .I2(t_done),
        .I3(Q[1]),
        .O(\out_reg[0]_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFBFFFFFF)) 
    \done_buf[1]_i_1 
       (.I0(mult_done),
        .I1(Q[0]),
        .I2(t_done),
        .I3(go),
        .I4(Q[1]),
        .I5(Q[2]),
        .O(\done_buf_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00000020)) 
    done_i_1
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(go),
        .I3(r_2_done),
        .I4(Q[2]),
        .O(add_go_in));
  LUT6 #(
    .INIT(64'h0000000000800000)) 
    done_i_1__0
       (.I0(mult_done),
        .I1(Q[0]),
        .I2(go),
        .I3(t_done),
        .I4(Q[1]),
        .I5(Q[2]),
        .O(t_write_en));
  LUT6 #(
    .INIT(64'h0000000000800000)) 
    \mem1_addr0[0]_INST_0 
       (.I0(C_LUT_2[0]),
        .I1(Q[0]),
        .I2(go),
        .I3(t_done),
        .I4(Q[1]),
        .I5(Q[2]),
        .O(mem0_addr0[0]));
  LUT6 #(
    .INIT(64'h0000000000800000)) 
    \mem1_addr0[1]_INST_0 
       (.I0(C_LUT_2[1]),
        .I1(Q[0]),
        .I2(go),
        .I3(t_done),
        .I4(Q[1]),
        .I5(Q[2]),
        .O(mem0_addr0[1]));
  LUT6 #(
    .INIT(64'h0000000000800000)) 
    \mem1_addr0[2]_INST_0 
       (.I0(C_LUT_2[2]),
        .I1(Q[0]),
        .I2(go),
        .I3(t_done),
        .I4(Q[1]),
        .I5(Q[2]),
        .O(mem0_addr0[2]));
  LUT6 #(
    .INIT(64'h004F000000400000)) 
    \out[0]_i_1 
       (.I0(Q[2]),
        .I1(r_2_done),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(go),
        .I5(counter_done),
        .O(fsm_in[0]));
  LUT6 #(
    .INIT(64'hFFFFFFBF00000080)) 
    \out[0]_i_1__1 
       (.I0(out0),
        .I1(Q[0]),
        .I2(go),
        .I3(comb_reg_done),
        .I4(Q[1]),
        .I5(comb_reg_out),
        .O(carry_8));
  LUT6 #(
    .INIT(64'h0F00000040004000)) 
    \out[1]_i_1 
       (.I0(Q[2]),
        .I1(r_2_done),
        .I2(Q[1]),
        .I3(go),
        .I4(comb_reg_done),
        .I5(Q[0]),
        .O(fsm_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \out[2]_i_1 
       (.I0(counter_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .O(E));
  LUT5 #(
    .INIT(32'h74FF7400)) 
    \out[2]_i_1__0 
       (.I0(Q[0]),
        .I1(Q[2]),
        .I2(\out_reg[0]_1 ),
        .I3(Q[1]),
        .I4(\out_reg[0]_2 ),
        .O(fsm_write_en));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(fsm_in[0]),
        .Q(Q[0]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(fsm_in[1]),
        .Q(Q[1]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(D),
        .Q(Q[2]),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized0
   (r_2_done,
    done_reg_0,
    reset,
    add_go_in,
    clk,
    go,
    t_done,
    Q);
  output r_2_done;
  output done_reg_0;
  input reset;
  input add_go_in;
  input clk;
  input go;
  input t_done;
  input [0:0]Q;

  wire \<const1> ;
  wire [0:0]Q;
  wire add_go_in;
  wire clk;
  wire done_reg_0;
  wire go;
  wire r_2_done;
  wire reset;
  wire t_done;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(add_go_in),
        .Q(r_2_done),
        .R(reset));
  LUT4 #(
    .INIT(16'hC088)) 
    \out[2]_i_3 
       (.I0(r_2_done),
        .I1(go),
        .I2(t_done),
        .I3(Q),
        .O(done_reg_0));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized0_1
   (t_done,
    reset,
    t_write_en,
    clk);
  output t_done;
  input reset;
  input t_write_en;
  input clk;

  wire \<const1> ;
  wire clk;
  wire reset;
  wire t_done;
  wire t_write_en;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(t_write_en),
        .Q(t_done),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized1
   (comb_reg_done,
    comb_reg_out,
    D,
    reset,
    b,
    clk,
    \out_reg[0]_0 ,
    Q,
    go,
    counter_done,
    t_done);
  output comb_reg_done;
  output comb_reg_out;
  output [0:0]D;
  input reset;
  input [0:0]b;
  input clk;
  input \out_reg[0]_0 ;
  input [2:0]Q;
  input go;
  input counter_done;
  input t_done;

  wire \<const1> ;
  wire [0:0]D;
  wire [2:0]Q;
  wire [0:0]b;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire counter_done;
  wire go;
  wire \out[2]_i_5_n_0 ;
  wire \out[2]_i_6_n_0 ;
  wire \out_reg[0]_0 ;
  wire reset;
  wire t_done;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(b),
        .Q(comb_reg_done),
        .R(reset));
  LUT6 #(
    .INIT(64'hC500C00000000000)) 
    \out[2]_i_5 
       (.I0(comb_reg_out),
        .I1(t_done),
        .I2(Q[1]),
        .I3(go),
        .I4(comb_reg_done),
        .I5(Q[0]),
        .O(\out[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000073004000)) 
    \out[2]_i_6 
       (.I0(comb_reg_out),
        .I1(Q[0]),
        .I2(comb_reg_done),
        .I3(go),
        .I4(counter_done),
        .I5(Q[1]),
        .O(\out[2]_i_6_n_0 ));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\out_reg[0]_0 ),
        .Q(comb_reg_out),
        .R(reset));
  MUXF7 \out_reg[2]_i_2 
       (.I0(\out[2]_i_5_n_0 ),
        .I1(\out[2]_i_6_n_0 ),
        .O(D),
        .S(Q[2]));
endmodule
