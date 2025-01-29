// Seed: 4180753590
module module_0 (
    input wand id_0,
    input tri id_1,
    input tri1 id_2,
    input wand id_3,
    input wor id_4,
    input wire id_5,
    input wire id_6,
    input tri0 id_7,
    input supply0 id_8,
    input supply1 id_9,
    output tri1 void id_10,
    input wire id_11
);
  wire id_13;
endmodule
module module_1 (
    input supply0 id_0,
    input uwire id_1,
    input tri id_2,
    input tri id_3,
    input supply1 id_4,
    input uwire id_5,
    output wire id_6,
    input uwire id_7,
    output wor id_8,
    output wor id_9,
    input uwire id_10,
    input uwire id_11,
    output tri id_12,
    input wand id_13
);
  for (id_15 = {id_5{id_13}}; id_3; id_9 = 1) assign id_12 = id_0;
  xnor primCall (id_8, id_0, id_1, id_3, id_10, id_15, id_11, id_16, id_4, id_13, id_5, id_7, id_2);
  wire id_16;
  module_0 modCall_1 (
      id_15,
      id_10,
      id_15,
      id_5,
      id_1,
      id_3,
      id_11,
      id_4,
      id_15,
      id_15,
      id_12,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
