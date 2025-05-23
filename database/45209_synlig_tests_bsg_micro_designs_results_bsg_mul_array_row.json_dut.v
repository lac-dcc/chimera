// This program was cloned from: https://github.com/chipsalliance/synlig
// License: Apache License 2.0

/* Generated by Yosys 0.27+9 (git sha1 101d19bb6, gcc 11.2.0-7ubuntu2 -fPIC -Os) */


module \$paramod$45358d7e6e5f49be8c613b75ca94b10930bd5f7f\bsg_and (a_i, b_i, o);
  
  input [15:0] a_i;
  wire [15:0] a_i;
  
  input [15:0] b_i;
  wire [15:0] b_i;
  
  output [15:0] o;
  wire [15:0] o;
  assign o[0] = b_i[0] & a_i[0];
  assign o[1] = b_i[1] & a_i[1];
  assign o[2] = b_i[2] & a_i[2];
  assign o[3] = b_i[3] & a_i[3];
  assign o[4] = b_i[4] & a_i[4];
  assign o[5] = b_i[5] & a_i[5];
  assign o[6] = b_i[6] & a_i[6];
  assign o[7] = b_i[7] & a_i[7];
  assign o[8] = b_i[8] & a_i[8];
  assign o[9] = b_i[9] & a_i[9];
  assign o[10] = b_i[10] & a_i[10];
  assign o[11] = b_i[11] & a_i[11];
  assign o[12] = b_i[12] & a_i[12];
  assign o[13] = b_i[13] & a_i[13];
  assign o[14] = b_i[14] & a_i[14];
  assign o[15] = b_i[15] & a_i[15];
endmodule


