// Seed: 3206656862
module module_0 (
    input wand id_0,
    input tri0 id_1,
    input supply0 id_2,
    input wire id_3
    , id_36,
    input wire id_4,
    input tri0 id_5,
    output tri1 id_6,
    output tri1 id_7,
    input wor id_8,
    input tri0 id_9,
    input supply1 id_10,
    input tri id_11,
    output tri0 id_12,
    input wor id_13,
    input supply0 id_14,
    output tri0 id_15,
    output tri0 id_16,
    output uwire id_17,
    output tri0 id_18,
    input tri1 id_19,
    input tri id_20,
    input tri0 id_21,
    output supply1 id_22,
    output tri0 id_23,
    input supply0 id_24,
    input supply1 id_25,
    input wor id_26,
    input tri1 id_27,
    output supply1 id_28,
    output wand id_29,
    output tri1 id_30,
    input supply0 id_31,
    output wire id_32,
    output tri0 id_33,
    input tri1 id_34
);
  wire id_37;
  always @(posedge 1'b0) id_36 = id_31;
endmodule
module module_1 (
    input supply1 id_0,
    output logic id_1,
    output uwire id_2,
    output wire id_3,
    input tri0 id_4,
    output tri0 id_5,
    input wire id_6,
    input tri id_7,
    input tri1 id_8,
    input wire id_9,
    input wor id_10
);
  assign id_3 = id_8;
  supply0 id_12 = id_9;
  wire id_13, id_14, id_15;
  assign id_2  = 1'd0;
  assign id_13 = id_14;
  module_0(
      id_8,
      id_12,
      id_4,
      id_4,
      id_9,
      id_4,
      id_2,
      id_5,
      id_4,
      id_9,
      id_9,
      id_7,
      id_3,
      id_8,
      id_8,
      id_12,
      id_2,
      id_3,
      id_3,
      id_7,
      id_10,
      id_8,
      id_5,
      id_2,
      id_8,
      id_9,
      id_9,
      id_4,
      id_5,
      id_5,
      id_5,
      id_9,
      id_2,
      id_3,
      id_0
  );
  always_comb @(id_6 or posedge ($display(id_0 - 1, 1, 1, id_6))) id_1 <= 1;
endmodule
