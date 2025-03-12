// Seed: 2236615221
module module_0 (
    input wor id_0,
    input supply0 id_1,
    input wor id_2
    , id_14,
    input wand id_3,
    input wor id_4,
    input supply0 id_5,
    input supply0 id_6,
    output supply1 id_7,
    input uwire id_8,
    output wand id_9,
    input tri id_10,
    input wand id_11,
    output tri1 id_12
);
  wire id_15;
  assign id_12 = -1;
endmodule
module module_1 #(
    parameter id_7 = 32'd18
) (
    output tri id_0,
    output logic id_1,
    output supply1 id_2,
    input tri0 id_3,
    output wor id_4,
    output tri1 id_5,
    input uwire id_6,
    input tri _id_7,
    input supply1 id_8
);
  wire [id_7 : 1] id_10;
  wire id_11;
  parameter id_12 = 1'h0;
  always_ff @(posedge 1) id_1 = 1 < id_8;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_3,
      id_8,
      id_8,
      id_8,
      id_6,
      id_4,
      id_8,
      id_4,
      id_8,
      id_6,
      id_4
  );
  assign modCall_1.id_10 = 0;
endmodule
