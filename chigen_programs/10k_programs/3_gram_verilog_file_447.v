// Seed: 2557930018
module module_0 #(
    parameter id_7 = 32'd15,
    parameter id_8 = 32'd52
) (
    output tri0  id_0,
    input  wor   id_1,
    output uwire id_2,
    input  wor   id_3,
    input  uwire id_4
);
  wire id_6;
  defparam id_7.id_8 = id_8;
endmodule
module module_1 (
    output wire  id_0,
    input  uwire id_1,
    input  uwire id_2,
    input  tri0  id_3,
    output tri1  id_4,
    input  tri0  id_5,
    input  uwire id_6,
    input  wire  id_7,
    input  uwire id_8
);
  wire id_10;
  and (id_4, id_8, id_5, id_1, id_3, id_7, id_10, id_6, id_2);
  module_0(
      id_0, id_5, id_4, id_8, id_8
  );
endmodule
