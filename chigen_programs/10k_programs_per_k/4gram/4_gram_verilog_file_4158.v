// Seed: 3709908507
module module_0 (
    output tri0 id_0,
    output wire id_1,
    input supply0 id_2,
    input tri1 id_3,
    output wand id_4,
    input tri1 id_5,
    input tri0 id_6,
    input wor id_7,
    output supply0 id_8,
    input wire id_9,
    output wor id_10,
    input supply0 id_11,
    input supply1 id_12,
    input tri id_13
);
  id_15(
      .id_0(id_3), .id_1(""), .id_2(1), .id_3(id_11), .id_4(1), .id_5(1'd0), .id_6(id_0)
  );
endmodule
module module_1 (
    input tri id_0,
    output tri0 id_1,
    input tri1 id_2,
    input uwire id_3,
    output uwire id_4,
    input wire id_5,
    input supply1 id_6,
    input supply1 id_7,
    input tri id_8,
    inout tri0 id_9,
    input tri0 id_10,
    input supply1 id_11,
    input supply0 id_12,
    input supply1 id_13,
    input tri0 id_14
);
  module_0 modCall_1 (
      id_4,
      id_9,
      id_11,
      id_13,
      id_9,
      id_2,
      id_7,
      id_5,
      id_1,
      id_12,
      id_9,
      id_7,
      id_7,
      id_12
  );
  assign modCall_1.id_6 = 0;
  wire id_16;
  assign id_9 = id_13;
endmodule
