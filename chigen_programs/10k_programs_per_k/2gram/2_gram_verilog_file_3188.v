// Seed: 1960226982
module module_0 (
    output tri0 id_0,
    output supply0 id_1,
    input tri0 id_2,
    output tri id_3,
    input tri1 id_4,
    output supply1 id_5,
    output tri0 id_6,
    input supply1 id_7,
    input wor id_8
);
  logic id_10;
  logic id_11;
  for (id_12 = id_4; 1; id_12 = id_8) begin : LABEL_0
    wire id_13;
    ;
  end
  assign id_11 = 1;
endmodule
module module_1 (
    input tri id_0,
    input tri0 id_1,
    output wand id_2,
    input tri0 id_3,
    input tri1 id_4,
    input supply0 id_5,
    output tri0 id_6
);
  wire id_8;
  xnor primCall (id_6, id_8, id_0, id_4, id_5, id_1);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_2,
      id_3,
      id_6,
      id_6,
      id_5,
      id_3
  );
endmodule
