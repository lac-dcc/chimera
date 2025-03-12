// Seed: 2740369209
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    input tri0 id_2,
    input tri id_3,
    output supply0 id_4,
    output wor id_5,
    input wor id_6,
    input supply1 id_7,
    output wire id_8,
    output supply1 id_9,
    input supply1 id_10,
    output supply0 id_11,
    output supply0 id_12,
    output wor id_13,
    input wor id_14,
    input wire id_15,
    output supply0 id_16,
    input tri0 id_17,
    input tri1 id_18
    , id_29,
    output uwire id_19,
    output wor id_20,
    output wor id_21,
    input tri1 id_22,
    input tri1 id_23,
    input supply1 id_24,
    input wire id_25,
    output wire id_26,
    output tri1 id_27
);
  assign id_8 = 1'd0;
endmodule
module module_1 (
    input tri1 id_0,
    input wor id_1,
    input supply0 id_2,
    output supply0 id_3,
    output logic id_4,
    output wand id_5
);
  always @(posedge -1'h0 ==? 1'd0) id_4 = #1 1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_5,
      id_3,
      id_1,
      id_0,
      id_3,
      id_5,
      id_1,
      id_3,
      id_3,
      id_3,
      id_0,
      id_0,
      id_5,
      id_2,
      id_2,
      id_3,
      id_3,
      id_3,
      id_0,
      id_1,
      id_1,
      id_0,
      id_3,
      id_5
  );
  assign modCall_1.id_0 = 0;
endmodule
