// Seed: 410931175
module module_0 (
    output uwire id_0,
    output uwire id_1,
    input supply1 id_2,
    output tri1 id_3,
    output supply0 id_4,
    input uwire id_5,
    input wire id_6,
    input tri0 id_7,
    output supply0 id_8,
    output tri1 id_9,
    input tri id_10,
    input supply0 id_11,
    input tri id_12,
    input wor id_13,
    input tri0 id_14
);
  id_16(
      .id_0(1'b0), .id_1(id_10), .id_2(1), .id_3(1), .id_4(1'b0)
  );
  uwire id_17 = id_10;
  wor   id_18 = 1;
  id_19(
      .id_0(), .id_1("")
  );
  assign id_8 = id_10;
  wire id_20;
endmodule
module module_1 (
    input  uwire id_0,
    input  tri0  id_1,
    input  tri1  id_2,
    output tri1  id_3,
    output wand  id_4
);
  wire id_6;
  module_0(
      id_3, id_4, id_2, id_3, id_4, id_2, id_1, id_0, id_3, id_3, id_1, id_1, id_1, id_1, id_0
  );
endmodule
