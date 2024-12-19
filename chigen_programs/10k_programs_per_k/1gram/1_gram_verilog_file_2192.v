// Seed: 2983240303
module module_0 (
    output wor id_0,
    input wor id_1,
    input wand id_2
    , id_9,
    input tri id_3,
    input supply0 id_4,
    input tri1 id_5,
    input tri0 id_6,
    output supply1 id_7
);
  wire id_10, id_11;
  wire id_12;
  logic [7:0] id_13;
  assign id_13[1 : 1'b0] = (id_3);
  assign module_1.id_1 = 0;
  assign id_12 = id_11;
  assign id_0 = 1;
  always begin : LABEL_0
    @(1 + id_1) id_14;
  end
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    input supply0 id_2,
    input supply0 id_3,
    output supply1 id_4
);
  wor id_6 = 1;
  tri id_7, id_8;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_3,
      id_0,
      id_3,
      id_1,
      id_1,
      id_4
  );
endmodule
