// Seed: 3472722098
module module_0 (
    output tri0 id_0,
    input  tri  id_1,
    output tri1 id_2
    , id_7,
    output tri1 id_3,
    output tri0 id_4,
    input  wand id_5
);
  assign id_7 = id_1 != id_5;
endmodule
module module_1 (
    output supply1 id_0,
    output uwire id_1,
    input supply1 id_2,
    input wand id_3
);
  logic [-1 : 1 'b0 &&  1 'b0] id_5;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_0,
      id_0,
      id_0,
      id_3
  );
  assign modCall_1.id_4 = 0;
endmodule
module module_2 #(
    parameter id_2 = 32'd45,
    parameter id_9 = 32'd46
) (
    input supply1 id_0,
    input tri id_1,
    input supply1 _id_2
    , id_12,
    output tri id_3,
    output logic id_4,
    output uwire id_5,
    input wand id_6
    , id_13,
    input tri0 id_7,
    output tri0 id_8
    , id_14,
    input supply0 _id_9,
    output wor id_10
);
  parameter id_15 = 1;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_5,
      id_3,
      id_10,
      id_7
  );
  wire [id_9 : id_2] id_16;
  always @(posedge 1 or id_12) id_4 = -1;
endmodule
