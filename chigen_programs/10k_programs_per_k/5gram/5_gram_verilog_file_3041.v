// Seed: 2049149532
module module_0 (
    output wand id_0,
    output tri0 id_1,
    input wand id_2,
    input tri0 id_3,
    input wand id_4,
    input tri id_5,
    input wire id_6,
    output tri0 id_7,
    input tri1 id_8,
    input supply0 id_9,
    output tri1 id_10,
    output wor id_11,
    input tri id_12,
    input wire id_13,
    input uwire id_14,
    output wand id_15,
    output tri0 id_16,
    input uwire id_17,
    output wor id_18,
    input uwire id_19,
    output tri0 module_0,
    input tri id_21,
    output wor id_22,
    output supply1 id_23
);
  uwire id_25 = id_4;
  assign id_0 = 1'h0;
  tri1 id_26;
  assign id_22 = 1'h0;
  specify
    (id_27 => id_28) = (1  : id_14 & 1 & id_28  : id_14, id_9);
    (id_29 => id_30) = (id_26  : 1'b0 : 1, id_1++);
    specparam id_31 = 1;
    (id_32 => id_33) = (id_31  : 1  : 1, 1  : id_29 == id_8  : 1 == 1);
    (negedge id_34 => (id_35 +: id_29)) = (id_27, id_35);
    (id_36 => id_37) = 1;
  endspecify
endmodule
module module_1 (
    output supply0 id_0,
    output wire id_1,
    output wand id_2,
    input supply0 id_3,
    output tri0 id_4
);
  assign id_1 = id_3;
  always_latch
    repeat (id_3 | id_3[1]) begin : LABEL_0
      disable id_6;
    end
  wire id_7 = id_7;
  wire id_8;
  assign id_4 = id_3;
  wire id_10;
  wire id_11;
  wire id_12;
  wire id_13;
  wire id_14, id_15, id_16, id_17;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_0,
      id_4,
      id_3,
      id_3,
      id_3,
      id_1,
      id_0,
      id_3,
      id_0,
      id_3,
      id_0,
      id_3,
      id_4,
      id_2
  );
  assign modCall_1.type_7 = 0;
endmodule
