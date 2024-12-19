// Seed: 575515630
module module_0 #(
    parameter id_14 = 32'd93,
    parameter id_15 = 32'd18
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign module_1.id_5 = 0;
  defparam id_14.id_15 = 1'b0;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  supply1 id_3;
  assign id_3 = 1;
  wand id_4;
  wand id_5;
  supply0 id_6;
  assign id_1[1] = id_5;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_3,
      id_2,
      id_3,
      id_4,
      id_5,
      id_5,
      id_3,
      id_6,
      id_6,
      id_2,
      id_2
  );
  wire id_7;
  wire id_8;
  assign id_5 = 1;
  assign id_3 = id_6;
endmodule
