// Seed: 3415115599
module module_0 (
    input wand id_0,
    output wand id_1,
    output tri0 id_2,
    output wire id_3,
    input supply0 id_4,
    output uwire id_5,
    output uwire id_6,
    input wire id_7,
    input tri0 id_8,
    input tri0 id_9,
    output supply1 id_10,
    input tri0 id_11,
    output tri0 id_12,
    input tri1 id_13,
    output tri0 id_14,
    output uwire id_15
);
  assign id_1 = id_8;
  wire id_17, id_18;
  assign id_15 = id_13;
  wire id_19;
  wire id_20 = id_17, id_21 = id_20;
  wire id_22;
  wire id_23;
  always if ((id_4));
endmodule
module module_1 (
    output supply1 id_0,
    input  supply0 id_1
);
  assign id_0 = id_1;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.type_0 = 0;
  wire id_3, id_4 = id_3, id_5, id_6, id_7, id_8;
  wire id_9, id_10;
  id_11(
      .id_0(id_5)
  );
  wire id_12;
  wire id_13;
endmodule
