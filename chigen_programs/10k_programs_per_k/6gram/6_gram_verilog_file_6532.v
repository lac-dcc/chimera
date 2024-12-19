// Seed: 2151352867
module module_0 (
    input tri0 id_0,
    output tri0 id_1,
    output supply1 id_2,
    output supply1 id_3,
    input supply0 id_4,
    output supply0 id_5,
    input wor id_6,
    input wire id_7,
    output tri0 id_8,
    output tri id_9,
    output supply0 id_10,
    input wor id_11,
    input wor id_12,
    input supply1 id_13,
    output tri1 id_14
);
  wire id_16;
  assign id_9 = 1;
  wire id_17;
  assign id_3 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    output wor id_2
);
  id_4(
      .id_0(1)
  );
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.id_5 = 0;
  wire id_5 = !id_0;
  assign id_2 = 1 ? 1'b0 : 1'b0;
endmodule
