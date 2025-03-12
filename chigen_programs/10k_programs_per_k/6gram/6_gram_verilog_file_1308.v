// Seed: 1556065732
module module_0 (
    output supply0 id_0,
    output tri0 id_1,
    output uwire id_2,
    output wand id_3,
    input supply0 id_4,
    output supply1 id_5
);
endmodule
module module_1 (
    input supply1 id_0,
    input supply1 id_1,
    output supply1 id_2,
    output wand id_3,
    input wire id_4,
    input uwire id_5,
    input uwire id_6
    , id_20,
    input wand id_7,
    input tri0 id_8,
    output tri1 id_9,
    input wire id_10,
    input tri1 id_11
    , id_21, id_22,
    output tri0 id_12,
    output supply0 id_13,
    input tri1 id_14,
    output tri0 id_15,
    inout logic id_16,
    input tri0 id_17,
    output logic id_18
);
  always @(posedge 1) begin : LABEL_0
    id_16 = #id_23 id_17;
  end
  always @(id_20) begin : LABEL_1
    id_18 = id_11;
  end
  module_0 modCall_1 (
      id_9,
      id_9,
      id_2,
      id_2,
      id_14,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
