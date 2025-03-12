// Seed: 262743451
module module_0 (
    output tri id_0,
    input supply1 id_1,
    input supply0 id_2,
    output supply1 id_3,
    input tri0 id_4,
    output wor id_5,
    input tri1 id_6,
    input uwire id_7,
    input tri id_8,
    output wire id_9,
    output uwire id_10,
    input wand id_11,
    input wire id_12
);
  wire id_14;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input wor id_0,
    output uwire id_1,
    input wand id_2,
    input tri id_3,
    output logic id_4,
    output wand id_5,
    output supply0 id_6,
    output wor id_7,
    output wand id_8,
    output wor id_9,
    output supply0 id_10,
    input supply0 id_11,
    output supply1 id_12,
    output logic id_13,
    input supply0 id_14,
    input wor id_15,
    output tri1 id_16,
    input tri1 id_17
);
  logic id_19;
  module_0 modCall_1 (
      id_9,
      id_2,
      id_0,
      id_5,
      id_0,
      id_6,
      id_17,
      id_14,
      id_2,
      id_8,
      id_9,
      id_17,
      id_15
  );
  assign id_4 = id_0;
  initial
    for (id_1 = id_0; id_17; id_4 = 1) begin : LABEL_0
      id_13 = -1;
    end
endmodule
