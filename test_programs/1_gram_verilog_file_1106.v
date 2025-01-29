// Seed: 2162211394
module module_0 #(
    parameter id_12 = 32'd37
) (
    input supply1 id_0,
    input tri1 id_1,
    output wor id_2,
    input wor id_3,
    input wire id_4,
    input tri0 id_5,
    input tri0 id_6,
    input wand id_7
);
  id_9(
      (id_7)
  );
  tri1 id_10 = 1;
  localparam id_11 = id_3 % -1;
  defparam id_12 = id_12;
  wire id_13;
endmodule
module module_1 (
    output tri0 id_0,
    input  tri  id_1,
    input  wire id_2
);
  assign id_0 = &{1'b0{id_2}};
  uwire id_4 = id_2, id_5 = id_5;
  assign id_4 = id_4;
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_0,
      id_1,
      id_2,
      id_4,
      id_5,
      id_5
  );
  assign modCall_1.type_9 = 0;
endmodule
