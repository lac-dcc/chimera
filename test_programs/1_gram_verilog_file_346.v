// Seed: 3241711414
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    output wor id_2,
    output tri1 id_3,
    input supply1 id_4,
    input supply0 id_5,
    input supply1 id_6,
    output supply0 id_7,
    output tri0 id_8,
    output uwire id_9,
    input tri0 id_10,
    input uwire id_11,
    output tri1 id_12,
    input tri0 id_13,
    output supply1 id_14,
    input wor id_15,
    input supply1 id_16,
    input supply1 id_17,
    input tri0 id_18
);
  tri id_20, id_21 = id_17;
  assign module_1.type_33 = 0;
  wire id_22;
  tri1 id_23, id_24 = id_18;
endmodule
module module_1 (
    output wire id_0,
    input logic id_1,
    output tri id_2,
    output supply1 id_3,
    output logic id_4,
    input supply0 id_5,
    input wor id_6,
    input tri0 id_7,
    input tri1 id_8,
    input wor id_9,
    input tri0 id_10,
    output wire id_11,
    id_27,
    input supply0 id_12,
    id_28,
    output supply0 id_13,
    output logic id_14,
    output logic id_15,
    input supply1 id_16,
    input wor id_17,
    input logic id_18,
    input tri id_19,
    output uwire id_20,
    output logic id_21,
    input tri0 id_22,
    input wand id_23,
    input tri0 id_24,
    input wand id_25
);
  assign id_15 = id_28;
  nand primCall (
      id_2,
      id_5,
      id_6,
      id_1,
      id_10,
      id_9,
      id_19,
      id_28,
      id_8,
      id_24,
      id_17,
      id_23,
      id_16,
      id_18,
      id_12,
      id_7,
      id_22,
      id_27,
      id_25
  );
  always if (1) id_15 <= -1;
  assign id_3 = id_24;
  module_0 modCall_1 (
      id_8,
      id_25,
      id_3,
      id_13,
      id_6,
      id_23,
      id_17,
      id_20,
      id_20,
      id_2,
      id_16,
      id_23,
      id_3,
      id_9,
      id_2,
      id_17,
      id_7,
      id_8,
      id_5
  );
  assign id_15 = id_1;
  always id_15 <= #(id_6) id_18;
  assign id_14 = id_18;
  generate
    wire id_29;
    begin : LABEL_0
      assign id_21 = id_1;
      assign id_3  = 1;
      id_30(
          -1, id_28
      );
    end
    assign id_2 = 1;
    always_comb id_4 <= -1;
  endgenerate
endmodule
