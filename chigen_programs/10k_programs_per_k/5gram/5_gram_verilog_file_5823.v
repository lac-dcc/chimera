// Seed: 621035713
module module_0 (
    output supply0 id_0,
    output tri id_1,
    output supply1 id_2,
    input tri id_3,
    output supply1 id_4,
    input uwire id_5,
    input uwire id_6,
    input supply0 id_7,
    output wor id_8,
    input wand id_9,
    output supply1 id_10,
    input uwire id_11,
    input wor id_12,
    output wire id_13,
    output uwire id_14,
    input supply0 id_15,
    input wand id_16,
    input tri0 id_17,
    input tri0 id_18,
    input supply0 id_19
);
  wire id_21;
  wor id_22, id_23, id_24, id_25, id_26, id_27, id_28, id_29, id_30, id_31, id_32, id_33;
  wire id_34;
  id_35(
      .id_0(id_32), .id_1(1'b0), .id_2(1)
  );
  wire id_36;
  wire id_37;
  assign id_4 = id_3;
endmodule
module module_1 (
    input tri1 id_0,
    input tri1 id_1,
    output supply1 id_2,
    output uwire id_3,
    input tri0 id_4,
    input tri id_5
);
  wire id_7;
  assign id_3 = id_5;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_0,
      id_3,
      id_0,
      id_1,
      id_1,
      id_2,
      id_5,
      id_3,
      id_4,
      id_4,
      id_2,
      id_2,
      id_1,
      id_1,
      id_5,
      id_1,
      id_0
  );
  wire id_8;
  wire id_9;
endmodule
