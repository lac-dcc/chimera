// Seed: 3558188369
module module_0 (
    output tri id_0,
    input supply0 id_1,
    output tri id_2,
    input supply0 id_3,
    output tri0 id_4,
    input tri0 id_5
);
  assign id_0 = -1;
endmodule
module module_1 (
    input tri0 id_0,
    input wor id_1,
    input uwire id_2,
    input wor id_3,
    input uwire id_4,
    input tri1 id_5,
    input wor id_6,
    input supply0 id_7,
    input uwire id_8,
    output wire id_9,
    input uwire id_10,
    output tri0 id_11,
    input tri1 id_12,
    input tri0 id_13,
    output uwire id_14,
    output wire id_15,
    input tri0 id_16,
    output uwire id_17,
    input wand id_18
    , id_30,
    input tri0 id_19,
    input wor id_20,
    input tri0 id_21,
    output uwire id_22,
    input tri id_23,
    output tri0 id_24,
    input wand id_25,
    input wire id_26,
    input uwire id_27,
    input tri1 id_28
);
  nor primCall (
      id_14,
      id_3,
      id_23,
      id_10,
      id_4,
      id_19,
      id_20,
      id_5,
      id_21,
      id_18,
      id_26,
      id_2,
      id_8,
      id_27,
      id_30,
      id_1,
      id_12,
      id_13,
      id_0
  );
  module_0 modCall_1 (
      id_22,
      id_27,
      id_22,
      id_16,
      id_22,
      id_7
  );
  assign modCall_1.id_3 = 0;
  always @(-1) id_30 <= 1'b0;
endmodule
