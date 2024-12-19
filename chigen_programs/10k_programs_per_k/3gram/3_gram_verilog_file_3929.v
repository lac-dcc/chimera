// Seed: 75740577
module module_0 #(
    parameter id_7 = 32'd82,
    parameter id_8 = 32'd44
) (
    input uwire id_0,
    output supply1 id_1,
    output wire id_2,
    output tri0 id_3,
    output tri1 id_4
);
  tri  id_6;
  defparam id_7.id_8 = id_6 && 1;
  wire id_9;
  wire id_10;
  wire id_11;
  assign module_1.type_4 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    input  wand  id_1,
    output wand  id_2
);
  always @(1) {|id_0, id_1} = id_1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_2,
      id_2
  );
endmodule
