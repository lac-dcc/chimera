// Seed: 1167518942
module module_0 (
    input wor id_0,
    input supply0 id_1,
    input wand id_2,
    input wor id_3,
    input tri0 id_4,
    input supply0 id_5,
    input tri id_6,
    input tri0 id_7,
    output wand id_8,
    output tri0 id_9,
    input tri0 id_10,
    input wand id_11,
    input tri1 id_12,
    input tri1 id_13,
    input wor id_14,
    output wand id_15,
    input supply0 id_16,
    input wor id_17,
    input supply0 id_18,
    output supply1 id_19,
    input supply0 id_20
);
  wire id_22;
  assign id_9 = 1;
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    output tri id_2,
    output tri1 id_3,
    input tri id_4,
    input wire id_5,
    input tri1 id_6,
    input uwire id_7,
    input uwire id_8,
    output uwire id_9,
    input wor id_10,
    input uwire id_11,
    input wor id_12,
    output tri id_13,
    inout tri id_14
    , id_17,
    inout supply0 id_15
);
  assign id_9 = 1;
  wire id_18, id_19;
  module_0 modCall_1 (
      id_4,
      id_10,
      id_6,
      id_5,
      id_1,
      id_6,
      id_4,
      id_14,
      id_2,
      id_3,
      id_14,
      id_15,
      id_10,
      id_6,
      id_4,
      id_9,
      id_4,
      id_7,
      id_11,
      id_14,
      id_14
  );
  assign modCall_1.type_29 = 0;
  specify
    (id_20 => id_21) = (1  : 1  : 1, id_0);
    (negedge id_22 => (id_23 +: id_1)) = (1'b0, 1);
  endspecify
endmodule
