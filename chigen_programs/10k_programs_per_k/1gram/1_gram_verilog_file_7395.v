// Seed: 201970502
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    output wor id_2,
    output wand id_3,
    input uwire id_4
);
  generate
    assign id_1 = -1;
    assign id_1 = id_4;
  endgenerate
  wire id_6;
  wire id_7, id_8;
  supply0 id_9 = -1, id_10;
endmodule
module module_1 #(
    parameter id_5 = 32'd53
) (
    input  uwire id_0,
    output logic id_1,
    input  wor   id_2,
    output tri0  id_3
);
  always_ff id_1 <= id_2;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_3,
      id_3,
      id_2
  );
  assign modCall_1.id_1 = 0;
  wire _id_5;
  assign id_1 = id_0;
  wire [id_5 : -1] id_6;
endmodule
