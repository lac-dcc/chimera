// Seed: 164334900
module module_0 (
    input  uwire id_0,
    input  wand  id_1,
    output tri0  id_2,
    output wire  id_3,
    input  tri   id_4,
    input  wor   id_5,
    output tri1  id_6
);
  assign id_2 = $clog2(42);
  ;
  assign id_6 = id_0;
endmodule
module module_1 #(
    parameter id_0 = 32'd25,
    parameter id_3 = 32'd84
) (
    input  wor   _id_0,
    output uwire id_1,
    input  wand  id_2,
    input  tri1  _id_3,
    input  tri0  id_4
);
  logic [7:0][-1 : id_3] id_6;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_1,
      id_1,
      id_4,
      id_2,
      id_1
  );
  assign modCall_1.id_1 = 0;
  initial begin : LABEL_0
    id_6[id_0+:id_0] = -1 & 1;
    wait (id_6);
  end
endmodule
