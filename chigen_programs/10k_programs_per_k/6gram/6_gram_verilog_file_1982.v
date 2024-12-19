// Seed: 3154432285
module module_0 (
    output tri0 id_0,
    input tri id_1,
    input supply0 id_2,
    input tri0 id_3,
    input wor id_4,
    input wor id_5,
    output supply0 id_6,
    output supply1 id_7
    , id_10,
    output supply0 id_8
);
  wire id_11;
  assign id_8 = 1;
  always @(posedge 1) id_8 = (1);
  always @(posedge id_3 or posedge id_2) begin : LABEL_0
    id_10 <= "";
  end
endmodule
module module_1 (
    output supply1 id_0,
    output tri id_1,
    output wor id_2,
    input supply0 id_3
    , id_13,
    output supply1 id_4,
    input wand id_5,
    input supply1 id_6,
    input supply0 id_7,
    input tri1 id_8,
    output tri id_9,
    input wand id_10,
    output supply1 id_11
);
  module_0 modCall_1 (
      id_11,
      id_5,
      id_8,
      id_5,
      id_8,
      id_8,
      id_9,
      id_9,
      id_11
  );
  assign modCall_1.id_7 = 0;
endmodule
