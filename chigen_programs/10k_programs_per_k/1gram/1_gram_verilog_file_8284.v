// Seed: 3739223107
module module_0 (
    input uwire id_0,
    input supply1 id_1,
    input tri id_2,
    input wand id_3,
    input tri1 id_4,
    input uwire id_5,
    input tri id_6,
    output tri0 id_7,
    input tri id_8,
    input supply1 id_9,
    output uwire id_10,
    input wire id_11,
    input wire id_12
);
  assign id_10 = -1 * 1;
  wire  id_14;
  logic id_15;
endmodule
module module_1 #(
    parameter id_2 = 32'd60
) (
    output supply0 id_0,
    output tri0 id_1
    , id_7,
    output wire _id_2,
    output wire id_3,
    input supply0 id_4,
    input wand id_5
);
  module_0 modCall_1 (
      id_4,
      id_5,
      id_4,
      id_4,
      id_5,
      id_4,
      id_5,
      id_0,
      id_4,
      id_4,
      id_1,
      id_4,
      id_4
  );
  assign modCall_1.id_8 = 0;
  assign id_7 = -1;
  wire id_8;
  union packed {
    logic id_9;
    logic id_10 = 1;
  } [-1 : id_2] id_11 = id_8;
endmodule
