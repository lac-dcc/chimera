// This program was cloned from: https://github.com/shun7b/bidirectional-search
// License: GNU General Public License v3.0


/*Produced by NSL Core(version=20221225), IP ARCH, Inc. Sat Apr 27 08:50:05 2024
 Licensed to :EVALUATION USER*/
/*
 DO NOT USE ANY PART OF THIS FILE FOR COMMERCIAL PRODUCTS. 
*/

module add_map ( p_reset , m_clock , wall_end_in , all_sg_up , all_sg_down , all_sg_right , all_sg_left , moto_org_near , moto_org_near1 , moto_org_near2 , moto_org_near3 , moto_org , sg_up , sg_down , sg_left , sg_right , wall_t_in , moto , up , right , down , left , start , goal , now , distance , end_wall , all_s_g , all_s_g_near , data_out , data_out_index , data_near , wall_t_out , data_org , data_org_near , s_g , s_g_near , add_exe );
  input p_reset, m_clock;
  wire p_reset, m_clock;
  input [127:0] wall_end_in;
  wire [127:0] wall_end_in;
  input [127:0] all_sg_up;
  wire [127:0] all_sg_up;
  input [127:0] all_sg_down;
  wire [127:0] all_sg_down;
  input [127:0] all_sg_right;
  wire [127:0] all_sg_right;
  input [127:0] all_sg_left;
  wire [127:0] all_sg_left;
  input [7:0] moto_org_near;
  wire [7:0] moto_org_near;
  input [7:0] moto_org_near1;
  wire [7:0] moto_org_near1;
  input [7:0] moto_org_near2;
  wire [7:0] moto_org_near2;
  input [7:0] moto_org_near3;
  wire [7:0] moto_org_near3;
  input [7:0] moto_org;
  wire [7:0] moto_org;
  input [1:0] sg_up;
  wire [1:0] sg_up;
  input [1:0] sg_down;
  wire [1:0] sg_down;
  input [1:0] sg_left;
  wire [1:0] sg_left;
  input [1:0] sg_right;
  wire [1:0] sg_right;
  input wall_t_in;
  wire wall_t_in;
  input [7:0] moto;
  wire [7:0] moto;
  input [7:0] up;
  wire [7:0] up;
  input [7:0] right;
  wire [7:0] right;
  input [7:0] down;
  wire [7:0] down;
  input [7:0] left;
  wire [7:0] left;
  input [7:0] start;
  wire [7:0] start;
  input [7:0] goal;
  wire [7:0] goal;
  input [7:0] now;
  wire [7:0] now;
  input [7:0] distance;
  wire [7:0] distance;
  output [127:0] end_wall;
  wire [127:0] end_wall;
  output [127:0] all_s_g;
  wire [127:0] all_s_g;
  output [127:0] all_s_g_near;
  wire [127:0] all_s_g_near;
  output [7:0] data_out;
  wire [7:0] data_out;
  output [7:0] data_out_index;
  wire [7:0] data_out_index;
  output [7:0] data_near;
  wire [7:0] data_near;
  output wall_t_out;
  wire wall_t_out;
  output [7:0] data_org;
  wire [7:0] data_org;
  output [7:0] data_org_near;
  wire [7:0] data_org_near;
  output [1:0] s_g;
  wire [1:0] s_g;
  output [1:0] s_g_near;
  wire [1:0] s_g_near;
  input add_exe;
  wire add_exe;
  reg [7:0] data_out_index_reg;
  reg [7:0] data_out_reg;
  reg [7:0] near_reg;
  reg wall_reg;
  reg [7:0] org_reg;
  reg [7:0] org_near_reg;
  reg [1:0] sg_reg;
  reg [1:0] sg_near_reg;
  reg [7:0] count;
  reg [127:0] all_sg;
  reg [7:0] now_reg;
  reg [7:0] near_point_reg;
  reg [127:0] all_sg_near;
  reg [127:0] now_all_sg_reg;
  wire [127:0] now_all_sg;
  wire [2:0] div;
  wire [1:0] sg_w;
  wire [8:0] sum_value;
  wire [6:0] add_sum_all;
  wire [7:0] add_sum_all_2;
  wire mods;
  wire [17:0] add_bit;
  wire [7:0] add_mul_return;
  wire [7:0] data_out_w;
  wire pull_wall;
  wire [7:0] min;
  wire [7:0] max;
  wire _net_0;
  wire _net_1;
  wire _net_2;
  wire [17:0] _mul_bit_x_mul_bit1;
  wire [17:0] _mul_bit_x_mul_bit2;
  wire [20:0] _mul_bit_x_mul_bit_result;
  wire _mul_bit_x_mul_bit_exe;
  wire _mul_bit_x_p_reset;
  wire _mul_bit_x_m_clock;
  wire [17:0] _mul_bit_x_1_mul_bit1;
  wire [17:0] _mul_bit_x_1_mul_bit2;
  wire [20:0] _mul_bit_x_1_mul_bit_result;
  wire _mul_bit_x_1_mul_bit_exe;
  wire _mul_bit_x_1_p_reset;
  wire _mul_bit_x_1_m_clock;
  wire _net_4;
  wire _net_5;
  wire _net_6;
  wire _net_7;
  wire _net_8;
  wire _net_9;
  wire _net_10;
  wire _net_11;
  wire _net_12;
  wire _net_13;
  wire _net_14;
  wire _net_15;
  wire [9:0] _net_16;
  wire [7:0] _net_17;
  wire _net_18;
  wire [9:0] _net_19;
  wire [7:0] _net_20;
  wire _net_21;
