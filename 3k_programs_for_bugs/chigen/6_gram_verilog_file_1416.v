// Seed: 1452573639
module module_0 (
    input wor id_0,
    input supply1 id_1,
    output tri0 id_2,
    input tri id_3,
    output supply1 id_4,
    input uwire id_5,
    output tri0 id_6,
    input wand id_7,
    output tri0 id_8,
    output wire id_9
);
  uwire id_11;
  integer id_12 (
      .id_0(1),
      .id_1(1),
      .id_2(1),
      .id_3(1),
      .id_4(id_11 - id_1),
      .id_5(id_4)
  );
  assign id_4 = id_0;
  wire id_13;
  id_14(
      .id_0(1)
  );
endmodule
module module_1 #(
    parameter id_5 = 32'd15
) (
    input supply1 id_0,
    input wire id_1,
    input wor id_2,
    input tri0 id_3,
    input tri1 id_4,
    input tri _id_5
);
  assign id_7 = id_1;
  module_0(
      id_2, id_0, id_7, id_1, id_7, id_3, id_7, id_4, id_7, id_7
  );
  always @(1 or posedge 1 == (id_1)) force id_7[1'd0 : id_5] = 1'h0;
endmodule
