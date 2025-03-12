// Seed: 1940218923
module module_0 (
    input tri1  id_0,
    input wand  id_1,
    input uwire id_2
);
  always_ff @(negedge id_2) begin : LABEL_0
  end
endmodule
module module_1 #(
    parameter id_3 = 32'd90
) (
    output uwire id_0,
    input tri id_1,
    input wor id_2,
    input wor _id_3,
    output uwire id_4,
    input uwire id_5,
    input uwire id_6,
    input wand id_7#(1'd0),
    output wire id_8,
    input wor id_9,
    output supply0 id_10,
    output supply1 id_11,
    output wand id_12
);
  logic ["" : id_3] id_14;
  ;
  module_0 modCall_1 (
      id_7,
      id_5,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule
