// Seed: 2368354383
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    input tri0 id_2,
    input wor id_3,
    input tri id_4,
    input wire id_5,
    input uwire id_6,
    input wand id_7,
    input tri1 id_8,
    input wand id_9,
    output tri1 id_10,
    output wand id_11
    , id_17,
    input tri0 id_12,
    input wand id_13,
    input tri id_14,
    output wire id_15
);
  wire id_18;
endmodule
macromodule module_1 (
    input  tri0  id_0,
    output logic id_1,
    input  wire  id_2,
    input  tri1  id_3,
    output wire  id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_3,
      id_0,
      id_3,
      id_3,
      id_3,
      id_2,
      id_3,
      id_4,
      id_4,
      id_2,
      id_3,
      id_3,
      id_4
  );
  assign modCall_1.id_5 = 0;
  always begin : LABEL_0
    id_1 <= 1;
  end
  wire id_7;
endmodule