module \$paramod\bsg_adder_ripple_carry\width_p=s32'00000000000000000000000000010000 (a_i, b_i, s_o, c_o);
  wire _000_;
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  
  input [15:0] a_i;
  wire [15:0] a_i;
  
  input [15:0] b_i;
  wire [15:0] b_i;
  
  output c_o;
  wire c_o;
  
  output [15:0] s_o;
  wire [15:0] s_o;
  assign _051_ = a_i[1] ^ b_i[1];
  assign _052_ = ~(a_i[0] & b_i[0]);
  assign s_o[1] = ~(_052_ ^ _051_);
  assign _053_ = ~(a_i[2] ^ b_i[2]);
  assign _054_ = a_i[1] & b_i[1];
  assign _055_ = _051_ & ~(_052_);
  assign _056_ = _055_ | _054_;
  assign s_o[2] = ~(_056_ ^ _053_);
  assign _057_ = ~(a_i[3] ^ b_i[3]);
  assign _058_ = ~(a_i[2] & b_i[2]);
  assign _059_ = _056_ & ~(_053_);
  assign _060_ = _058_ & ~(_059_);
  assign s_o[3] = _060_ ^ _057_;
  assign _061_ = ~(a_i[4] ^ b_i[4]);
  assign _062_ = a_i[3] & b_i[3];
  assign _063_ = ~(_058_ | _057_);
  assign _064_ = _063_ | _062_;
  assign _065_ = _057_ | _053_;
  assign _066_ = _056_ & ~(_065_);
  assign _067_ = _066_ | _064_;
  assign s_o[4] = ~(_067_ ^ _061_);
  assign _068_ = ~(a_i[5] ^ b_i[5]);
  assign _069_ = ~(a_i[4] & b_i[4]);
  assign _070_ = _067_ & ~(_061_);
  assign _071_ = _069_ & ~(_070_);
  assign s_o[5] = _071_ ^ _068_;
  assign _072_ = ~(a_i[6] ^ b_i[6]);
  assign _073_ = a_i[5] & b_i[5];
  assign _074_ = ~(_069_ | _068_);
  assign _075_ = _074_ | _073_;
  assign _076_ = _068_ | _061_;
  assign _077_ = _076_ | ~(_067_);
  assign _078_ = _077_ & ~(_075_);
  assign s_o[6] = _078_ ^ _072_;
  assign _079_ = ~(a_i[7] ^ b_i[7]);
  assign _080_ = ~(a_i[6] & b_i[6]);
  assign _081_ = ~(_078_ | _072_);
  assign _082_ = _080_ & ~(_081_);
  assign s_o[7] = _082_ ^ _079_;
  assign _083_ = ~(a_i[8] ^ b_i[8]);
  assign _084_ = a_i[7] & b_i[7];
  assign _085_ = ~(_080_ | _079_);
  assign _086_ = _085_ | _084_;
  assign _087_ = _079_ | _072_;
  assign _088_ = _075_ & ~(_087_);
  assign _089_ = _088_ | _086_;
  assign _090_ = _087_ | _076_;
  assign _091_ = _067_ & ~(_090_);
  assign _092_ = _091_ | _089_;
  assign s_o[8] = ~(_092_ ^ _083_);
  assign _000_ = ~(a_i[9] ^ b_i[9]);
  assign _001_ = ~(a_i[8] & b_i[8]);
  assign _002_ = _092_ & ~(_083_);
  assign _003_ = _001_ & ~(_002_);
  assign s_o[9] = _003_ ^ _000_;
  assign _004_ = ~(a_i[10] ^ b_i[10]);
  assign _005_ = a_i[9] & b_i[9];
  assign _006_ = ~(_001_ | _000_);
  assign _007_ = _006_ | _005_;
  assign _008_ = _000_ | _083_;
  assign _009_ = _008_ | ~(_092_);
  assign _010_ = _009_ & ~(_007_);
  assign s_o[10] = _010_ ^ _004_;
  assign _011_ = ~(a_i[11] ^ b_i[11]);
  assign _012_ = ~(a_i[10] & b_i[10]);
  assign _013_ = ~(_010_ | _004_);
  assign _014_ = _012_ & ~(_013_);
  assign s_o[11] = _014_ ^ _011_;
  assign _015_ = ~(a_i[12] ^ b_i[12]);
  assign _016_ = a_i[11] & b_i[11];
  assign _017_ = ~(_012_ | _011_);
  assign _018_ = _017_ | _016_;
  assign _019_ = _011_ | _004_;
  assign _020_ = _007_ & ~(_019_);
  assign _021_ = _020_ | _018_;
  assign _022_ = _019_ | _008_;
  assign _023_ = _092_ & ~(_022_);
  assign _024_ = ~(_023_ | _021_);
  assign s_o[12] = _024_ ^ _015_;
  assign _025_ = ~(a_i[13] ^ b_i[13]);
  assign _026_ = ~(a_i[12] & b_i[12]);
  assign _027_ = ~(_024_ | _015_);
  assign _028_ = _026_ & ~(_027_);
  assign s_o[13] = _028_ ^ _025_;
  assign _029_ = ~(a_i[14] ^ b_i[14]);
  assign _030_ = a_i[13] & b_i[13];
  assign _031_ = ~(_026_ | _025_);
  assign _032_ = ~(_031_ | _030_);
  assign _033_ = _025_ | _015_;
  assign _034_ = ~(_033_ | _024_);
  assign _035_ = _032_ & ~(_034_);
  assign s_o[14] = _035_ ^ _029_;
  assign _036_ = ~(a_i[15] ^ b_i[15]);
  assign _037_ = ~(a_i[14] & b_i[14]);
  assign _038_ = ~(_035_ | _029_);
  assign _039_ = _037_ & ~(_038_);
  assign s_o[15] = _039_ ^ _036_;
  assign s_o[0] = a_i[0] ^ b_i[0];
  assign _040_ = a_i[15] & b_i[15];
  assign _041_ = ~(_037_ | _036_);
  assign _042_ = _041_ | _040_;
  assign _043_ = _036_ | _029_;
  assign _044_ = ~(_043_ | _032_);
  assign _045_ = _044_ | _042_;
  assign _046_ = _043_ | _033_;
  assign _047_ = _021_ & ~(_046_);
  assign _048_ = _047_ | _045_;
  assign _049_ = _046_ | _022_;
  assign _050_ = _092_ & ~(_049_);
  assign c_o = _050_ | _048_;
