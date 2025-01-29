// Seed: 1676158503
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wand id_11, id_12, id_13;
  assign id_9 = id_10;
  wire id_14, id_15;
  assign id_5 = id_11;
endmodule
module module_1 #(
    parameter id_12 = 32'd26
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  tri id_6;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_4,
      id_1,
      id_4,
      id_5,
      id_5,
      id_3,
      id_6
  );
  wor id_7;
  final id_2 <= id_7 - -1;
  id_8 :
  assert property (@(posedge id_6) -1) id_1 += $display(1, id_8);
  wire id_9, id_10;
  parameter id_11 = id_11;
  defparam id_12 = id_12;
endmodule
