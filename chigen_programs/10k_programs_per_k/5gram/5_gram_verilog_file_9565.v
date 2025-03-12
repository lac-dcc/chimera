// Seed: 243238202
module module_0 (
    input uwire id_0,
    input tri0 id_1,
    input tri1 id_2,
    input wand id_3,
    input tri0 id_4,
    output tri0 id_5,
    input tri0 id_6,
    input tri1 id_7,
    input uwire id_8,
    output wire id_9,
    input tri0 id_10,
    input supply1 id_11,
    input supply0 id_12,
    output tri id_13,
    output tri id_14,
    input tri0 module_0,
    input tri1 id_16,
    input tri0 id_17,
    input uwire id_18,
    output supply1 id_19,
    output supply1 id_20
);
  assign id_9 = id_0 == -1;
endmodule
module module_1 (
    input wand id_0,
    input tri1 id_1,
    output supply1 id_2,
    input tri1 id_3,
    output uwire id_4,
    output supply1 id_5,
    input wand id_6,
    input tri id_7,
    output uwire id_8,
    input tri0 id_9,
    output tri1 id_10,
    input wor id_11,
    input tri id_12,
    input tri1 id_13,
    output tri0 id_14,
    input wor id_15,
    input wor id_16,
    output logic id_17
);
  localparam id_19 = !1;
  always
    if (1) begin : LABEL_0
      id_17 = 1'h0;
    end
  module_0 modCall_1 (
      id_0,
      id_13,
      id_6,
      id_9,
      id_1,
      id_8,
      id_7,
      id_9,
      id_15,
      id_2,
      id_9,
      id_15,
      id_13,
      id_10,
      id_4,
      id_9,
      id_16,
      id_7,
      id_11,
      id_8,
      id_14
  );
  assign modCall_1.id_2 = 0;
  assign #id_20 id_10 = 1;
endmodule
