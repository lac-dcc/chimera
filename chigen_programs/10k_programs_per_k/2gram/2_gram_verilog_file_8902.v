// Seed: 2292695805
module module_0 (
    input uwire id_0,
    input wor id_1,
    input wor id_2,
    input tri1 id_3,
    input wor id_4,
    input tri0 id_5,
    input uwire id_6,
    input tri id_7,
    input supply1 id_8
);
  wire id_10;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input wor id_0,
    output tri0 id_1,
    input tri0 id_2,
    output supply1 id_3,
    input wor id_4,
    output supply1 id_5
    , id_9,
    output wand id_6,
    input wire id_7
);
  assign id_9 = id_0;
  assign id_6 = 1;
  module_0 modCall_1 (
      id_0,
      id_9,
      id_4,
      id_9,
      id_4,
      id_9,
      id_7,
      id_0,
      id_0
  );
endmodule
