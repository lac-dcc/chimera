// Seed: 4240928919
module module_0 (
    input wand id_0,
    output supply0 id_1,
    output logic id_2[-1 : (  -1  )],
    input tri id_3,
    input wand id_4,
    output tri1 id_5,
    input wire id_6,
    output uwire id_7,
    output uwire id_8,
    output uwire void id_9,
    input wire id_10,
    input uwire id_11,
    input uwire id_12,
    output tri id_13,
    input wire id_14
);
  always id_2 = id_12;
  wire id_16;
  assign id_5 = id_0 == 1 & id_14, id_9 = id_0;
endmodule
module module_1 #(
    parameter id_13 = 32'd17,
    parameter id_4  = 32'd12
) (
    input tri0 id_0,
    input supply1 id_1,
    output logic id_2,
    output supply1 id_3,
    output tri0 _id_4,
    input uwire id_5[id_13 : id_4],
    input supply0 id_6,
    input tri id_7,
    input supply0 id_8,
    input uwire id_9,
    input tri0 id_10,
    output wand id_11,
    output wire id_12,
    output wire _id_13,
    output wand id_14,
    input wor id_15,
    output wire id_16,
    input uwire id_17,
    input supply1 id_18,
    output supply1 id_19,
    input supply1 id_20,
    input tri1 id_21,
    input tri id_22,
    input uwire id_23,
    input supply1 id_24,
    input supply1 id_25,
    output supply1 id_26,
    output wor id_27,
    input supply1 id_28
);
  module_0 modCall_1 (
      id_21,
      id_11,
      id_2,
      id_23,
      id_18,
      id_3,
      id_17,
      id_16,
      id_16,
      id_14,
      id_18,
      id_1,
      id_18,
      id_19,
      id_20
  );
  assign modCall_1.id_1 = 0;
  always id_2 <= #1 id_20;
endmodule
