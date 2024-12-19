// Seed: 3123783996
module module_0 (
    input tri1 id_0,
    output supply0 id_1,
    input supply1 id_2,
    input tri0 id_3,
    input tri0 id_4,
    output supply0 id_5,
    input tri id_6,
    input supply0 id_7,
    input wor id_8,
    output wire id_9,
    input tri0 id_10,
    input tri1 id_11,
    output supply1 id_12
);
  assign module_1.type_19 = 0;
endmodule
module module_1 #(
    parameter id_11 = 32'd57,
    parameter id_12 = 32'd32
) (
    input  uwire id_0,
    input  tri   id_1,
    output wor   id_2,
    input  wire  id_3,
    input  tri   id_4
);
  tri1 id_6;
  assign id_6 = 1;
  supply0 id_7;
  wire id_8;
  id_9(
      .id_0(1), .id_1(id_2 && 1 - id_7 * 1), .id_2(1), .id_3(id_2)
  );
  supply1 id_10;
  defparam id_11.id_12 = 1;
  assign id_10 = 1;
  always @(posedge 1);
  module_0 modCall_1 (
      id_4,
      id_2,
      id_3,
      id_4,
      id_1,
      id_2,
      id_4,
      id_0,
      id_1,
      id_2,
      id_0,
      id_1,
      id_2
  );
endmodule
