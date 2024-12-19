// Seed: 4203669385
module module_0 #(
    parameter id_8 = 32'd67,
    parameter id_9 = 32'd29
) (
    input wor id_0,
    output supply1 id_1,
    input tri1 id_2,
    output wor id_3
);
  wire id_5;
  wire id_6;
  supply0 id_7;
  defparam id_8.id_9 = 1;
  assign id_7 = id_2;
  wire id_10;
  wire id_11;
endmodule
module module_1 (
    output uwire id_0,
    input  tri   id_1,
    input  wand  id_2,
    output wire  id_3
);
  wire id_5;
  assign id_3 = 1;
  id_6(
      .id_0(1), .id_1(id_2), .id_2(id_0), .id_3(id_0)
  );
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_3
  );
endmodule
