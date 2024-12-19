// Seed: 1252357512
module module_0 (
    input wand id_0,
    output supply1 id_1,
    output supply0 id_2,
    output tri id_3,
    input tri id_4,
    input supply0 id_5,
    output wand id_6,
    output wor id_7,
    output wand id_8,
    input wand id_9,
    input wand id_10,
    input wire id_11
    , id_15,
    output wire id_12,
    input tri id_13
);
  wire id_16;
  tri  id_17 = 1 + 1;
  wire id_18;
  wire id_19;
endmodule
module module_1 (
    output tri1 id_0,
    input supply1 id_1,
    output logic id_2
);
  always @(posedge 1) begin : LABEL_0
    if (id_1) for (id_2 = id_1; id_1; id_0 = 1) id_2 <= 1;
  end
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1
  );
  assign modCall_1.type_3 = 0;
endmodule
