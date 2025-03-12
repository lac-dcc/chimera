// Seed: 2483982339
module module_0 (
    input wand id_0,
    input wand id_1,
    output wand id_2,
    output wor id_3,
    output wand id_4,
    input tri id_5,
    input supply0 id_6,
    input uwire id_7,
    input tri0 id_8,
    input supply1 id_9,
    output wor id_10,
    output wand id_11,
    output supply0 id_12,
    input tri0 id_13,
    output supply0 id_14,
    input tri0 id_15,
    input wand id_16,
    output supply1 id_17,
    output tri1 id_18,
    input tri0 id_19,
    input tri1 id_20,
    output tri id_21,
    input wand id_22,
    output wor id_23,
    input wire id_24,
    input wor id_25,
    input tri0 id_26,
    output uwire id_27,
    input wire id_28,
    input supply0 id_29
    , id_33,
    input wor id_30,
    input tri1 id_31
);
  wire id_34;
  assign module_1.id_17 = 0;
  logic id_35;
  ;
endmodule
module module_1 #(
    parameter id_28 = 32'd82
) (
    output tri0 id_0,
    output supply0 id_1,
    output supply1 id_2,
    input supply1 id_3,
    output wire id_4,
    input supply1 id_5,
    output uwire id_6,
    output uwire id_7,
    output wand id_8,
    input tri1 id_9,
    output tri0 id_10,
    input supply0 id_11,
    output tri0 id_12,
    input tri id_13,
    input supply0 id_14,
    input tri id_15,
    output wand id_16,
    output tri1 id_17,
    output wand id_18,
    output supply0 id_19,
    input wor id_20,
    output wire id_21,
    output tri1 id_22,
    input uwire id_23,
    output supply1 id_24,
    input wor id_25,
    output supply0 id_26,
    input tri0 id_27,
    input wor _id_28,
    input uwire id_29,
    output wire id_30
);
  wire id_32;
  ;
  parameter id_33 = 1;
  nor primCall (
      id_18,
      id_33,
      id_20,
      id_29,
      id_13,
      id_11,
      id_14,
      id_25,
      id_23,
      id_3,
      id_5,
      id_32,
      id_27,
      id_15,
      id_34,
      id_9
  );
  wire id_34;
  module_0 modCall_1 (
      id_25,
      id_3,
      id_7,
      id_16,
      id_17,
      id_29,
      id_13,
      id_14,
      id_15,
      id_11,
      id_16,
      id_18,
      id_12,
      id_11,
      id_18,
      id_27,
      id_15,
      id_18,
      id_26,
      id_9,
      id_9,
      id_8,
      id_25,
      id_30,
      id_9,
      id_25,
      id_14,
      id_0,
      id_27,
      id_14,
      id_3,
      id_20
  );
  logic [id_28 : -1] id_35;
  wire id_36;
endmodule
