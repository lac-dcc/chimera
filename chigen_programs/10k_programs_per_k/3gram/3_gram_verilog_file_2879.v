// Seed: 2224566608
module module_0 (
    output supply0 id_0,
    output wor id_1,
    input wire id_2,
    input supply1 id_3,
    input supply1 id_4,
    output wire id_5,
    output uwire id_6,
    output uwire id_7,
    output supply0 id_8,
    output supply1 id_9,
    output wor id_10,
    input tri0 id_11,
    input uwire id_12,
    input wand id_13,
    output tri1 id_14,
    output supply0 id_15,
    input tri0 id_16
    , id_27,
    output wire id_17,
    output tri id_18,
    input tri id_19,
    input tri0 id_20,
    input tri1 id_21,
    input tri0 id_22,
    output tri0 id_23,
    output supply1 id_24,
    input supply0 id_25
);
endmodule
module module_1 (
    input tri0 id_0,
    input supply1 id_1,
    inout wor id_2
);
  wire id_4;
  notif1 primCall (id_2, id_6, id_1);
  id_5(
      .id_0(1), .id_1(1), .id_2(id_0), .id_3(1), .id_4(1), .id_5(id_2), .id_6(1)
  );
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_1,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_2,
      id_2,
      id_0
  );
  assign modCall_1.id_6 = 0;
  assign id_2 = 1;
endmodule