endmodule

(* top =  1  *)

module bsg_mul_array_row(clk_i, rst_i, v_i, a_i, b_i, s_i, c_i, prod_accum_i, a_o, b_o, s_o, c_o, prod_accum_o);
  
  input [15:0] a_i;
  wire [15:0] a_i;
  
  output [15:0] a_o;
  wire [15:0] a_o;
  
  reg [15:0] a_r;
  
  input [15:0] b_i;
  wire [15:0] b_i;
  
  output [15:0] b_o;
  wire [15:0] b_o;
  
  reg [15:0] b_r;
  
  input c_i;
  wire c_i;
  
  output c_o;
  wire c_o;
  
  reg c_r;
  
  input clk_i;
  wire clk_i;
  
  wire pc;
  
  wire [15:0] pp;
  
  input [14:0] prod_accum_i;
  wire [14:0] prod_accum_i;
  
  output [15:0] prod_accum_o;
  wire [15:0] prod_accum_o;
  
  wire [15:0] prod_accum_r;
  
  wire [15:0] ps;
  
  input rst_i;
  wire rst_i;
  
  input [15:0] s_i;
  wire [15:0] s_i;
  
  output [15:0] s_o;
  wire [15:0] s_o;
  
  reg [15:0] s_r;
  
  input v_i;
  wire v_i;
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) a_r[0] <= 1'h0;
    else if (v_i) a_r[0] <= a_i[0];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) a_r[1] <= 1'h0;
    else if (v_i) a_r[1] <= a_i[1];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) a_r[2] <= 1'h0;
    else if (v_i) a_r[2] <= a_i[2];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) a_r[3] <= 1'h0;
    else if (v_i) a_r[3] <= a_i[3];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) a_r[4] <= 1'h0;
    else if (v_i) a_r[4] <= a_i[4];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) a_r[5] <= 1'h0;
    else if (v_i) a_r[5] <= a_i[5];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) a_r[6] <= 1'h0;
    else if (v_i) a_r[6] <= a_i[6];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) a_r[7] <= 1'h0;
    else if (v_i) a_r[7] <= a_i[7];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) a_r[8] <= 1'h0;
    else if (v_i) a_r[8] <= a_i[8];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) a_r[9] <= 1'h0;
    else if (v_i) a_r[9] <= a_i[9];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) a_r[10] <= 1'h0;
    else if (v_i) a_r[10] <= a_i[10];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) a_r[11] <= 1'h0;
    else if (v_i) a_r[11] <= a_i[11];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) a_r[12] <= 1'h0;
    else if (v_i) a_r[12] <= a_i[12];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) a_r[13] <= 1'h0;
    else if (v_i) a_r[13] <= a_i[13];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) a_r[14] <= 1'h0;
    else if (v_i) a_r[14] <= a_i[14];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) a_r[15] <= 1'h0;
    else if (v_i) a_r[15] <= a_i[15];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) b_r[0] <= 1'h0;
    else if (v_i) b_r[0] <= b_i[0];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) b_r[1] <= 1'h0;
    else if (v_i) b_r[1] <= b_i[1];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) b_r[2] <= 1'h0;
    else if (v_i) b_r[2] <= b_i[2];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) b_r[3] <= 1'h0;
    else if (v_i) b_r[3] <= b_i[3];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) b_r[4] <= 1'h0;
    else if (v_i) b_r[4] <= b_i[4];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) b_r[5] <= 1'h0;
    else if (v_i) b_r[5] <= b_i[5];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) b_r[6] <= 1'h0;
    else if (v_i) b_r[6] <= b_i[6];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) b_r[7] <= 1'h0;
    else if (v_i) b_r[7] <= b_i[7];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) b_r[8] <= 1'h0;
    else if (v_i) b_r[8] <= b_i[8];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) b_r[9] <= 1'h0;
    else if (v_i) b_r[9] <= b_i[9];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) b_r[10] <= 1'h0;
    else if (v_i) b_r[10] <= b_i[10];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) b_r[11] <= 1'h0;
    else if (v_i) b_r[11] <= b_i[11];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) b_r[12] <= 1'h0;
    else if (v_i) b_r[12] <= b_i[12];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) b_r[13] <= 1'h0;
    else if (v_i) b_r[13] <= b_i[13];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) b_r[14] <= 1'h0;
    else if (v_i) b_r[14] <= b_i[14];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) b_r[15] <= 1'h0;
    else if (v_i) b_r[15] <= b_i[15];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) s_r[0] <= 1'h0;
    else if (v_i) s_r[0] <= ps[0];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) s_r[1] <= 1'h0;
    else if (v_i) s_r[1] <= ps[1];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) s_r[2] <= 1'h0;
    else if (v_i) s_r[2] <= ps[2];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) s_r[3] <= 1'h0;
    else if (v_i) s_r[3] <= ps[3];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) s_r[4] <= 1'h0;
    else if (v_i) s_r[4] <= ps[4];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) s_r[5] <= 1'h0;
    else if (v_i) s_r[5] <= ps[5];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) s_r[6] <= 1'h0;
    else if (v_i) s_r[6] <= ps[6];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) s_r[7] <= 1'h0;
    else if (v_i) s_r[7] <= ps[7];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) s_r[8] <= 1'h0;
    else if (v_i) s_r[8] <= ps[8];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) s_r[9] <= 1'h0;
    else if (v_i) s_r[9] <= ps[9];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) s_r[10] <= 1'h0;
    else if (v_i) s_r[10] <= ps[10];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) s_r[11] <= 1'h0;
    else if (v_i) s_r[11] <= ps[11];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) s_r[12] <= 1'h0;
    else if (v_i) s_r[12] <= ps[12];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) s_r[13] <= 1'h0;
    else if (v_i) s_r[13] <= ps[13];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) s_r[14] <= 1'h0;
    else if (v_i) s_r[14] <= ps[14];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) s_r[15] <= 1'h0;
    else if (v_i) s_r[15] <= ps[15];
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) c_r <= 1'h0;
    else if (v_i) c_r <= pc;
  reg \prod_accum_r_reg[0] ;
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) \prod_accum_r_reg[0]  <= 1'h0;
    else if (v_i) \prod_accum_r_reg[0]  <= prod_accum_i[0];
  assign prod_accum_r[0] = \prod_accum_r_reg[0] ;
  reg \prod_accum_r_reg[1] ;
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) \prod_accum_r_reg[1]  <= 1'h0;
    else if (v_i) \prod_accum_r_reg[1]  <= prod_accum_i[1];
  assign prod_accum_r[1] = \prod_accum_r_reg[1] ;
  reg \prod_accum_r_reg[2] ;
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) \prod_accum_r_reg[2]  <= 1'h0;
    else if (v_i) \prod_accum_r_reg[2]  <= prod_accum_i[2];
  assign prod_accum_r[2] = \prod_accum_r_reg[2] ;
  reg \prod_accum_r_reg[3] ;
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) \prod_accum_r_reg[3]  <= 1'h0;
    else if (v_i) \prod_accum_r_reg[3]  <= prod_accum_i[3];
  assign prod_accum_r[3] = \prod_accum_r_reg[3] ;
  reg \prod_accum_r_reg[4] ;
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) \prod_accum_r_reg[4]  <= 1'h0;
    else if (v_i) \prod_accum_r_reg[4]  <= prod_accum_i[4];
  assign prod_accum_r[4] = \prod_accum_r_reg[4] ;
  reg \prod_accum_r_reg[5] ;
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) \prod_accum_r_reg[5]  <= 1'h0;
    else if (v_i) \prod_accum_r_reg[5]  <= prod_accum_i[5];
  assign prod_accum_r[5] = \prod_accum_r_reg[5] ;
  reg \prod_accum_r_reg[6] ;
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) \prod_accum_r_reg[6]  <= 1'h0;
    else if (v_i) \prod_accum_r_reg[6]  <= prod_accum_i[6];
  assign prod_accum_r[6] = \prod_accum_r_reg[6] ;
  reg \prod_accum_r_reg[7] ;
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) \prod_accum_r_reg[7]  <= 1'h0;
    else if (v_i) \prod_accum_r_reg[7]  <= prod_accum_i[7];
  assign prod_accum_r[7] = \prod_accum_r_reg[7] ;
  reg \prod_accum_r_reg[8] ;
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) \prod_accum_r_reg[8]  <= 1'h0;
    else if (v_i) \prod_accum_r_reg[8]  <= prod_accum_i[8];
  assign prod_accum_r[8] = \prod_accum_r_reg[8] ;
  reg \prod_accum_r_reg[9] ;
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) \prod_accum_r_reg[9]  <= 1'h0;
    else if (v_i) \prod_accum_r_reg[9]  <= prod_accum_i[9];
  assign prod_accum_r[9] = \prod_accum_r_reg[9] ;
  reg \prod_accum_r_reg[10] ;
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) \prod_accum_r_reg[10]  <= 1'h0;
    else if (v_i) \prod_accum_r_reg[10]  <= prod_accum_i[10];
  assign prod_accum_r[10] = \prod_accum_r_reg[10] ;
  reg \prod_accum_r_reg[11] ;
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) \prod_accum_r_reg[11]  <= 1'h0;
    else if (v_i) \prod_accum_r_reg[11]  <= prod_accum_i[11];
  assign prod_accum_r[11] = \prod_accum_r_reg[11] ;
  reg \prod_accum_r_reg[12] ;
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) \prod_accum_r_reg[12]  <= 1'h0;
    else if (v_i) \prod_accum_r_reg[12]  <= prod_accum_i[12];
  assign prod_accum_r[12] = \prod_accum_r_reg[12] ;
  reg \prod_accum_r_reg[13] ;
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) \prod_accum_r_reg[13]  <= 1'h0;
    else if (v_i) \prod_accum_r_reg[13]  <= prod_accum_i[13];
  assign prod_accum_r[13] = \prod_accum_r_reg[13] ;
  reg \prod_accum_r_reg[14] ;
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (rst_i) \prod_accum_r_reg[14]  <= 1'h0;
    else if (v_i) \prod_accum_r_reg[14]  <= prod_accum_i[14];
  assign prod_accum_r[14] = \prod_accum_r_reg[14] ;
  (* module_not_derived = 32'd1 *)
  
  \$paramod\bsg_adder_ripple_carry\width_p=s32'00000000000000000000000000010000  adder0 (
    .a_i(pp),
    .b_i({ c_i, s_i[15:1] }),
    .c_o(pc),
    .s_o(ps)
  );
  (* module_not_derived = 32'd1 *)
  
  \$paramod$45358d7e6e5f49be8c613b75ca94b10930bd5f7f\bsg_and  and0 (
    .a_i(a_i),
    .b_i({ b_i[15], b_i[15], b_i[15], b_i[15], b_i[15], b_i[15], b_i[15], b_i[15], b_i[15], b_i[15], b_i[15], b_i[15], b_i[15], b_i[15], b_i[15], b_i[15] }),
    .o(pp)
  );
  assign a_o = a_r;
  assign b_o = b_r;
  assign c_o = c_r;
  assign prod_accum_o = { s_r[0], prod_accum_r[14:0] };
  assign prod_accum_r[15] = s_r[0];
  assign s_o = s_r;
endmodule