mul_bit mul_bit_x (.m_clock(m_clock), .p_reset( p_reset), .mul_bit_exe(_mul_bit_x_mul_bit_exe), .mul_bit_result(_mul_bit_x_mul_bit_result), .mul_bit1(_mul_bit_x_mul_bit1), .mul_bit2(_mul_bit_x_mul_bit2));
mul_bit mul_bit_x_1 (.m_clock(m_clock), .p_reset( p_reset), .mul_bit_exe(_mul_bit_x_1_mul_bit_exe), .mul_bit_result(_mul_bit_x_1_mul_bit_result), .mul_bit1(_mul_bit_x_1_mul_bit1), .mul_bit2(_mul_bit_x_1_mul_bit2));


// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or negedge p_reset)
  begin
if ((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(((add_exe&(~_net_4))&(~_net_6))&_net_8))|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)|(((add_exe&(~_net_4))&(~_net_6))&_net_8))&((add_exe&(~_net_4))&_net_6)))|((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))&(add_exe&_net_4)))|(((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))|(add_exe&_net_4))&_net_0)))
 begin $display("Warning: assign collision(add_map:now_all_sg) at %d",$time);
if ((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)) $display("assert ((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)) line 103 at %d\n",$time);
if ((((add_exe&(~_net_4))&(~_net_6))&_net_8)) $display("assert ((((add_exe&(~_net_4))&(~_net_6))&_net_8)) line 75 at %d\n",$time);
if (((add_exe&(~_net_4))&_net_6)) $display("assert (((add_exe&(~_net_4))&_net_6)) line 66 at %d\n",$time);
if ((add_exe&_net_4)) $display("assert ((add_exe&_net_4)) line 64 at %d\n",$time);
if (_net_0) $display("assert (_net_0) line 32 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  now_all_sg = 
// synthesis translate_off
// synopsys translate_off
((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(((add_exe&(~_net_4))&(~_net_6))&_net_8))|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)|(((add_exe&(~_net_4))&(~_net_6))&_net_8))&((add_exe&(~_net_4))&_net_6)))|((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))&(add_exe&_net_4)))|(((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))|(add_exe&_net_4))&_net_0)))? 128'bx :((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))|(add_exe&_net_4))|_net_0))? 
// synthesis translate_on
// synopsys translate_on
(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12))?({127'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,_net_13}):128'b0)|
    (((((add_exe&(~_net_4))&(~_net_6))&_net_8))?({127'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,_net_9}):128'b0)|
    ((((add_exe&(~_net_4))&_net_6))?({127'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,_net_7}):128'b0)|
    (((add_exe&_net_4))?({127'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,_net_5}):128'b0)|
    ((_net_0)?({127'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,_net_1}):128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or negedge p_reset)
  begin
if ((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))&((add_exe&(~_net_4))&_net_6)))|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))&(add_exe&_net_4))))
 begin $display("Warning: assign collision(add_map:sg_w) at %d",$time);
if (((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))) $display("assert (((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))) line 100 at %d\n",$time);
if ((((add_exe&(~_net_4))&(~_net_6))&_net_8)) $display("assert ((((add_exe&(~_net_4))&(~_net_6))&_net_8)) line 81 at %d\n",$time);
if (((add_exe&(~_net_4))&_net_6)) $display("assert (((add_exe&(~_net_4))&_net_6)) line 72 at %d\n",$time);
if ((add_exe&_net_4)) $display("assert ((add_exe&_net_4)) line 62 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg_w = 
// synthesis translate_off
// synopsys translate_off
((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))&((add_exe&(~_net_4))&_net_6)))|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))&(add_exe&_net_4))))? 2'bx :((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))|(add_exe&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0))))?(((sg_up|sg_down)|sg_left)|sg_right):2'b0)|
    (((((add_exe&(~_net_4))&(~_net_6))&_net_8))?2'b01:2'b0)|
    ((((add_exe&(~_net_4))&_net_6))?2'b10:2'b0)|
    (((add_exe&_net_4))?2'b00:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_0 = (sg_reg==2'b11);
   assign  _net_1 = 1'b1;
   assign  _net_2 = 1'b0;
   assign  _mul_bit_x_mul_bit_exe = 1'b0;
   assign  _mul_bit_x_p_reset = p_reset;
   assign  _mul_bit_x_m_clock = m_clock;
   assign  _mul_bit_x_1_mul_bit_exe = 1'b0;
   assign  _mul_bit_x_1_p_reset = p_reset;
   assign  _mul_bit_x_1_m_clock = m_clock;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
    if(add_exe)
    begin
    $display("\nnow=%ddata_out_index_reg=%d,data_out_reg=%d,org_reg=%d,near_reg=%d,orgnear_reg=%d,distance=%d,sg_w=%d,sg_near_reg=%dall_t_in=%d,wall_sg[now]=%d\n",now,data_out_index_reg,data_out_reg,org_reg,near_reg,org_near_reg,distance,sg_w,sg_near_reg,wall_t_in,(wall_end_in[now]));
    end
  end

