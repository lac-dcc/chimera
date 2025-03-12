// Seed: 795463088
module module_0 (
    output supply0 id_0,
    input tri0 id_1
);
endmodule
module module_1 (
    input tri1 id_0,
    input wor id_1,
    output tri id_2,
    input tri id_3,
    input wand id_4,
    output supply1 id_5,
    input wand id_6
);
  assign id_5 = -1;
  module_0 modCall_1 (
      id_5,
      id_1
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    input tri1 id_0,
    input supply0 id_1,
    output logic id_2,
    input tri id_3,
    input wor id_4
    , id_26,
    output wire id_5,
    input wire id_6,
    output logic id_7,
    input supply1 id_8,
    input uwire id_9,
    output logic id_10,
    input wor id_11,
    input wor id_12,
    output logic id_13,
    output tri id_14,
    input wor id_15,
    input wand id_16,
    output logic id_17,
    output tri1 id_18,
    input tri id_19,
    input wire id_20,
    output tri1 id_21,
    input tri0 id_22,
    input wor id_23,
    output tri0 id_24
);
  integer id_27;
  always id_17 <= id_12;
  assign id_2 = $signed(24);
  ;
  always_latch begin : LABEL_0
    if (1)
      fork : SymbolIdentifier
        id_2  <= id_4 < -1;
        id_7  <= id_0;
        id_13 <= id_22;
      join
    if (1) begin : LABEL_1
      id_10 = -1'b0;
      id_17 = 1 + id_6;
    end
  end
  module_0 modCall_1 (
      id_18,
      id_11
  );
  assign modCall_1.LABEL_0.id_1 = 0;
endmodule
