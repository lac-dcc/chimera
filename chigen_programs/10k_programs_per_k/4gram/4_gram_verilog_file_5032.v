// Seed: 2538216876
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input supply1 id_2,
    input wire id_3,
    input tri id_4,
    output supply1 id_5,
    input supply0 id_6,
    input supply0 id_7,
    input wire id_8,
    output uwire id_9,
    input wire id_10,
    input uwire id_11,
    input uwire id_12,
    input wor id_13,
    output wand id_14,
    output supply0 id_15,
    output tri1 id_16,
    input tri0 id_17,
    output tri1 id_18,
    input supply0 id_19
);
endmodule
module module_1 (
    input  wand id_0,
    output tri  id_1
);
  assign id_1 = (1) ? 1'b0 : 1 ? id_0 : 1 >= id_0 ? id_0 : 1 ? id_0 : (id_0) ? id_0 : id_0;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.id_10 = 0;
endmodule
