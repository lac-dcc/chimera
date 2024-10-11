// This program was cloned from: https://github.com/shun7b/bidirectional-search
// License: GNU General Public License v3.0


/*Produced by NSL Core(version=20240424), IP ARCH, Inc. Mon May 20 03:44:04 2024
 Licensed to :EVALUATION USER*/
/*
 DO NOT USE ANY PART OF THIS FILE FOR COMMERCIAL PRODUCTS. 
*/

module seach_block ( p_reset , m_clock , map_block , now , start , goal , data_out , in_do );
  input p_reset, m_clock;
  wire p_reset, m_clock;
  input [7:0] map_block;
  wire [7:0] map_block;
  input [7:0] now;
  wire [7:0] now;
  output [7:0] start;
  wire [7:0] start;
  output [7:0] goal;
  wire [7:0] goal;
  output [7:0] data_out;
  wire [7:0] data_out;
  input in_do;
  wire in_do;
  reg [7:0] data_reg;
  wire [6:0] _net_0;
  wire _net_1;
  wire _net_2;
  wire _net_4;
  wire _net_5;

   assign  _net_0 = ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   assign  _net_1 = 
// synthesis translate_off
// synopsys translate_off
(in_do)? 
// synthesis translate_on
// synopsys translate_on
((in_do)?(map_block==({1'b0,_net_0})):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_2 = 
// synthesis translate_off
// synopsys translate_off
(in_do)? 
// synthesis translate_on
// synopsys translate_on
((in_do)?(map_block==({({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),1'b0})):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
    if((in_do&_net_2))
    begin
    $display("%h,%dgoal,%d",map_block,now,data_reg);
    end
  end

// synthesis translate_on
// synopsys translate_on
   assign  _net_4 = 
// synthesis translate_off
// synopsys translate_off
(in_do)? 
// synthesis translate_on
// synopsys translate_on
((in_do)?((map_block[7])==1'b1):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_5 = 
// synthesis translate_off
// synopsys translate_off
(in_do)? 
// synthesis translate_on
// synopsys translate_on
((in_do)?((map_block[6:5])==2'b10):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((((in_do&_net_5)&(in_do&_net_4))|(((in_do&_net_5)|(in_do&_net_4))&(in_do&_net_2)))|((((in_do&_net_5)|(in_do&_net_4))|(in_do&_net_2))&(in_do&_net_1))))
 begin $display("Warning: assign collision(seach_block:start) at %d",$time);
if ((in_do&_net_5)) $display("assert ((in_do&_net_5)) line 22 at %d\n",$time);
if ((in_do&_net_4)) $display("assert ((in_do&_net_4)) line 18 at %d\n",$time);
if ((in_do&_net_2)) $display("assert ((in_do&_net_2)) line 13 at %d\n",$time);
if ((in_do&_net_1)) $display("assert ((in_do&_net_1)) line 9 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  start = 
// synthesis translate_off
// synopsys translate_off
(((((in_do&_net_5)&(in_do&_net_4))|(((in_do&_net_5)|(in_do&_net_4))&(in_do&_net_2)))|((((in_do&_net_5)|(in_do&_net_4))|(in_do&_net_2))&(in_do&_net_1))))? 8'bx :(((((in_do&_net_5)|(in_do&_net_4))|(in_do&_net_2))|(in_do&_net_1)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do&_net_5))?8'b00000000:8'b0)|
    (((in_do&_net_4))?8'b00000000:8'b0)|
    (((in_do&_net_2))?8'b00000000:8'b0)|
    (((in_do&_net_1))?now:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((((in_do&_net_5)&(in_do&_net_4))|(((in_do&_net_5)|(in_do&_net_4))&(in_do&_net_2)))|((((in_do&_net_5)|(in_do&_net_4))|(in_do&_net_2))&(in_do&_net_1))))
 begin $display("Warning: assign collision(seach_block:goal) at %d",$time);
if ((in_do&_net_5)) $display("assert ((in_do&_net_5)) line 23 at %d\n",$time);
if ((in_do&_net_4)) $display("assert ((in_do&_net_4)) line 19 at %d\n",$time);
if ((in_do&_net_2)) $display("assert ((in_do&_net_2)) line 14 at %d\n",$time);
if ((in_do&_net_1)) $display("assert ((in_do&_net_1)) line 10 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  goal = 
// synthesis translate_off
// synopsys translate_off
(((((in_do&_net_5)&(in_do&_net_4))|(((in_do&_net_5)|(in_do&_net_4))&(in_do&_net_2)))|((((in_do&_net_5)|(in_do&_net_4))|(in_do&_net_2))&(in_do&_net_1))))? 8'bx :(((((in_do&_net_5)|(in_do&_net_4))|(in_do&_net_2))|(in_do&_net_1)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do&_net_5))?8'b00000000:8'b0)|
    (((in_do&_net_4))?8'b00000000:8'b0)|
    (((in_do&_net_2))?now:8'b0)|
    (((in_do&_net_1))?8'b00000000:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out = data_reg;
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     data_reg <= 8'b00000000;
else if (in_do)
      data_reg <= map_block;
end
endmodule

/*Produced by NSL Core(version=20240424), IP ARCH, Inc. Mon May 20 03:44:04 2024
 Licensed to :EVALUATION USER*/
