// Seed: 1364735408
module module_0 (
    input tri0 id_0,
    output tri1 id_1,
    input uwire id_2,
    output wire id_3,
    input wand id_4,
    input tri0 id_5,
    output supply0 id_6,
    input tri1 id_7,
    input wire id_8,
    output tri0 id_9,
    input tri1 id_10
);
endmodule
module module_1 (
    input wor id_0,
    output logic id_1,
    input tri id_2,
    output supply1 id_3,
    output wor id_4,
    input supply1 id_5,
    output tri id_6,
    output wire id_7,
    output supply0 id_8,
    input wor id_9,
    input tri0 id_10,
    input tri1 id_11,
    output tri0 id_12,
    output wire id_13,
    input supply0 id_14,
    output supply0 id_15,
    output tri1 id_16,
    output uwire id_17,
    input tri0 id_18,
    output wand id_19,
    output tri0 id_20,
    output wand id_21,
    input wire id_22,
    input wor id_23,
    input tri0 id_24,
    input supply1 id_25
);
  assign id_12 = 1;
  wire [1 : -1] id_27;
  or primCall (
      id_4, id_2, id_22, id_24, id_11, id_27, id_25, id_23, id_28, id_14, id_10, id_18, id_9, id_29
  );
  parameter id_28 = -1;
  wire id_29;
  module_0 modCall_1 (
      id_0,
      id_8,
      id_5,
      id_20,
      id_14,
      id_2,
      id_3,
      id_24,
      id_22,
      id_3,
      id_5
  );
  assign modCall_1.id_1 = 0;
  initial begin : LABEL_0
    id_1 <= id_22;
  end
endmodule
