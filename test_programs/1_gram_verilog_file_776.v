// Seed: 979413450
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    output supply0 id_2,
    output supply0 id_3,
    output wor id_4
);
  wire id_6;
  integer id_7 (-1'h0);
  supply0 id_8 = id_1, id_9, id_10;
endmodule
module module_1 (
    input wor id_0,
    output tri1 id_1,
    input uwire id_2,
    output tri id_3,
    output supply0 id_4,
    output logic id_5,
    input tri1 id_6,
    output uwire id_7,
    input wire id_8,
    input tri1 id_9,
    input supply1 id_10,
    input supply1 id_11,
    output supply1 id_12,
    input wire id_13,
    input tri id_14
);
  wire id_16;
  assign id_1 = id_10;
  always id_5 <= -1 - -1'h0;
  wire id_17;
  wire id_18;
  module_0 modCall_1 (
      id_14,
      id_2,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_3 = 0;
  id_19(
      ({id_4, id_9})
  );
  assign id_1 = id_11;
  nand primCall (id_4, id_16, id_11, id_18, id_9, id_0, id_10, id_17, id_6, id_14);
  wire id_20;
  id_21(
      .id_0(id_3), .id_1(id_1), .id_2(id_10), .id_3(-1), .id_4(-1 == 1), .id_5(id_16), .id_6(id_12)
  );
endmodule
