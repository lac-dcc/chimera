// Seed: 2450782715
module module_0 (
    input tri id_0,
    input wor id_1,
    input wire id_2,
    input wire id_3,
    input supply0 id_4,
    input supply0 id_5,
    output tri1 id_6,
    output wor id_7,
    input supply0 id_8,
    input wand id_9,
    output tri id_10,
    input supply1 id_11,
    input uwire id_12,
    input wor id_13,
    input wor id_14,
    input wand id_15,
    output supply1 id_16,
    input wor id_17,
    input wand id_18,
    input supply0 id_19,
    input uwire id_20,
    input wire id_21,
    output tri0 id_22,
    output wor id_23,
    input wire id_24,
    input uwire id_25,
    output uwire id_26,
    input tri1 id_27,
    input wire id_28,
    input tri0 id_29,
    output tri0 id_30,
    input supply0 id_31,
    input uwire id_32,
    input wand id_33,
    input tri id_34,
    output supply1 id_35,
    input supply0 id_36,
    input supply1 id_37,
    output supply0 id_38
);
  assign id_26 = 1 ~^ id_18;
  always @(|1 or id_33 >= -1'b0)
    if (1)
      if (1) begin : LABEL_0
        $unsigned(79);
        ;
      end
endmodule
module module_1 (
    input tri id_0,
    input tri0 id_1
    , id_6,
    output supply0 id_2,
    input wire id_3,
    output tri1 id_4
);
  logic id_7;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_0,
      id_0,
      id_3,
      id_0,
      id_4,
      id_4,
      id_0,
      id_1,
      id_2,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_2,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_2,
      id_4,
      id_1,
      id_3,
      id_2,
      id_0,
      id_1,
      id_1,
      id_2,
      id_1,
      id_0,
      id_0,
      id_1,
      id_4,
      id_1,
      id_1,
      id_4
  );
  assign modCall_1.id_9 = 0;
  assign id_2 = (1 !=? -1);
  assign id_4 = (id_7) < -1 ? id_3 : id_1 ? id_0 & -1'b0 : id_1;
endmodule
