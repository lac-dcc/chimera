// Seed: 503292782
module module_0 (
    input  uwire id_0,
    input  wire  id_1,
    output uwire id_2,
    input  uwire id_3,
    input  wor   id_4
);
  always begin : LABEL_0
    `define pp_6 0
  end
endmodule
module module_1 (
    input uwire id_0,
    output wor id_1,
    input supply0 id_2,
    input supply1 id_3,
    input supply0 id_4,
    input wor id_5,
    input supply0 id_6,
    output logic id_7,
    output tri1 id_8,
    input wand id_9,
    output supply0 id_10,
    output wor id_11,
    input wire id_12,
    input wand id_13,
    output wand id_14,
    input wor id_15,
    input tri0 id_16,
    input wor id_17,
    output logic id_18
);
  always id_18 <= 1 ? -1 & id_2 & -1 : 1'b0;
  module_0 modCall_1 (
      id_4,
      id_13,
      id_1,
      id_5,
      id_0
  );
  assign modCall_1.id_1 = 0;
  parameter id_20 = 1;
  always begin : LABEL_0
    id_7 = -1 - id_20;
  end
endmodule
