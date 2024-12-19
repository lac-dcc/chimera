// Seed: 2632126044
module module_0 #(
    parameter id_13 = 32'd80,
    parameter id_14 = 32'd56
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
    id_10
);
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_11, id_12;
  assign {id_6, 1 - (id_8)} = id_4;
  defparam id_13 = (1), id_14 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    output wor id_2,
    input uwire id_3,
    input wor id_4,
    input wire id_5,
    input uwire id_6
    , id_12,
    input supply0 id_7,
    input uwire id_8,
    input supply0 id_9,
    input tri id_10
);
  assign id_2 = id_8;
  supply1 id_13 = id_1;
  wire id_14;
  wire id_15;
  assign id_12 = id_10;
  module_0 modCall_1 (
      id_14,
      id_15,
      id_15,
      id_14,
      id_14,
      id_14,
      id_15,
      id_15,
      id_14,
      id_15
  );
endmodule
