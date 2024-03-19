// Automatically generated Verilog-2001
module Hardware_topEntity7_1(// clock
                            system1000
                            ,// asynchronous reset: active low
                            system1000_rstn
                            ,topLet_o);
  input system1000;
  input system1000_rstn;
  output [32:0] topLet_o;
  wire [129:0] subjLet_0;
  wire [32:0] x_1;
  Hardware_topEntity_w_2 Hardware_topEntity_w_2_subjLet_0
  (.altLet_o (subjLet_0)
  ,.system1000 (system1000)
  ,.system1000_rstn (system1000_rstn));
  
  assign x_1 = subjLet_0[33:1];
  
  assign topLet_o = x_1;
endmodule
