// Seed: 1754273356
module module_0 (
    output tri1 id_0,
    output supply0 id_1,
    input wand id_2,
    output supply0 id_3,
    input supply1 id_4,
    input wire id_5,
    output supply1 id_6,
    input supply0 id_7,
    input wor id_8
);
endmodule
module module_1 (
    output supply0 id_0,
    input tri0 id_1,
    input supply1 id_2,
    input supply1 id_3,
    input tri0 id_4,
    output supply1 id_5,
    output tri1 id_6,
    input wand id_7,
    input wand id_8,
    output supply0 id_9,
    input supply1 id_10,
    input logic id_11,
    output tri0 id_12
);
  reg id_14;
  module_0 modCall_1 (
      id_6,
      id_12,
      id_1,
      id_9,
      id_8,
      id_8,
      id_6,
      id_8,
      id_4
  );
  assign modCall_1.id_6 = 0;
  always @(*) begin : LABEL_0
    id_14 <= id_11;
  end
  assign id_9 = 1 ? id_2 : id_4;
endmodule
