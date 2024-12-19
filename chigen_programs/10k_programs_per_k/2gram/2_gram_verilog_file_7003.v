// Seed: 36449828
module module_0 (
    output supply0 id_0,
    input wor id_1,
    input wor id_2,
    output wor id_3,
    input wor id_4,
    output wire id_5,
    input tri0 id_6,
    input wand id_7
);
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    input wor id_2,
    input supply1 id_3
);
  assign id_5 = (id_2);
  module_0 modCall_1 (
      id_5,
      id_3,
      id_5,
      id_5,
      id_3,
      id_5,
      id_0,
      id_5
  );
  assign modCall_1.id_3 = 0;
  tri0 id_6;
  assign id_5 = id_6;
  for (id_7 = 1; id_0; id_7 = id_0) begin : LABEL_0
    assign id_5 = id_5;
  end
endmodule
