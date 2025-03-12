// Seed: 572247620
module module_0 #(
    parameter id_13 = 32'd61
) (
    output supply1 id_0,
    output tri1 id_1,
    input tri id_2,
    output tri1 id_3,
    input wor id_4,
    input wand id_5,
    output tri0 id_6,
    input wor id_7,
    input uwire id_8,
    output wor id_9
);
  parameter id_11 = 1'h0, id_12 = -1;
  wire  _id_13;
  logic id_14  [id_13 : -  (  1  )];
endmodule
module module_1 (
    input supply1 id_0,
    output supply0 id_1,
    input tri1 id_2,
    input supply0 id_3,
    input supply0 id_4,
    output uwire id_5,
    output tri id_6,
    input wor id_7,
    input supply1 id_8,
    output tri1 id_9,
    input uwire id_10,
    input supply1 id_11
);
  assign id_1 = id_8;
  wire id_13;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_8,
      id_5,
      id_11,
      id_8,
      id_9,
      id_10,
      id_10,
      id_5
  );
  assign modCall_1.id_5 = 0;
endmodule
