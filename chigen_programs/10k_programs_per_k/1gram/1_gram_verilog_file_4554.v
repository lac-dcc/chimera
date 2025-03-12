// Seed: 3149915917
program module_0;
  wire id_1, id_2, id_3, id_4;
  assign module_2.id_1 = 0;
endprogram
module module_1 #(
    parameter id_2 = 32'd16
) (
    inout  tri   id_0,
    input  tri   id_1,
    output tri1  _id_2,
    output uwire id_3,
    output tri   id_4,
    output tri   id_5,
    input  wire  id_6
);
  struct packed {
    logic id_8[-1 : ~  id_2];
    union packed {id_9 id_10;} id_11;
    logic id_12;
  } id_13;
  ;
  module_0 modCall_1 ();
endmodule
module module_2;
  logic id_1, id_2[-1 : ~|  1] = {id_2, id_1 != 1};
  logic ['b0 : -1] id_3;
  module_0 modCall_1 ();
endmodule
