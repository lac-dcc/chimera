// Seed: 2436205882
module module_0 (
    output wire id_0,
    input wor id_1,
    input tri0 id_2,
    output wand id_3,
    output wor id_4,
    input tri0 id_5,
    input tri0 id_6,
    input wor id_7,
    input supply0 id_8,
    input wor id_9,
    output wor id_10,
    output supply0 id_11,
    output tri1 id_12,
    output supply1 id_13
);
  assign id_3 = id_2;
  tri0 id_15, id_16, id_17, id_18;
  wire id_19;
  assign id_16 = id_5;
  tri0 id_20 = id_15, id_21;
  wand id_22 = 1;
  integer id_23;
endmodule
module module_1 #(
    parameter id_10 = 32'd43,
    parameter id_11 = 32'd50,
    parameter id_8  = 32'd87
) (
    output tri1 id_0,
    input supply1 id_1,
    output tri0 id_2,
    input uwire id_3,
    input wor id_4,
    output uwire id_5,
    output wor id_6
);
  wor id_8;
  module_0(
      id_2, id_4, id_4, id_0, id_6, id_4, id_1, id_3, id_3, id_3, id_0, id_5, id_5, id_6
  ); id_9(
      .id_0(1 - id_0), .id_1(id_4), .id_2(1), .id_3(1), .id_4(id_0)
  ); defparam id_10#(id_8).id_11 = 1'b0;
endmodule
