// Seed: 67629701
module module_0 (
    output tri id_0,
    output tri1 id_1,
    input supply0 id_2,
    input tri0 id_3,
    input supply1 id_4,
    input uwire id_5,
    output tri1 id_6,
    input supply1 id_7,
    input supply1 id_8,
    input tri1 id_9,
    output wor id_10,
    input tri id_11,
    input tri1 id_12,
    output tri1 id_13,
    input supply0 id_14,
    input tri1 id_15
);
  wire id_17;
  wire id_18;
  assign id_0 = 1;
  supply0 id_19, id_20, id_21, id_22, id_23, id_24, id_25;
  wor id_26 = id_21;
  id_27(
      .id_0(~id_25 + 1), .id_1(({!id_10 > 1, 1})), .id_2(id_10)
  );
  wire id_28;
  id_29(
      .id_0(id_5), .id_1("")
  );
  wor id_30;
  assign id_30 = id_23;
endmodule
module module_1 (
    input tri id_0,
    output wand id_1,
    inout tri0 id_2,
    input tri0 id_3,
    input wire id_4,
    output supply0 id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_4,
      id_2,
      id_3,
      id_0,
      id_1,
      id_0,
      id_2,
      id_4,
      id_2,
      id_2,
      id_4,
      id_2,
      id_2,
      id_2
  );
endmodule
