// Seed: 1090583018
module module_0 (
    input uwire id_0,
    input wire id_1,
    input wor id_2,
    input uwire id_3,
    input wor id_4,
    output supply0 id_5,
    input tri0 id_6,
    input uwire id_7,
    input tri id_8,
    input supply1 id_9,
    output tri id_10,
    input tri0 id_11,
    input tri id_12,
    output tri1 id_13,
    input wire id_14,
    input supply0 id_15,
    output wor id_16
);
  assign id_5 = id_3 ? id_8 : id_6 < 1'b0;
  assign id_13 = id_14;
  assign id_13 = -1'b0;
  assign module_1.id_6 = 0;
  assign id_13 = -1;
  logic id_18, id_19, id_20, id_21, id_22;
endmodule
module module_1 (
    input tri0 id_0,
    output uwire id_1,
    input wire id_2,
    input tri1 id_3,
    output tri0 id_4,
    output uwire id_5,
    input wire id_6,
    output uwire id_7,
    output tri0 id_8,
    input uwire id_9,
    input tri0 id_10,
    input tri id_11,
    output wire id_12,
    output tri id_13,
    input tri0 id_14,
    output logic id_15,
    output wand id_16,
    input tri0 id_17,
    input uwire id_18,
    input wor id_19,
    output tri0 id_20,
    output wor id_21,
    input uwire id_22,
    input tri1 id_23,
    input wor id_24,
    output supply0 id_25,
    input wand id_26,
    input tri0 id_27,
    output wor id_28
);
  always @(negedge -1) begin : LABEL_0
    id_15 <= 1;
  end
  nor primCall (
      id_21,
      id_23,
      id_17,
      id_26,
      id_19,
      id_2,
      id_27,
      id_3,
      id_18,
      id_24,
      id_14,
      id_9,
      id_6,
      id_0,
      id_22,
      id_11
  );
  module_0 modCall_1 (
      id_0,
      id_2,
      id_26,
      id_27,
      id_14,
      id_21,
      id_3,
      id_17,
      id_22,
      id_3,
      id_5,
      id_18,
      id_19,
      id_5,
      id_14,
      id_9,
      id_21
  );
endmodule
