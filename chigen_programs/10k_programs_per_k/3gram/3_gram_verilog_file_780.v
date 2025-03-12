// Seed: 507312041
module module_0 (
    output supply1 id_0,
    input supply0 id_1,
    input tri0 id_2,
    input wor id_3,
    input wor id_4,
    output tri id_5,
    output supply0 id_6,
    input supply0 id_7,
    input supply0 id_8
    , id_40,
    input wand id_9,
    output uwire id_10,
    input supply0 id_11,
    input tri id_12,
    output tri id_13
    , id_41,
    output supply0 id_14,
    input wor id_15,
    input wand id_16,
    output wand id_17,
    output tri0 id_18,
    output tri0 id_19,
    output wand id_20,
    input tri1 id_21,
    output tri1 id_22,
    input wor id_23,
    input wand id_24,
    output supply0 id_25,
    output wor id_26,
    input wor id_27,
    output wire id_28,
    input tri1 id_29,
    input tri1 id_30,
    output tri id_31,
    input tri0 id_32,
    output wor id_33,
    output tri id_34,
    input tri id_35,
    output uwire id_36,
    input tri0 id_37,
    output uwire id_38
);
  assign id_5 = 1;
  always_comb id_40 = #1 1'b0;
  parameter id_42 = -1'b0;
  assign id_25 = ~-1;
  wor id_43 = 1;
  always @(posedge id_9);
  logic id_44;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output uwire id_0,
    output supply0 id_1,
    input uwire id_2,
    output uwire id_3,
    output wor id_4,
    output wor id_5,
    inout uwire id_6,
    input tri id_7,
    input tri id_8,
    input supply1 id_9,
    input wire id_10,
    input wire id_11
    , id_14,
    input tri1 id_12
);
  wire [-1 'b0 : 1] id_15;
  wire id_16 = id_14;
  always @(-1, posedge id_16 & id_11);
  wire id_17;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_2,
      id_12,
      id_11,
      id_5,
      id_0,
      id_12,
      id_2,
      id_7,
      id_4,
      id_9,
      id_10,
      id_0,
      id_1,
      id_12,
      id_2,
      id_5,
      id_5,
      id_4,
      id_3,
      id_7,
      id_3,
      id_6,
      id_2,
      id_0,
      id_1,
      id_6,
      id_0,
      id_12,
      id_9,
      id_4,
      id_2,
      id_4,
      id_4,
      id_7,
      id_0,
      id_12,
      id_5
  );
endmodule
