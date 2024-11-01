// Seed: 509459810
module module_0 ();
  assign id_1[1] = id_1;
endmodule
module module_1 ();
  wire id_2;
  module_0();
  wire id_3;
  wire id_5;
endmodule
module module_2 #(
    parameter id_4 = 32'd8,
    parameter id_5 = 32'd22
) (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  defparam id_4.id_5 = 1;
  wand id_6 = 1'b0;
  id_7 :
  assert property (@(posedge id_3 - 1) 1'b0 << id_3)
  else $display;
  wor id_8 = 1;
  id_9 :
  assert property (@(posedge id_6) 1)
  else $display(id_7);
  module_0();
  wire id_10;
  wire id_11 = 1;
endmodule
