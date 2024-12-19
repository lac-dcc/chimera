// Seed: 1223818876
module module_0 (
    input wire id_0,
    input wire id_1,
    input wand id_2,
    output tri0 id_3,
    input supply0 id_4
);
  tri1 id_6;
  pmos (id_1, ~id_3, id_2);
  assign id_6 = id_4;
  assign id_3 = 1;
endmodule
module module_1 (
    input uwire id_0,
    input wand id_1,
    output wor id_2,
    input supply0 id_3,
    input supply1 id_4,
    input wand id_5,
    input supply1 id_6,
    input tri id_7,
    input uwire id_8,
    input wor id_9,
    output wor id_10,
    input uwire id_11
    , id_21,
    input uwire id_12
    , id_22,
    output uwire id_13,
    output wire id_14,
    input supply0 id_15,
    output supply0 id_16
    , id_23,
    input supply1 id_17
    , id_24,
    output tri id_18,
    input wor id_19
);
  assign id_21 = id_15;
  wire id_25;
  wire id_26;
  wire id_27;
  module_0 modCall_1 (
      id_21,
      id_11,
      id_6,
      id_23,
      id_12
  );
  assign modCall_1.id_0 = 0;
  id_28(
      .id_0(id_6), .id_1(1'b0)
  );
  or primCall (
      id_14,
      id_24,
      id_26,
      id_0,
      id_3,
      id_15,
      id_19,
      id_5,
      id_1,
      id_22,
      id_11,
      id_6,
      id_25,
      id_23,
      id_7,
      id_9,
      id_8,
      id_4,
      id_21
  );
endmodule
