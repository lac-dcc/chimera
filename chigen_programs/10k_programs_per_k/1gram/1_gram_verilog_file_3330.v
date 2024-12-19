// Seed: 1493404323
module module_0 (
    input supply1 id_0,
    input tri0 id_1,
    input tri0 id_2,
    input wor id_3,
    input wire id_4,
    output wand id_5,
    input wand id_6,
    input tri id_7,
    output uwire id_8,
    output wire id_9,
    input wand id_10,
    output supply1 id_11
);
  always id_5 = id_10;
endmodule
module module_1 (
    output supply0 id_0,
    output wire id_1,
    input wor id_2,
    input tri1 id_3,
    input uwire id_4,
    output tri1 id_5,
    input wire id_6
);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_6,
      id_2,
      id_3,
      id_0,
      id_6,
      id_4,
      id_0,
      id_5,
      id_3,
      id_1
  );
  assign modCall_1.id_3 = 0;
  assign id_5 = id_2;
  assign id_1 = id_2;
endmodule
