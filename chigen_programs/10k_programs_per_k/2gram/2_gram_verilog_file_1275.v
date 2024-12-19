// Seed: 1458163653
module module_0 (
    input tri1 id_0,
    output uwire id_1,
    input tri0 id_2,
    output wor id_3,
    input uwire id_4,
    input tri1 id_5,
    output tri id_6,
    output wor id_7,
    input supply1 id_8,
    input tri id_9,
    output tri id_10,
    input supply0 id_11,
    output wor id_12,
    input tri0 id_13,
    output supply1 id_14,
    input supply0 id_15,
    input wire id_16,
    input wire id_17,
    input tri1 id_18,
    output tri1 id_19
);
endmodule
module module_1 (
    input logic id_0,
    output logic id_1,
    input supply0 id_2,
    input supply1 id_3,
    output tri id_4,
    output wor id_5,
    output tri1 id_6,
    input tri id_7,
    input supply1 id_8,
    input wand id_9,
    output logic id_10,
    input supply1 id_11,
    input supply0 id_12,
    output wor id_13,
    output wire id_14,
    output wand id_15,
    input tri id_16,
    output uwire id_17
);
  final
    @(id_12 || 1'b0)
      if (id_0) id_10 <= id_0;
      else begin : LABEL_0
        id_1 <= id_0;
      end
  module_0 modCall_1 (
      id_7,
      id_15,
      id_8,
      id_4,
      id_2,
      id_3,
      id_4,
      id_5,
      id_11,
      id_16,
      id_5,
      id_16,
      id_15,
      id_12,
      id_4,
      id_11,
      id_3,
      id_7,
      id_8,
      id_4
  );
  assign modCall_1.type_3 = 0;
endmodule
