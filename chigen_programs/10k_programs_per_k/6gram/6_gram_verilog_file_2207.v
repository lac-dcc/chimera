// Seed: 1956036064
module module_0 (
    input logic id_0,
    output wor id_1,
    output tri id_2,
    input wor id_3
    , id_17,
    output uwire id_4,
    output wire id_5,
    input tri id_6,
    input tri id_7,
    input uwire id_8,
    output tri0 id_9,
    output wor id_10,
    output tri1 id_11,
    input supply1 id_12,
    input uwire id_13,
    output wor id_14,
    output wor id_15
);
  initial
    if (id_7)
      if (id_13 + 1) begin : LABEL_0
        id_17 <= id_0;
      end
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    output supply1 id_2,
    input wand id_3,
    input supply1 id_4,
    input supply0 id_5,
    output logic id_6,
    input wor id_7,
    output tri id_8,
    output wor id_9,
    input logic id_10,
    input tri1 id_11,
    inout tri id_12,
    output wand id_13
);
  wire id_15;
  module_0 modCall_1 (
      id_10,
      id_2,
      id_12,
      id_4,
      id_9,
      id_2,
      id_7,
      id_4,
      id_1,
      id_12,
      id_9,
      id_2,
      id_7,
      id_12,
      id_8,
      id_2
  );
  assign modCall_1.id_15 = 0;
  always @(negedge 1) begin : LABEL_0
    id_6 <= id_10;
  end
endmodule
