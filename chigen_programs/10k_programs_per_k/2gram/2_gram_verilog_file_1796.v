// Seed: 3909559498
module module_0 (
    output supply0 id_0,
    output uwire   id_1
);
  assign module_2.type_12 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output wire id_1,
    input wor id_2,
    input wor id_3,
    input tri0 id_4,
    output uwire id_5,
    output wand id_6,
    input tri1 id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_5,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    input supply0 id_0,
    input tri id_1,
    output tri0 id_2,
    input tri0 id_3
    , id_10,
    output wor id_4,
    input wor id_5,
    input supply0 id_6,
    input supply0 id_7,
    input supply1 id_8
);
  assign id_2 = 1'b0 - id_8;
  assign id_4 = id_5;
  module_0 modCall_1 (
      id_4,
      id_2
  );
  wire id_11 = ~id_3;
endmodule
