// Seed: 2356501316
module module_0 (
    output supply1 id_0,
    input tri1 id_1,
    input tri1 id_2,
    input wor id_3,
    input tri1 id_4,
    input tri0 id_5,
    input uwire id_6,
    input supply0 id_7,
    input supply1 id_8,
    output supply0 id_9,
    input tri0 id_10,
    output tri id_11,
    output tri1 id_12,
    input supply1 id_13
);
  always_latch @(posedge "") id_11 = 1;
  assign id_9 = id_7;
  assign id_0 = id_5;
  wire id_15;
endmodule
module module_1 (
    input  wire  id_0,
    input  tri1  id_1,
    input  uwire id_2,
    output tri1  id_3
);
  id_5(
      .id_0(id_2), .id_1(id_1), .id_2(id_3), .id_3(id_0)
  );
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_3,
      id_2,
      id_3,
      id_3,
      id_0
  );
  assign modCall_1.type_0 = 0;
endmodule
