// Seed: 2048460504
module module_0 (
    input uwire id_0,
    output tri0 id_1,
    output wand id_2,
    input wire id_3,
    input supply1 id_4,
    input tri id_5,
    output supply0 id_6,
    input wand id_7,
    input tri id_8
    , id_17,
    output tri id_9,
    output wor id_10,
    output uwire id_11,
    input tri0 id_12,
    input uwire id_13,
    input wire id_14,
    output tri id_15
);
  logic id_18;
  wire id_19;
  wire [1 : 1] id_20;
endmodule
module module_1 #(
    parameter id_4 = 32'd62,
    parameter id_7 = 32'd68,
    parameter id_9 = 32'd95
) (
    input supply1 id_0,
    input tri1 id_1,
    output supply0 id_2,
    output supply0 id_3,
    input tri _id_4,
    input wor id_5,
    input uwire id_6,
    input tri _id_7,
    output tri id_8,
    input tri0 _id_9
    , id_11
);
  always_ff @(posedge id_4 * id_9) $unsigned(6);
  ;
  parameter time id_12 = "";
  logic [7:0][id_9 : id_7  &  id_4] id_13;
  or primCall (id_3, id_12, id_11, id_6, id_0, id_5, id_1);
  wire id_14;
  parameter id_15 = 1;
  assign (pull1, strong0) id_2 = id_6;
  wire id_16;
  wire id_17;
  module_0 modCall_1 (
      id_6,
      id_8,
      id_3,
      id_5,
      id_6,
      id_6,
      id_3,
      id_6,
      id_1,
      id_3,
      id_2,
      id_8,
      id_1,
      id_1,
      id_0,
      id_3
  );
  assign modCall_1.id_14 = 0;
  assign id_13[-1] = id_11;
endmodule
