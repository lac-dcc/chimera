// Seed: 4283327658
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    output tri0 id_2,
    output supply0 id_3,
    input supply1 id_4,
    input tri0 id_5,
    output wire id_6,
    output wire id_7,
    output supply1 id_8,
    output tri id_9,
    input tri id_10,
    input uwire id_11,
    input uwire id_12,
    input wire id_13,
    input supply1 id_14,
    output supply1 id_15,
    output supply0 id_16,
    input supply0 id_17,
    input tri0 id_18,
    output wor id_19,
    input wand id_20,
    input supply0 id_21,
    output wand id_22,
    output tri id_23,
    output tri1 id_24,
    input supply1 id_25,
    output tri1 id_26,
    input wire id_27
);
endmodule
module module_1 (
    input  tri   id_0,
    output logic id_1,
    input  wor   id_2,
    output tri1  id_3,
    input  tri1  id_4,
    input  wor   id_5
);
  initial id_1 <= -1'b0;
  assign id_1 = (id_2);
  localparam id_7 = 1;
  not primCall (id_3, id_7);
  module_0 modCall_1 (
      id_0,
      id_5,
      id_3,
      id_3,
      id_5,
      id_0,
      id_3,
      id_3,
      id_3,
      id_3,
      id_0,
      id_2,
      id_4,
      id_0,
      id_2,
      id_3,
      id_3,
      id_5,
      id_2,
      id_3,
      id_5,
      id_5,
      id_3,
      id_3,
      id_3,
      id_2,
      id_3,
      id_4
  );
  assign modCall_1.id_26 = 0;
endmodule
