// This program was cloned from: https://github.com/shun7b/bidirectional-search
// License: GNU General Public License v3.0


/*Produced by NSL Core(version=20240424), IP ARCH, Inc. Mon May 20 03:44:04 2024
 Licensed to :EVALUATION USER*/
/*
 DO NOT USE ANY PART OF THIS FILE FOR COMMERCIAL PRODUCTS. 
*/

module min_select ( p_reset , m_clock , inene1 , inene2 , ud_lr1 , ud_lr2 , outene , outplot , min_select_exe );
  input p_reset, m_clock;
  wire p_reset, m_clock;
  input [7:0] inene1;
  wire [7:0] inene1;
  input [7:0] inene2;
  wire [7:0] inene2;
  input [7:0] ud_lr1;
  wire [7:0] ud_lr1;
  input [7:0] ud_lr2;
  wire [7:0] ud_lr2;
  output [7:0] outene;
  wire [7:0] outene;
  output [7:0] outplot;
  wire [7:0] outplot;
  input min_select_exe;
  wire min_select_exe;
  wire _net_0;

   assign  _net_0 = 
// synthesis translate_off
// synopsys translate_off
(min_select_exe)? 
// synthesis translate_on
// synopsys translate_on
((min_select_exe)?(inene1 < inene2):1'b0)
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
if (((min_select_exe&(~_net_0))&(min_select_exe&_net_0)))
 begin $display("Warning: assign collision(min_select:outene) at %d",$time);
if ((min_select_exe&(~_net_0))) $display("assert ((min_select_exe&(~_net_0))) line 10 at %d\n",$time);
if ((min_select_exe&_net_0)) $display("assert ((min_select_exe&_net_0)) line 7 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  outene = 
// synthesis translate_off
// synopsys translate_off
(((min_select_exe&(~_net_0))&(min_select_exe&_net_0)))? 8'bx :(((min_select_exe&(~_net_0))|(min_select_exe&_net_0)))? 
// synthesis translate_on
// synopsys translate_on
(((min_select_exe&(~_net_0)))?inene2:8'b0)|
    (((min_select_exe&_net_0))?inene1:8'b0)
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
if (((min_select_exe&(~_net_0))&(min_select_exe&_net_0)))
 begin $display("Warning: assign collision(min_select:outplot) at %d",$time);
if ((min_select_exe&(~_net_0))) $display("assert ((min_select_exe&(~_net_0))) line 9 at %d\n",$time);
if ((min_select_exe&_net_0)) $display("assert ((min_select_exe&_net_0)) line 6 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  outplot = 
// synthesis translate_off
// synopsys translate_off
(((min_select_exe&(~_net_0))&(min_select_exe&_net_0)))? 8'bx :(((min_select_exe&(~_net_0))|(min_select_exe&_net_0)))? 
// synthesis translate_on
// synopsys translate_on
(((min_select_exe&(~_net_0)))?ud_lr2:8'b0)|
    (((min_select_exe&_net_0))?ud_lr1:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
endmodule

/*Produced by NSL Core(version=20240424), IP ARCH, Inc. Mon May 20 03:44:04 2024
 Licensed to :EVALUATION USER*/
