// Seed: 3419477600
module module_0 (
    output supply1 id_0,
    input tri id_1,
    output supply1 id_2,
    input tri id_3,
    input supply0 id_4,
    input wire id_5,
    input tri0 id_6,
    input wor id_7,
    input tri1 id_8,
    input uwire id_9,
    input wand id_10,
    input tri1 id_11
);
  tri1 id_13;
  id_14(
      .id_0(id_4), .id_1(id_8), .id_2(id_13), .id_3(1), .id_4(~1'b0), .id_5(id_8), .id_6(id_2)
  );
  wire  id_15;
  uwire id_16 = 1;
  wire  id_17;
  wand  id_18 = id_6 >> 1;
  wire  id_19;
  assign id_13 = id_11;
endmodule
module module_1 (
    input supply1 id_0,
    input wire id_1,
    input wand id_2,
    output supply1 id_3,
    input supply0 id_4,
    output supply1 id_5,
    input wire id_6,
    output tri id_7,
    input tri id_8,
    input supply1 id_9
);
  assign id_3 = 1;
  wire id_11;
  module_0(
      id_3, id_2, id_7, id_9, id_9, id_1, id_8, id_8, id_0, id_6, id_1, id_8
  );
endmodule
