// Seed: 759771622
module module_0 (
    input tri0 id_0,
    input wand id_1,
    input tri1 id_2,
    input wand id_3,
    input wire id_4,
    input wor id_5,
    input supply0 id_6
    , id_35,
    input wand id_7,
    input tri1 id_8,
    input wor id_9,
    input supply0 id_10,
    output supply0 id_11,
    input supply0 id_12,
    input wor id_13,
    input wire id_14,
    input tri1 id_15,
    input wand id_16,
    output tri id_17,
    output tri1 id_18,
    output wor id_19,
    output uwire id_20,
    output wor id_21,
    output wor id_22,
    input supply0 id_23,
    input supply1 id_24,
    output supply0 id_25,
    input supply0 id_26,
    input wor id_27,
    input wand id_28,
    input wor id_29,
    output supply0 id_30,
    output wor id_31,
    input uwire id_32,
    output wand id_33
);
  tri  id_36;
  wire id_37;
  assign id_21 = ~id_12;
  assign id_36 = id_23;
endmodule
module module_1 (
    input supply1 id_0,
    output tri id_1,
    input wor id_2,
    input uwire id_3,
    input supply1 id_4,
    output logic id_5,
    input wor id_6
);
  always @(negedge 1 or posedge id_4) forever id_5 = #1 1'b0;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_6,
      id_2,
      id_3,
      id_0,
      id_6,
      id_0,
      id_2,
      id_4,
      id_3,
      id_1,
      id_6,
      id_0,
      id_2,
      id_6,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_4,
      id_2,
      id_1,
      id_0,
      id_4,
      id_4,
      id_4,
      id_1,
      id_1,
      id_0,
      id_1
  );
  assign modCall_1.id_19 = 0;
endmodule
