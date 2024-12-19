// Seed: 4229072089
module module_0 #(
    parameter id_19 = 32'd29,
    parameter id_20 = 32'd37
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_6 = 1;
  wire id_9;
  wand id_10;
  tri1 id_11;
  assign id_8 = id_3;
  supply1 id_12;
  wire id_13, id_14, id_15;
  wire id_16;
  wire id_17 = id_15;
  wire id_18;
  defparam id_19.id_20 = 1 - id_12;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_7;
  nor primCall (id_1, id_5, id_3, id_7);
  module_0 modCall_1 (
      id_5,
      id_2,
      id_7,
      id_5,
      id_7,
      id_1,
      id_2,
      id_5
  );
endmodule
