// Seed: 590111537
module module_0 (
    output wand id_0,
    output wor id_1,
    input supply0 id_2,
    output supply1 id_3,
    input tri1 id_4,
    input uwire id_5,
    input wand id_6,
    input tri1 id_7,
    input wand id_8
);
  wire id_10, id_11, id_12 = ~1, id_13;
  always @(posedge id_4);
  wire id_14;
endmodule
module module_1 (
    output wor id_0,
    input supply0 id_1,
    input supply0 id_2,
    input supply1 id_3,
    input wor id_4,
    input wire id_5,
    output tri0 id_6#(.id_9(1'h0)),
    output uwire id_7
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_4,
      id_6,
      id_4,
      id_5,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
