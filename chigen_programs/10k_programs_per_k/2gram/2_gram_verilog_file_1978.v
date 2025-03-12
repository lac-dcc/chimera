// Seed: 3300629426
module module_0 (
    output uwire id_0,
    output uwire id_1,
    input wor id_2,
    input wor id_3,
    input uwire id_4,
    input uwire id_5,
    output tri id_6,
    output uwire id_7,
    output supply0 id_8,
    input tri id_9,
    input tri id_10,
    input supply1 id_11,
    output wire id_12,
    input wire id_13,
    output tri1 id_14,
    input supply1 id_15,
    input tri1 id_16
    , \id_19 ,
    output wand id_17
);
  assign id_1   = -1;
  assign id_6   = 1 ? id_15 : -1;
  assign \id_19 = 1;
endmodule
module module_1 (
    output tri0 id_0,
    input uwire id_1,
    input wor id_2,
    output tri id_3,
    input wand id_4,
    input supply1 id_5,
    output tri1 id_6
);
  wire id_8;
  nor primCall (id_3, id_2, id_1, id_4, id_5);
  module_0 modCall_1 (
      id_6,
      id_0,
      id_5,
      id_1,
      id_4,
      id_4,
      id_6,
      id_6,
      id_3,
      id_5,
      id_4,
      id_5,
      id_6,
      id_1,
      id_3,
      id_2,
      id_5,
      id_3
  );
  assign modCall_1.id_0 = 0;
endmodule