// synthesis translate_on
// synopsys translate_on
   assign  _net_4 = 
// synthesis translate_off
// synopsys translate_off
(add_exe)? 
// synthesis translate_on
// synopsys translate_on
((add_exe)?(moto_org==8'b11111111):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_5 = 1'b1;
   assign  _net_6 = 
// synthesis translate_off
// synopsys translate_off
((add_exe&(~_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((add_exe&(~_net_4)))?(now==goal):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_7 = 1'b1;
   assign  _net_8 = 
// synthesis translate_off
// synopsys translate_off
(((add_exe&(~_net_4))&(~_net_6)))? 
// synthesis translate_on
// synopsys translate_on
((((add_exe&(~_net_4))&(~_net_6)))?(now==start):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_9 = 1'b1;
   assign  _net_10 = 
// synthesis translate_off
// synopsys translate_off
(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))? 
// synthesis translate_on
// synopsys translate_on
((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))?((wall_end_in[now])==1'b0):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_11 = 
// synthesis translate_off
// synopsys translate_off
(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))? 
// synthesis translate_on
// synopsys translate_on
((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))?((wall_end_in[now])==1'b1):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_12 = 
// synthesis translate_off
// synopsys translate_off
(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0))))? 
// synthesis translate_on
// synopsys translate_on
((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0))))?(sg_w != sg_near_reg):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_13 = 1'b1;
   assign  _net_14 = 
// synthesis translate_off
// synopsys translate_off
((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12))? 
// synthesis translate_on
// synopsys translate_on
(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12))?(sg_w==2'b10):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_15 = 
// synthesis translate_off
// synopsys translate_off
(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14)))? 
// synthesis translate_on
// synopsys translate_on
((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14)))?(sg_w==2'b01):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_16 = 10'b0010000000;
   assign  _net_17 = distance;
   assign  _net_18 = 
// synthesis translate_off
// synopsys translate_off
((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15)))? 
// synthesis translate_on
// synopsys translate_on
(((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15)))?(sg_w==2'b11):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_19 = 10'b0010000000;
   assign  _net_20 = distance;
   assign  _net_21 = 
// synthesis translate_off
// synopsys translate_off
((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12)))? 
// synthesis translate_on
// synopsys translate_on
(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12)))?(sg_w==2'b00):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or negedge p_reset)
  begin
if (((~_net_0)&_net_0))
 begin $display("Warning: assign collision(add_map:end_wall) at %d",$time);
if ((~_net_0)) $display("assert ((~_net_0)) line 35 at %d\n",$time);
if (_net_0) $display("assert (_net_0) line 33 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  end_wall = 
// synthesis translate_off
// synopsys translate_off
(((~_net_0)&_net_0))? 128'bx :(((~_net_0)|_net_0))? 
// synthesis translate_on
// synopsys translate_on
(((~_net_0))?({127'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,_net_2}):128'b0)|
    ((_net_0)?((((all_sg_up|all_sg_down)|all_sg_left)|all_sg_right)|(now_all_sg<<now)):128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  all_s_g = all_sg;
   assign  all_s_g_near = all_sg_near;
   assign  data_out = data_out_reg;
   assign  data_out_index = data_out_index_reg;
   assign  data_near = near_reg;
   assign  wall_t_out = wall_reg;
   assign  data_org = org_reg;
   assign  data_org_near = org_near_reg;
   assign  s_g = sg_reg;
   assign  s_g_near = sg_near_reg;
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     data_out_index_reg <= 8'b00000000;
else 
// synthesis translate_off
// synopsys translate_off
if (((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))&((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))&(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_11)))|(((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_11))&(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_10)))|((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_11))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_10))&(((add_exe&(~_net_4))&(~_net_6))&_net_8)))|(((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_11))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_10))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))&((add_exe&(~_net_4))&_net_6)))|((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_11))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_10))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))&(add_exe&_net_4))))   data_out_index_reg <= 8'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if (((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21)))
      data_out_index_reg <= moto;
