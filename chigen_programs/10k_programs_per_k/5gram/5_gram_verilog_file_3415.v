// Seed: 2698726177
module module_0 (
    output tri1 id_0,
    input supply0 id_1,
    output supply1 id_2,
    input uwire id_3,
    input wire id_4,
    input wand id_5,
    output supply1 id_6
);
  logic [-1 : -1] id_8 = id_4;
  logic id_9 = 1;
  wire id_10;
endmodule
module module_1 (
    input  wire id_0,
    output tri1 id_1,
    output tri0 id_2,
    input  tri  id_3,
    input  wire id_4
);
  assign id_1 = 1;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_2
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 #(
    parameter id_7 = 32'd4
) (
    output supply0 id_0,
    output wand id_1
    , id_9,
    input wor id_2
    , id_10,
    input supply0 id_3,
    output wire id_4,
    input tri1 id_5,
    input tri1 id_6,
    input wire _id_7
);
  logic [-1 : id_7] id_11 = id_11, id_12;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_1,
      id_5,
      id_5,
      id_6,
      id_4
  );
  assign modCall_1.id_9 = 0;
  assign id_12 = id_5;
endmodule
