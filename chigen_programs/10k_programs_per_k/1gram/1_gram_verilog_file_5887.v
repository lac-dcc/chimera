// Seed: 1967006665
module module_0 #(
    parameter id_10 = 32'd17,
    parameter id_11 = 32'd9,
    parameter id_9  = 32'd65
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_8;
  final $display(id_2);
  defparam id_9 = 1, id_10 = 1, id_11 = 1'b0;
endmodule
module module_1 #(
    parameter id_11 = 32'd22
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  tri1 id_6, id_7, id_8 = id_2;
  module_0(
      id_3, id_6, id_6, id_2, id_7, id_5, id_6
  ); id_9 :
  assert property (@(posedge (id_8) or 1 or posedge id_7) id_2) $display;
  wire id_10;
  defparam id_11 = 1;
endmodule
