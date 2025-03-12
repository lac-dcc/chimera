// Seed: 1067723340
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    output supply1 id_2,
    input tri0 id_3,
    input supply0 id_4,
    input uwire id_5,
    input tri0 id_6,
    input supply1 id_7,
    input wor id_8,
    output tri1 id_9,
    output wand id_10,
    input wire id_11,
    output supply0 id_12,
    input tri id_13,
    output supply0 id_14,
    input wand id_15,
    input supply1 id_16,
    input wor id_17,
    input supply1 id_18,
    input supply1 id_19,
    input uwire id_20,
    input wire id_21,
    input wor id_22,
    input supply0 id_23
);
  wire id_25;
  assign module_1.id_5 = 0;
  assign id_9 = id_25;
endmodule
module module_1 (
    output tri0 id_0,
    output tri id_1,
    input supply1 id_2,
    input tri1 id_3,
    input wor id_4,
    output logic id_5,
    input uwire id_6,
    input tri1 id_7,
    input wor id_8,
    input wand id_9,
    input supply1 id_10,
    output supply0 id_11,
    input tri0 id_12,
    output wire id_13,
    output supply1 id_14,
    input supply1 id_15,
    input tri1 id_16,
    input wor id_17,
    input wor id_18,
    input supply1 id_19,
    output logic id_20,
    output logic id_21,
    input supply1 id_22,
    output tri id_23,
    input supply1 id_24,
    input uwire id_25,
    input wire id_26,
    input wand id_27,
    output tri id_28,
    input tri0 id_29,
    output supply0 id_30,
    input tri id_31
);
  wire id_33;
  wire id_34;
  always @(id_12 or posedge id_12) begin : LABEL_0
    id_5  <= id_27;
    id_20 <= 1;
    id_21 = 1;
  end
  always id_5 = @(id_16) id_25;
  module_0 modCall_1 (
      id_4,
      id_19,
      id_28,
      id_17,
      id_22,
      id_3,
      id_31,
      id_24,
      id_24,
      id_14,
      id_11,
      id_17,
      id_23,
      id_24,
      id_28,
      id_7,
      id_29,
      id_7,
      id_6,
      id_12,
      id_7,
      id_25,
      id_12,
      id_22
  );
  assign id_28 = id_6;
endmodule
