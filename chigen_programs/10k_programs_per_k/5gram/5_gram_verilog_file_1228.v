// Seed: 3892884686
module module_0 (
    input wand id_0,
    output uwire id_1,
    output supply0 id_2,
    input supply0 id_3,
    input wire id_4,
    output tri0 id_5,
    input tri id_6
    , id_9,
    input wand id_7
);
  wire id_10;
  always @(posedge id_7) id_1 = 1;
  assign module_1.type_2 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input uwire id_1,
    output wand id_2,
    output tri1 id_3,
    output wor id_4,
    input wand id_5,
    input tri id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_4,
      id_0,
      id_6,
      id_4,
      id_5,
      id_6
  );
endmodule
