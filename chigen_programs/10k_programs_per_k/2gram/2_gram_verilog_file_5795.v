// Seed: 4112948596
module module_0 (
    output wor id_0,
    input uwire id_1,
    input uwire id_2,
    output wor id_3,
    input tri1 id_4,
    input tri id_5,
    input supply1 id_6,
    output wire id_7,
    output tri0 id_8,
    input tri id_9,
    output tri id_10,
    output wand id_11,
    output wire id_12,
    output tri1 id_13,
    output tri0 id_14,
    output wor id_15,
    output uwire id_16,
    output wor id_17,
    input wor id_18,
    input wand id_19
);
  wire id_21;
  ;
  assign id_13 = 1;
  localparam id_22 = 1;
  assign id_14 = id_6;
  logic [-1 : -1] id_23;
  ;
  assign id_0 = id_2;
endmodule
module module_1 (
    output tri0  id_0,
    output tri0  id_1,
    input  tri   id_2,
    input  uwire id_3,
    input  wand  id_4,
    output wand  id_5
);
  wire [-1 'b0 : 1] id_7;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_4,
      id_0,
      id_3,
      id_3,
      id_4,
      id_1,
      id_0,
      id_4,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_5,
      id_2,
      id_3
  );
  assign modCall_1.id_1 = 0;
  wire [-1 : -1] id_8;
endmodule
