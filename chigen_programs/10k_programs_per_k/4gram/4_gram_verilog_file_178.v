// Seed: 3454411986
module module_0 (
    input supply0 id_0,
    input wor id_1,
    output tri1 id_2,
    input wand id_3
);
  assign module_2.type_2 = 0;
  wire id_5;
endmodule
module module_1 (
    output supply0 id_0,
    input tri1 id_1,
    output wor id_2,
    input logic id_3,
    input uwire id_4,
    output logic id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_0,
      id_1
  );
  assign modCall_1.id_0 = 0;
  always_latch @(posedge 1) begin : LABEL_0
    id_5 <= id_3;
  end
endmodule
module module_2 (
    input tri id_0,
    input supply1 id_1,
    input wand id_2,
    output supply1 id_3,
    input uwire id_4
    , id_22,
    input uwire id_5,
    output supply0 id_6,
    output tri1 id_7,
    inout wire id_8,
    input supply1 id_9,
    output supply1 id_10,
    input tri1 id_11,
    output supply1 id_12,
    input wor id_13,
    input tri1 id_14,
    input tri1 id_15,
    output wand id_16,
    input tri id_17,
    output wor id_18,
    output wire id_19,
    output wire id_20
);
  wire id_23;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_19,
      id_8
  );
  wire id_24;
  always_ff force id_6 = id_13 - 1;
endmodule
