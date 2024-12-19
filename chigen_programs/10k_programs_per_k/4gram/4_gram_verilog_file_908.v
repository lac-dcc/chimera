// Seed: 3300767972
module module_0 (
    output uwire id_0,
    output tri1 id_1,
    output supply1 id_2,
    input wor id_3,
    input supply0 id_4,
    input tri0 id_5,
    input wor id_6,
    input wire id_7,
    input wor id_8
    , id_29,
    input supply0 id_9,
    output wand id_10,
    input uwire id_11,
    input uwire id_12,
    output supply1 id_13,
    output wire id_14,
    output supply1 id_15,
    input supply1 id_16,
    input uwire id_17,
    input wire id_18,
    output tri id_19,
    input supply1 id_20,
    output tri id_21,
    input tri0 id_22,
    output tri id_23,
    input tri id_24,
    output supply1 id_25,
    input wand id_26
    , id_30,
    input tri id_27
);
  assign id_0 = id_6;
  assign id_2 = id_3;
  assign id_13 = 1 ? 1'b0 : 1'b0;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    input tri id_0,
    input supply0 id_1,
    output tri1 id_2
);
  wire id_4;
  wire id_5, id_6, id_7, id_8, id_9, id_10;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_0,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0,
      id_0,
      id_1,
      id_2,
      id_0,
      id_2,
      id_1,
      id_2,
      id_0,
      id_2,
      id_0,
      id_1
  );
  id_11(
      .id_0(id_2), .id_1((id_0)), .id_2(1'h0), .id_3(id_6)
  );
endmodule
