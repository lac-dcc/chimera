// Seed: 1419760447
module module_0 (
    input wire id_0,
    input tri0 id_1,
    input tri id_2,
    input wand id_3,
    input supply0 id_4,
    output tri1 id_5,
    input tri id_6,
    output wor id_7,
    input uwire id_8,
    output wand id_9,
    output tri0 id_10,
    output uwire id_11,
    input tri0 id_12,
    input wor id_13,
    input tri0 id_14,
    output uwire id_15,
    output tri1 id_16,
    input supply0 id_17,
    output supply0 id_18,
    output tri1 id_19
);
  wire id_21, id_22;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    output tri id_1,
    input supply0 id_2,
    output tri0 id_3,
    output wor id_4,
    input uwire id_5,
    output wor id_6
);
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_2,
      id_5,
      id_0,
      id_5,
      id_1,
      id_2,
      id_4,
      id_3,
      id_4,
      id_2,
      id_2,
      id_2,
      id_6,
      id_1,
      id_5,
      id_3,
      id_6
  );
  assign id_0 = (1'b0);
  supply1 id_8;
  assign id_3 = (~id_5);
  assign id_3 = id_8 == 1'b0;
  id_9(
      .id_0(1), .id_1(1'b0 || id_1), .id_2(1)
  );
  wire id_10;
endmodule
