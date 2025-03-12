// Seed: 1685187096
module module_0 #(
    parameter id_11 = 32'd72
) (
    output supply1 id_0,
    input wand id_1,
    output tri id_2,
    input tri0 id_3,
    input uwire id_4
    , _id_11,
    input wor id_5,
    output tri1 id_6,
    output tri id_7,
    input wire id_8,
    output supply1 id_9
);
  wire [-1 'b0 : id_11] id_12;
  assign id_2  = id_4 | id_5;
  assign id_6  = 1;
  assign id_12 = id_8#(.id_12(1));
endmodule
module module_1 (
    input uwire id_0,
    output supply1 id_1,
    output wor id_2,
    input tri1 id_3
);
  assign id_1 = 1'h0;
  not primCall (id_2, id_3);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1,
      id_3,
      id_3,
      id_3,
      id_2,
      id_1,
      id_3,
      id_2
  );
  assign modCall_1.id_0 = 0;
endmodule
