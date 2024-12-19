// Seed: 1140033260
module module_0 (
    input wand id_0,
    output supply0 id_1,
    input wor id_2,
    input wand id_3,
    input tri0 id_4,
    input tri0 id_5,
    input wand id_6,
    output tri1 id_7,
    output wor id_8,
    input tri0 id_9,
    output supply0 id_10,
    output tri id_11,
    input tri0 id_12,
    input supply0 id_13,
    input supply1 id_14
);
  always @(id_5 or posedge |id_6) begin : LABEL_0
    id_11 = 1;
  end
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input tri1 id_1,
    output supply0 id_2,
    output supply0 id_3,
    output tri id_4,
    output tri1 id_5,
    output tri1 id_6,
    output supply1 id_7,
    output tri0 id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_4,
      id_7,
      id_1,
      id_7,
      id_2,
      id_0,
      id_1,
      id_0
  );
endmodule
