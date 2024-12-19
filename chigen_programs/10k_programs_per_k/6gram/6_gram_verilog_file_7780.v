// Seed: 2283662505
module module_0 (
    input supply1 id_0,
    output wand id_1,
    input wor id_2,
    input wor id_3,
    input uwire id_4,
    output supply1 id_5,
    input wor id_6,
    input tri id_7,
    output supply1 id_8,
    output tri id_9,
    output tri1 id_10
);
  wire id_12;
  assign id_1 = 1'b0 ? id_6 : id_7;
  tri0 id_13 = id_7;
  wand id_14 = 1 == 1;
  wire id_15;
  id_16(
      .id_0(id_13), .id_1(id_3 == id_6), .id_2(1 - id_2), .id_3(~id_13), .id_4(1)
  );
endmodule
module module_1 (
    output tri1 id_0,
    input wire id_1,
    output wire id_2,
    input supply1 id_3,
    output tri1 id_4,
    input supply1 id_5,
    output uwire id_6,
    input wire id_7,
    input tri id_8,
    input supply1 id_9,
    output supply0 id_10,
    input supply0 id_11,
    output supply0 id_12,
    inout tri1 id_13,
    output supply1 id_14,
    output uwire id_15
);
  always @* id_13 = id_1;
  module_0 modCall_1 (
      id_9,
      id_10,
      id_5,
      id_5,
      id_1,
      id_2,
      id_11,
      id_5,
      id_14,
      id_15,
      id_12
  );
  assign modCall_1.id_8 = 0;
endmodule
