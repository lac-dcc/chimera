// Seed: 3680554613
module module_0 (
    input wor id_0,
    output tri1 id_1,
    output wand id_2,
    output uwire id_3,
    input tri1 id_4,
    input uwire id_5,
    output supply1 id_6,
    input tri id_7,
    input wor id_8,
    input tri0 id_9,
    output supply1 id_10
);
  wire id_12;
  wire id_13;
  wire id_14;
  wor  id_15 = 1'd0;
  id_16(
      .id_0(id_0),
      .id_1(1'b0),
      .id_2(1),
      .id_3(id_4),
      .id_4(id_7),
      .id_5(1'b0),
      .id_6(id_14),
      .id_7(id_9 == ~id_4)
  );
endmodule
module module_1 (
    input wire id_0,
    input wand id_1,
    output supply0 id_2
);
  wire id_4;
  wire id_5;
  wire id_6;
  wire id_7;
  wire id_8;
  tri0 id_9;
  wire id_10;
  wire id_11;
  wire id_12;
  wor  id_13 = 1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2
  );
  wire id_14;
  assign id_9 = id_13 ^ 1;
endmodule
