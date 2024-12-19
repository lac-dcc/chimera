// Seed: 646958287
module module_0 (
    input uwire id_0,
    input uwire id_1,
    input uwire id_2,
    output wor id_3,
    output wor id_4,
    output uwire id_5,
    input uwire id_6,
    input supply0 id_7,
    input tri id_8,
    input tri id_9,
    input supply1 id_10,
    output wire id_11,
    input wire id_12,
    output tri1 id_13,
    input supply1 id_14,
    input tri1 id_15
);
  wire id_17;
  reg  id_18;
  wire id_19;
  wire id_20;
  tri  id_21;
  wand id_22;
  always
    if (id_14) begin : LABEL_0
      id_18 <= 1;
    end
  assign id_22 = 1;
  wire id_23;
  assign id_21 = 1;
  wire id_24;
  assign id_13 = id_14;
endmodule
module module_1 (
    output tri id_0,
    input supply1 id_1
);
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.id_6 = 0;
endmodule
