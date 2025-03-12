// Seed: 3101001437
module module_0 (
    output tri0  id_0,
    input  tri1  id_1,
    input  tri   id_2,
    input  uwire id_3,
    input  tri1  id_4,
    input  wand  id_5
);
  assign id_0 = (~id_1 == -1 || id_2) - 1;
  assign module_1._id_2 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd63
) (
    output tri1 id_0,
    input  wand id_1,
    output tri  _id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  logic [-1 : 1] id_5;
  wire id_6[-1 : id_2];
  assign id_0 = |$realtime;
endmodule
