// Seed: 1157605297
module module_0 (
    input wand id_0,
    output supply1 id_1,
    output tri0 id_2,
    output tri1 id_3,
    input tri1 id_4,
    output tri0 id_5
);
  logic [(  1  ) : 1  <  -1] id_7;
  assign id_3 = id_7;
  tri id_8;
  ;
  always @(posedge id_0 - 1 or posedge 1) force id_2 = id_7;
  assign id_8 = 1'd0 ? 1 : 1;
endmodule
module module_1 (
    output wand id_0,
    input supply1 id_1,
    input wire id_2,
    output tri1 id_3,
    input supply1 id_4,
    input tri0 id_5,
    input supply0 id_6,
    output wire id_7,
    input tri0 id_8,
    input supply1 id_9,
    output tri id_10,
    input supply1 id_11,
    input supply1 id_12,
    output wand id_13,
    input supply1 id_14,
    output supply1 id_15,
    output supply1 id_16,
    input tri id_17
);
  module_0 modCall_1 (
      id_4,
      id_16,
      id_0,
      id_3,
      id_2,
      id_13
  );
  assign modCall_1.id_2 = 0;
  assign id_16 = -1'b0 || id_6;
  always @(posedge id_2) #1;
endmodule
