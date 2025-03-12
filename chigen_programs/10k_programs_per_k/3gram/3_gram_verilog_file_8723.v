// Seed: 1533457916
module module_0 (
    input supply0 id_0,
    output uwire id_1,
    output supply1 id_2,
    input wor id_3,
    output tri0 id_4,
    output supply1 id_5
    , id_22,
    output supply0 id_6,
    input tri id_7,
    input tri1 id_8,
    output tri id_9,
    output supply0 id_10,
    input tri1 id_11,
    output supply0 id_12,
    input uwire id_13,
    input supply0 id_14,
    output tri1 id_15,
    input supply1 id_16,
    output supply1 id_17,
    input uwire id_18,
    input wire id_19,
    output supply0 id_20
);
  logic id_23;
  assign id_2  = 1;
  assign id_10 = !1;
endmodule
module module_1 (
    input uwire id_0,
    output logic id_1,
    output supply0 id_2,
    input tri id_3,
    input tri id_4,
    output supply1 id_5,
    input uwire id_6,
    output uwire id_7,
    output wor id_8,
    input wor id_9,
    input uwire id_10,
    input uwire id_11,
    output tri id_12,
    output wand id_13,
    input wire id_14
);
  always @(posedge 1 or posedge id_6) id_1 = {id_0, -1 ^ id_4};
  module_0 modCall_1 (
      id_0,
      id_2,
      id_12,
      id_4,
      id_2,
      id_2,
      id_7,
      id_4,
      id_4,
      id_12,
      id_13,
      id_10,
      id_7,
      id_6,
      id_4,
      id_7,
      id_4,
      id_12,
      id_4,
      id_10,
      id_12
  );
  assign modCall_1.id_8 = 0;
endmodule
