// Seed: 3286643345
module module_0 #(
    parameter id_16 = 32'd95
) (
    output wor id_0,
    input supply1 id_1,
    input tri0 id_2,
    input wor id_3,
    input tri0 id_4,
    input wire id_5,
    input wire id_6,
    output supply1 id_7,
    input wand id_8,
    input wor id_9,
    output wor id_10
    , id_15,
    output uwire id_11,
    output supply1 id_12,
    input tri1 id_13
);
  logic _id_16 = 'b0;
  wire [id_16 : -1] id_17;
  wire id_18, id_19, id_20;
endmodule
module module_1 #(
    parameter id_0 = 32'd26,
    parameter id_6 = 32'd40
) (
    input  wand  _id_0,
    input  tri   id_1,
    input  uwire id_2,
    output wor   id_3,
    output uwire id_4,
    input  wor   id_5,
    input  wire  _id_6[1 : -1]
);
  logic id_8;
  timeunit 1ps;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2,
      id_5,
      id_4,
      id_2,
      id_2,
      id_4,
      id_4,
      id_3,
      id_2
  );
  assign modCall_1.id_11 = 0;
  assign id_4 = 1;
  wire [(  id_0  ) : id_6] id_9;
endmodule