else if (((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))
      data_out_index_reg <= 8'b11111111;
else if ((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_11))
      data_out_index_reg <= moto;
else if ((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_10))
      data_out_index_reg <= 8'b11111111;
else if ((((add_exe&(~_net_4))&(~_net_6))&_net_8))
      data_out_index_reg <= 8'b01111111;
else if (((add_exe&(~_net_4))&_net_6))
      data_out_index_reg <= 8'b00000000;
else if ((add_exe&_net_4))
      data_out_index_reg <= 8'b11111111;
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if ((((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_11))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_10))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))|(add_exe&_net_4))==1'b1) ||
 (((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_11))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_10))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))|(add_exe&_net_4))==1'b0) ) begin
 if (((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))&((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))&(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_11)))|(((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_11))&(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_10)))|((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_11))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_10))&(((add_exe&(~_net_4))&(~_net_6))&_net_8)))|(((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_11))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_10))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))&((add_exe&(~_net_4))&_net_6)))|((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_11))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_10))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))&(add_exe&_net_4))))
 begin $display("Warning: assign collision(add_map:data_out_index_reg) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(add_map:data_out_index_reg) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     data_out_reg <= 8'b00000000;
else 
// synthesis translate_off
// synopsys translate_off
if ((((((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))&((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))&((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18)))|(((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18))&(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15)))|((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18))|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))&((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14)))|(((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18))|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14))&(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_11)))|((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18))|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_11))&(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_10)))|(((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18))|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_11))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_10))&(((add_exe&(~_net_4))&(~_net_6))&_net_8)))|((((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18))|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_11))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_10))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))&((add_exe&(~_net_4))&_net_6)))|(((((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18))|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_11))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_10))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))&(add_exe&_net_4))))   data_out_reg <= 8'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if (((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21)))
      data_out_reg <= moto;
