// This program was cloned from: https://github.com/shun7b/bidirectional-search
// License: GNU General Public License v3.0


/*Produced by NSL Core(version=20240424), IP ARCH, Inc. Mon May 20 03:44:04 2024
 Licensed to :EVALUATION USER*/
/*
 DO NOT USE ANY PART OF THIS FILE FOR COMMERCIAL PRODUCTS. 
*/

module sub_plot ( p_reset , m_clock , hikareru , moto , sa , in_do );
  input p_reset, m_clock;
  wire p_reset, m_clock;
  input [9:0] hikareru;
  wire [9:0] hikareru;
  input [9:0] moto;
  wire [9:0] moto;
  output [9:0] sa;
  wire [9:0] sa;
  input in_do;
  wire in_do;
  wire [7:0] result;
  wire _net_0;
  wire _net_1;
  wire [7:0] _net_2;
  wire [7:0] _net_3;

   assign  result = 
// synthesis translate_off
// synopsys translate_off
((in_do&_net_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do&_net_0))?(moto-hikareru):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_0 = 
// synthesis translate_off
// synopsys translate_off
(in_do)? 
// synthesis translate_on
// synopsys translate_on
((in_do)?(moto != 8'b00000001):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_1 = 
// synthesis translate_off
// synopsys translate_off
((in_do&_net_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do&_net_0))?(result[7]):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_2 = (~result);
   assign  _net_3 = 8'b00000001;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do&(~_net_0))&((in_do&_net_0)&(~_net_1)))|(((in_do&(~_net_0))|((in_do&_net_0)&(~_net_1)))&((in_do&_net_0)&_net_1))))
 begin $display("Warning: assign collision(sub_plot:sa) at %d",$time);
if ((in_do&(~_net_0))) $display("assert ((in_do&(~_net_0))) line 17 at %d\n",$time);
if (((in_do&_net_0)&(~_net_1))) $display("assert (((in_do&_net_0)&(~_net_1))) line 14 at %d\n",$time);
if (((in_do&_net_0)&_net_1)) $display("assert (((in_do&_net_0)&_net_1)) line 12 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sa = 
// synthesis translate_off
// synopsys translate_off
((((in_do&(~_net_0))&((in_do&_net_0)&(~_net_1)))|(((in_do&(~_net_0))|((in_do&_net_0)&(~_net_1)))&((in_do&_net_0)&_net_1))))? 10'bx :((((in_do&(~_net_0))|((in_do&_net_0)&(~_net_1)))|((in_do&_net_0)&_net_1)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do&(~_net_0)))?10'b0000000000:10'b0)|
    ((((in_do&_net_0)&(~_net_1)))?result:10'b0)|
    ((((in_do&_net_0)&_net_1))?(({2'b00,_net_2})+({2'b00,_net_3})):10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
endmodule

/*Produced by NSL Core(version=20240424), IP ARCH, Inc. Mon May 20 03:44:04 2024
 Licensed to :EVALUATION USER*/
