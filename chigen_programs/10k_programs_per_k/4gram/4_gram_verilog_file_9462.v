// Seed: 4097014371
module module_0 (
    input wand id_0,
    output tri0 id_1,
    output uwire id_2,
    input tri0 id_3,
    input tri id_4,
    input tri id_5,
    input wire id_6,
    output tri id_7,
    input supply0 id_8,
    input uwire id_9,
    input tri1 id_10,
    input wire id_11,
    output wire id_12
);
  wire  id_14;
  wire  id_15;
  logic id_16;
  ;
endmodule
module module_1 #(
    parameter id_1 = 32'd96
) (
    output tri0 id_0,
    input wand _id_1,
    input tri1 id_2,
    output uwire id_3,
    input supply0 id_4,
    output tri0 id_5,
    output wor id_6,
    input supply1 id_7,
    input wire id_8,
    input wor id_9,
    output supply0 id_10
);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_9,
      id_9,
      id_8,
      id_7,
      id_10,
      id_2,
      id_9,
      id_8,
      id_4,
      id_3
  );
  assign modCall_1.id_0 = 0;
  assign id_6 = -1;
  logic [1 'b0 : -1] id_12[id_1 : 1] = id_8;
endmodule