else if (((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))
      data_out_reg <= 8'b11111111;
else if (((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18))
      data_out_reg <= ((_net_19[7:0])-_net_20);
else if ((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))
      data_out_reg <= ((_net_16[7:0])-_net_17);
else if (((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14))
      data_out_reg <= distance;
else if ((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_11))
      data_out_reg <= moto;
else if ((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_10))
      data_out_reg <= 8'b11111111;
else if ((((add_exe&(~_net_4))&(~_net_6))&_net_8))
      data_out_reg <= 8'b01111111;
else if (((add_exe&(~_net_4))&_net_6))
      data_out_reg <= 8'b00000000;
else if ((add_exe&_net_4))
      data_out_reg <= 8'b11111111;
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if (((((((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18))|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_11))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_10))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))|(add_exe&_net_4))==1'b1) ||
 ((((((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18))|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_11))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_10))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))|(add_exe&_net_4))==1'b0) ) begin
 if ((((((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))&((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))&((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18)))|(((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18))&(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15)))|((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18))|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))&((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14)))|(((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18))|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14))&(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_11)))|((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18))|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_11))&(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_10)))|(((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18))|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_11))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_10))&(((add_exe&(~_net_4))&(~_net_6))&_net_8)))|((((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18))|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_11))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_10))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))&((add_exe&(~_net_4))&_net_6)))|(((((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&(~_net_21))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(~_net_12))&_net_21))|((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18))|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_11))|(((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))&_net_10))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))&(add_exe&_net_4))))
 begin $display("Warning: assign collision(add_map:data_out_reg) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(add_map:data_out_reg) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     near_reg <= 8'b00000000;
else if (add_exe)
      near_reg <= up;
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     wall_reg <= 1'b0;
else 
// synthesis translate_off
// synopsys translate_off
if (((((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18)&(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))|((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18)|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))&((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14)))|(((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18)|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14))&((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))))|((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18)|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14))|((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))&(((add_exe&(~_net_4))&(~_net_6))&_net_8)))|(((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18)|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14))|((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))&((add_exe&(~_net_4))&_net_6)))|((((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18)|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14))|((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))&(add_exe&_net_4))))   wall_reg <= 1'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if (((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18))
      wall_reg <= 1'b1;
else if ((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))
      wall_reg <= wall_t_in;
else if (((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14))
      wall_reg <= wall_t_in;
else if (((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))
      wall_reg <= wall_t_in;
else if ((((add_exe&(~_net_4))&(~_net_6))&_net_8))
      wall_reg <= wall_t_in;
else if (((add_exe&(~_net_4))&_net_6))
      wall_reg <= wall_t_in;
else if ((add_exe&_net_4))
      wall_reg <= wall_t_in;
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if ((((((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18)|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14))|((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))|(add_exe&_net_4))==1'b1) ||
 (((((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18)|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14))|((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))|(add_exe&_net_4))==1'b0) ) begin
 if (((((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18)&(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))|((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18)|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))&((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14)))|(((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18)|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14))&((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0))))|((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18)|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14))|((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))&(((add_exe&(~_net_4))&(~_net_6))&_net_8)))|(((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18)|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14))|((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))&((add_exe&(~_net_4))&_net_6)))|((((((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&(~_net_15))&_net_18)|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&(~_net_14))&_net_15))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12)&_net_14))|((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))&(add_exe&_net_4))))
 begin $display("Warning: assign collision(add_map:wall_reg) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(add_map:wall_reg) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     org_reg <= 8'b00000000;
else 
// synthesis translate_off
// synopsys translate_off
if (((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))|((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))&(((add_exe&(~_net_4))&(~_net_6))&_net_8)))|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))|((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))&((add_exe&(~_net_4))&_net_6)))|((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))|((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))&(add_exe&_net_4))))   org_reg <= 8'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if (((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0))))
      org_reg <= moto_org;
