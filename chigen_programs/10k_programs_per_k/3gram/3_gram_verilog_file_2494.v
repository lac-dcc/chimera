// Seed: 2900848029
module module_0 (
    output tri0 id_0,
    output tri0 id_1,
    input tri1 id_2,
    input wand id_3,
    input wand id_4,
    output tri0 id_5,
    inout supply0 id_6,
    output tri1 id_7
);
  assign id_1 = 1;
  wor  id_9;
  wire id_10;
  tri  id_11 = 1;
  assign id_0 = !(1);
  wire id_12;
  wire id_13, id_14, id_15, id_16, id_17, id_18;
  wand id_19 = 1, id_20;
  assign id_0  = id_9;
  assign id_18 = 1;
  always @(id_18 or posedge 1'h0);
  wire id_21;
endmodule
module module_1 (
    input tri id_0,
    input tri1 id_1,
    output tri1 id_2,
    output wor id_3,
    output tri id_4,
    input tri id_5,
    output uwire id_6,
    output tri1 id_7,
    input tri0 id_8,
    input wire id_9,
    input wor id_10,
    output wor id_11,
    output supply0 id_12,
    input wand id_13,
    output wor id_14
);
  tri1 id_16 = id_8;
  xor primCall (id_4, id_5, id_9, id_0, id_16, id_13, id_8, id_10, id_1);
  module_0 modCall_1 (
      id_6,
      id_12,
      id_10,
      id_5,
      id_1,
      id_3,
      id_16,
      id_4
  );
  assign modCall_1.type_0 = 0;
endmodule
