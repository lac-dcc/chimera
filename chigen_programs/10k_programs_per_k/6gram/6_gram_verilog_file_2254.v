// Seed: 1258495807
module module_0 (
    input wand id_0,
    input tri0 id_1,
    output wand id_2,
    input supply0 id_3,
    input tri1 id_4,
    input wor id_5,
    input wor id_6,
    input supply0 id_7,
    input uwire id_8,
    input wor id_9,
    input uwire id_10,
    input wor id_11,
    input supply1 id_12
    , id_14
);
  wire id_15;
  assign module_1.id_2 = 0;
  always @(posedge id_0) begin : LABEL_0
    wait (-1);
  end
endmodule
module module_1 (
    output wire id_0,
    input wor id_1,
    input tri id_2,
    output wor id_3,
    input wand id_4,
    output supply1 id_5
);
  always disable id_7;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_5,
      id_2,
      id_2,
      id_2,
      id_1,
      id_1,
      id_2,
      id_4,
      id_2,
      id_2,
      id_4
  );
endmodule
