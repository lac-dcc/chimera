// Seed: 618065154
module module_0 (
    input supply0 id_0,
    input wor id_1,
    input wand id_2,
    input tri0 id_3,
    input tri0 id_4,
    input wand id_5,
    input wand id_6,
    input tri1 id_7,
    output wor id_8,
    input tri0 id_9,
    output logic id_10,
    input supply0 id_11,
    output tri id_12,
    input tri0 id_13,
    input supply0 id_14,
    output supply1 id_15
);
  always @(id_6 or posedge id_13) begin : LABEL_0
    id_10 <= #1 1 - 1;
    #1;
  end
endmodule
module module_1 (
    output supply1 id_0,
    input supply0 id_1,
    output logic id_2,
    input wand id_3,
    input wire id_4,
    input wire id_5,
    input supply1 id_6,
    input supply0 id_7,
    output supply1 id_8,
    output uwire id_9,
    input supply0 id_10,
    input tri0 id_11,
    input supply1 id_12,
    input tri0 id_13,
    input wor id_14,
    input wor id_15,
    input wire id_16,
    input wand id_17,
    input uwire id_18,
    output wor id_19,
    input uwire id_20,
    output wire id_21,
    output wand id_22,
    output tri0 id_23
);
  id_25(
      1, 1, id_16
  );
  module_0 modCall_1 (
      id_20,
      id_1,
      id_3,
      id_15,
      id_10,
      id_18,
      id_3,
      id_17,
      id_23,
      id_15,
      id_2,
      id_5,
      id_0,
      id_7,
      id_14,
      id_21
  );
  assign modCall_1.type_9 = 0;
  initial begin : LABEL_0
    id_2 <= (1 && 1);
    id_2 <= 1;
  end
endmodule
