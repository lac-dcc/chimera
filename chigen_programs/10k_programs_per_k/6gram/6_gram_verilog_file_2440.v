// Seed: 1944027873
module module_0 (
    input tri0 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input tri0 id_3,
    output tri id_4
    , id_16,
    input tri1 id_5,
    output supply1 id_6,
    input wor id_7,
    output tri1 id_8,
    output supply1 id_9,
    output wand id_10,
    input tri1 id_11,
    input supply0 id_12,
    input wire id_13,
    output tri0 id_14
);
  id_17(
      .id_0((id_4 - 1)), .id_1(id_12), .id_2(1'b0), .id_3(id_1)
  );
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output wire id_0,
    input  wire id_1,
    output wire id_2
);
  assign id_2 = id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2
  );
endmodule
