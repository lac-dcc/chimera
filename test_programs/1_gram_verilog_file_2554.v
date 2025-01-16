// Seed: 325047049
module module_0 (
    input uwire id_0,
    input wor id_1,
    input wor id_2,
    output supply1 id_3,
    input uwire id_4,
    output tri id_5,
    output tri1 id_6,
    output tri0 id_7,
    output uwire id_8,
    input wire id_9,
    output tri id_10,
    input wand id_11,
    input tri0 id_12,
    input wand id_13,
    input tri1 id_14,
    output wand id_15,
    input tri0 id_16,
    input tri0 id_17,
    input wire id_18,
    input supply1 id_19,
    input wor id_20
);
  wire id_22;
  wire id_23;
  assign {id_2, 1, -1'h0} = -1;
  wire id_24;
  assign id_5 = -1;
endmodule
module module_1 (
    input  uwire id_0,
    input  wire  id_1,
    input  wand  id_2,
    output uwire id_3,
    output wand  id_4
);
  assign id_3 = id_2;
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_3,
      id_0,
      id_3,
      id_4,
      id_4,
      id_3,
      id_1,
      id_4,
      id_1,
      id_1,
      id_1,
      id_0,
      id_4,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2
  );
  assign modCall_1.type_5 = 0;
endmodule
