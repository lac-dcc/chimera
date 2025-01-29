// Seed: 639073411
module module_0 (
    output tri1 id_0,
    input supply1 id_1,
    output wand id_2,
    id_26,
    input tri id_3,
    input wire id_4,
    input supply1 id_5,
    input supply0 id_6,
    output supply1 id_7,
    input tri id_8,
    output tri0 id_9,
    input uwire id_10,
    input wor id_11,
    output tri1 id_12,
    input tri id_13,
    input uwire id_14,
    input supply0 id_15,
    output wire id_16#(.id_27(-1)),
    input wor id_17,
    input supply1 id_18,
    output wire id_19,
    id_28,
    input wand id_20,
    output tri id_21,
    input supply1 id_22,
    input wor id_23,
    input wire id_24
);
  wire id_29, id_30, id_31, id_32;
  assign module_1.id_1 = 0;
  parameter id_33 = -1;
endmodule
module module_1 (
    input uwire id_0,
    input supply1 id_1,
    output tri1 id_2,
    output wor id_3,
    input wor id_4,
    input wor id_5,
    output wand id_6,
    output supply1 id_7
);
  id_9(
      .id_0(1)
  );
  wire id_10;
  assign id_7 = 1;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_7,
      id_1,
      id_4,
      id_5,
      id_1,
      id_3,
      id_1,
      id_2,
      id_1,
      id_0,
      id_2,
      id_1,
      id_4,
      id_5,
      id_7,
      id_5,
      id_5,
      id_6,
      id_5,
      id_7,
      id_1,
      id_0,
      id_0
  );
  nmos #1  (
      .id_0(-1),
      .id_1(id_3),
      .id_2(id_0),
      .id_3((1 ? id_3 * -1 : 1)),
      .id_4(-1),
      .id_5(1),
      .id_6(1),
      .id_7(id_2),
      .id_8(id_5),
      .id_9({id_2, id_2}),
      .id_10(id_1 - 1'h0)
  );
endmodule
