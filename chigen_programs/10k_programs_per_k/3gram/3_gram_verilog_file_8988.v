// Seed: 3896809533
module module_0 #(
    parameter id_17 = 32'd96,
    parameter id_18 = 32'd24
) (
    input uwire id_0,
    input tri0 id_1,
    input tri id_2,
    output supply1 id_3,
    input tri id_4,
    input wor id_5,
    input tri0 id_6
);
  wor  id_8;
  wire id_9;
  tri1 id_10;
  assign id_8  = 1;
  assign id_10 = {1'h0{id_10}};
  wire id_11, id_12, id_13, id_14;
  assign id_13 = id_11;
  wire id_15, id_16;
  defparam id_17.id_18 = id_2 - 1'h0;
endmodule
module module_1 (
    input  uwire id_0,
    output wire  id_1
    , id_6,
    input  tri   id_2,
    output wor   id_3,
    output uwire id_4
);
  assign id_3 = id_2;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_0,
      id_2,
      id_2
  );
  assign modCall_1.id_18 = 0;
endmodule
