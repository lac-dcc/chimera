// Seed: 1523708095
module module_0 (
    output tri1 id_0,
    input tri1 id_1,
    input wire id_2,
    output wand id_3,
    input tri1 id_4,
    input wire id_5,
    output wor id_6,
    input supply0 id_7
);
  tri0 id_9, id_10;
  assign id_6 = 1;
  localparam integer id_11 = -1'b0;
  assign id_6 = -1;
endmodule
module module_1 #(
    parameter id_10 = 32'd53,
    parameter id_11 = 32'd60,
    parameter id_12 = 32'd52
) (
    input supply0 id_0,
    input tri1 id_1,
    output uwire id_2,
    input tri1 id_3,
    output wor id_4,
    input tri id_5,
    input uwire id_6,
    output wand id_7
);
  uwire id_9;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_2,
      id_5,
      id_3,
      id_7,
      id_1
  );
  assign modCall_1.id_10 = 0;
  assign id_7#(.id_3({-1{id_6 - id_3}})) = 1 == id_9;
  defparam id_10 = -1'b0 + 1, id_11 = id_10, id_12 = -1 < id_5;
  wire id_13;
  buf primCall (id_2, id_5);
endmodule