else if (((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))
      org_reg <= moto_org;
else if ((((add_exe&(~_net_4))&(~_net_6))&_net_8))
      org_reg <= moto_org;
else if (((add_exe&(~_net_4))&_net_6))
      org_reg <= moto_org;
else if ((add_exe&_net_4))
      org_reg <= moto_org;
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if ((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))|((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))|(add_exe&_net_4))==1'b1) ||
 (((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))|((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))|(add_exe&_net_4))==1'b0) ) begin
 if (((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))|((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))&(((add_exe&(~_net_4))&(~_net_6))&_net_8)))|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))|((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))&((add_exe&(~_net_4))&_net_6)))|((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))|((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))&(add_exe&_net_4))))
 begin $display("Warning: assign collision(add_map:org_reg) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(add_map:org_reg) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     org_near_reg <= 8'b00000000;
else 
// synthesis translate_off
// synopsys translate_off
if (((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))|((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))&(((add_exe&(~_net_4))&(~_net_6))&_net_8)))|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))|((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))&((add_exe&(~_net_4))&_net_6)))|((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))|((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))&(add_exe&_net_4))))   org_near_reg <= 8'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if (((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0))))
      org_near_reg <= moto_org_near;
else if (((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))
      org_near_reg <= moto_org_near;
else if ((((add_exe&(~_net_4))&(~_net_6))&_net_8))
      org_near_reg <= moto_org_near;
else if (((add_exe&(~_net_4))&_net_6))
      org_near_reg <= moto_org_near;
else if ((add_exe&_net_4))
      org_near_reg <= moto_org_near;
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if ((((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))|((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))|(add_exe&_net_4))==1'b1) ||
 (((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))|((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))|(add_exe&_net_4))==1'b0) ) begin
 if (((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))|((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))&(((add_exe&(~_net_4))&(~_net_6))&_net_8)))|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))|((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))&((add_exe&(~_net_4))&_net_6)))|((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))|((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))&(add_exe&_net_4))))
 begin $display("Warning: assign collision(add_map:org_near_reg) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(add_map:org_near_reg) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     sg_reg <= 2'b00;
else 
// synthesis translate_off
// synopsys translate_off
if ((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))&((add_exe&(~_net_4))&_net_6)))|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))&(add_exe&_net_4))))   sg_reg <= 2'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if (((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0))))
      sg_reg <= sg_w;
else if ((((add_exe&(~_net_4))&(~_net_6))&_net_8))
      sg_reg <= 2'b01;
else if (((add_exe&(~_net_4))&_net_6))
      sg_reg <= 2'b10;
else if ((add_exe&_net_4))
      sg_reg <= 2'b00;
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if (((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))|(add_exe&_net_4))==1'b1) ||
 ((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))|(add_exe&_net_4))==1'b0) ) begin
 if ((((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))&((add_exe&(~_net_4))&_net_6)))|(((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))|(((add_exe&(~_net_4))&(~_net_6))&_net_8))|((add_exe&(~_net_4))&_net_6))&(add_exe&_net_4))))
 begin $display("Warning: assign collision(add_map:sg_reg) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(add_map:sg_reg) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     sg_near_reg <= 2'b00;
else if (add_exe)
      sg_near_reg <= sg_reg;
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     count <= 8'b00000000;
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     all_sg <= 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
else if ((((((add_exe&(~_net_4))&(~_net_6))&(~_net_8))&(~(wall_t_in != 1'b0)))&_net_12))
      all_sg <= ((((all_sg_up|all_sg_down)|all_sg_left)|all_sg_right)|(now_all_sg<<now));
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     now_reg <= 8'b00000000;
else if (add_exe)
      now_reg <= near_point_reg;
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     near_point_reg <= 8'b00000000;
else if (add_exe)
      near_point_reg <= now;
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     all_sg_near <= 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     now_all_sg_reg <= 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
end
endmodule

/*Produced by NSL Core(version=20221225), IP ARCH, Inc. Sat Apr 27 08:50:05 2024
 Licensed to :EVALUATION USER*/
