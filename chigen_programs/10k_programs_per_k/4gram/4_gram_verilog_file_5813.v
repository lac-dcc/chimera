// Seed: 3026622382
module module_0 (
    input  wor   id_0,
    output logic id_1
);
  wor id_3;
  initial begin : LABEL_0
    id_1 <= id_3 == id_3 - id_0;
  end
  always_ff disable id_4;
endmodule
module module_1 (
    output tri0 id_0,
    output tri0 id_1,
    output wand id_2,
    input wand id_3,
    input tri0 id_4,
    output wire id_5,
    output supply0 id_6,
    input uwire id_7,
    input supply1 id_8,
    input tri0 id_9,
    input tri0 id_10,
    input tri1 id_11,
    input tri0 id_12,
    output uwire id_13,
    output tri1 id_14,
    output wire id_15,
    input tri id_16,
    output tri1 id_17,
    input uwire id_18,
    input wire id_19,
    output wand id_20,
    input tri0 id_21,
    input wor id_22,
    input wand id_23,
    output logic id_24
);
  always_comb
    if (id_19) begin : LABEL_0
      id_24 <= 1;
    end else id_20 = 1;
  xor primCall (
      id_1, id_21, id_10, id_12, id_4, id_18, id_11, id_23, id_7, id_3, id_8, id_19, id_22, id_16
  );
  module_0 modCall_1 (
      id_19,
      id_24
  );
  assign modCall_1.type_6 = 0;
endmodule
