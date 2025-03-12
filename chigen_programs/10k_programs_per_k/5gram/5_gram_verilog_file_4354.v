// Seed: 4167891897
module module_0 (
    output supply0 id_0,
    input uwire id_1,
    input supply0 id_2,
    input wand id_3,
    input supply1 id_4,
    input uwire id_5,
    input wor id_6,
    input wire id_7,
    input wor id_8,
    input tri id_9,
    input supply1 id_10,
    input tri id_11,
    output supply1 id_12,
    output uwire id_13,
    output wand id_14,
    input tri0 id_15,
    input tri0 id_16
);
  wire id_18;
endmodule
module module_1 (
    input tri1 id_0,
    inout tri0 id_1,
    output tri id_2
    , id_15,
    input tri0 id_3,
    input supply1 id_4,
    output tri0 id_5,
    output logic id_6,
    input uwire id_7,
    input tri1 id_8,
    output logic id_9,
    input tri0 id_10,
    output wire id_11,
    input wire id_12,
    output wand id_13
);
  assign id_11 = 1;
  wire id_16;
  wire id_17;
  module_0 modCall_1 (
      id_13,
      id_8,
      id_3,
      id_12,
      id_1,
      id_4,
      id_8,
      id_12,
      id_8,
      id_7,
      id_4,
      id_8,
      id_11,
      id_2,
      id_1,
      id_12,
      id_3
  );
  assign modCall_1.id_9 = 0;
  always @(id_8, 1) begin : LABEL_0
    id_6 = 1 ? "" : 1;
    id_9 = #id_18 -1 - id_1;
  end
endmodule
