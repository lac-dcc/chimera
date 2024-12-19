// Seed: 652234877
module module_0 (
    output wor id_0,
    output wire id_1,
    output tri0 id_2,
    input supply1 id_3,
    input supply0 id_4,
    output supply1 id_5,
    input tri0 id_6,
    input wand id_7,
    output supply0 id_8,
    input wand id_9,
    output tri id_10,
    output tri1 id_11,
    output supply1 id_12,
    output tri1 id_13
    , id_16,
    output wire id_14
);
  id_17(
      .id_0(id_4), .id_1(id_0)
  );
  assign module_1.type_1 = 0;
  wire id_18 = 1;
endmodule
module module_1 (
    output tri1 id_0,
    output tri0 id_1,
    input supply1 id_2,
    input wire id_3,
    output wand id_4,
    output tri id_5,
    input wire id_6
);
  always @(1 or posedge id_6 ? 1 : 1) id_4 = id_2;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_5,
      id_2,
      id_3,
      id_0,
      id_6,
      id_3,
      id_0,
      id_2,
      id_0,
      id_4,
      id_4,
      id_0,
      id_1
  );
endmodule
