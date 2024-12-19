// Seed: 2631714041
module module_0 (
    output tri0 id_0,
    input tri1 id_1,
    input wand id_2,
    output supply1 id_3
);
endmodule
module module_1 (
    output tri id_0,
    input wor id_1,
    input supply1 id_2,
    output supply0 id_3,
    output supply1 id_4,
    output wand id_5,
    output supply1 id_6,
    output supply0 id_7,
    input tri1 id_8,
    input tri id_9,
    input wand id_10,
    input supply1 id_11
);
  always @(posedge id_2) begin : LABEL_0
    wait (1);
    id_6 = 1 - {id_9{(id_2)}};
  end
  module_0 modCall_1 (
      id_5,
      id_10,
      id_8,
      id_5
  );
  assign modCall_1.id_0 = 0;
endmodule
