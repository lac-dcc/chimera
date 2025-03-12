// Seed: 3530931725
module module_0 (
    output supply1 id_0,
    input supply0 id_1,
    input wor id_2,
    output wor id_3,
    input wand id_4,
    input wor id_5,
    input supply0 id_6,
    input wor id_7,
    output supply0 id_8,
    output wor id_9,
    input uwire id_10,
    input wor id_11,
    input tri1 id_12,
    input wand id_13,
    input supply0 id_14,
    input wor id_15,
    input wire id_16,
    output wand id_17,
    output supply0 id_18,
    input uwire id_19,
    output wand id_20,
    input tri id_21
);
  logic id_23;
  ;
endmodule
module module_1 (
    output uwire id_0,
    input supply0 id_1,
    input supply1 id_2,
    input tri id_3,
    input tri id_4,
    output logic id_5,
    output uwire id_6,
    input wand id_7,
    input supply0 id_8,
    input wire id_9,
    input wor id_10,
    output tri0 id_11,
    input wand id_12,
    input tri0 id_13,
    input wand id_14,
    input supply0 id_15,
    output wand id_16,
    input supply1 id_17,
    input tri1 id_18,
    input uwire id_19
);
  assign id_5  = 1;
  assign id_0  = -1;
  assign id_11 = id_7;
  logic id_21;
  ;
  assign id_0 = -1;
  logic id_22;
  ;
  logic [-1 : ""] id_23;
  initial begin : LABEL_0
    id_5 <= #id_22 id_10 + id_23[-1];
    deassign id_23;
    id_22 <= 1;
  end
  module_0 modCall_1 (
      id_0,
      id_10,
      id_19,
      id_6,
      id_3,
      id_2,
      id_13,
      id_19,
      id_6,
      id_6,
      id_14,
      id_8,
      id_7,
      id_14,
      id_7,
      id_17,
      id_10,
      id_6,
      id_16,
      id_1,
      id_6,
      id_17
  );
  assign modCall_1.id_15 = 0;
  assign id_21 = -1;
endmodule
