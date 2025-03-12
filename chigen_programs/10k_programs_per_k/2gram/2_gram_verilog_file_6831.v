// Seed: 2829899222
module module_0 (
    input supply0 id_0,
    input wor id_1,
    input tri1 id_2,
    input supply0 id_3,
    input tri1 id_4,
    input wor id_5,
    input tri1 id_6,
    output tri0 id_7
    , id_11,
    input wor id_8,
    input supply1 id_9
);
  wire id_12;
endmodule
module module_1 (
    input tri id_0,
    output uwire id_1,
    output wor id_2
    , id_7,
    input supply1 id_3,
    input tri id_4,
    output supply1 id_5
);
  initial @(id_0 or posedge id_7);
  logic id_8 = id_0 - id_7;
  assign id_7 = id_8;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_4,
      id_0,
      id_3,
      id_4,
      id_0,
      id_5,
      id_3,
      id_3
  );
  assign modCall_1.id_8 = 0;
endmodule
