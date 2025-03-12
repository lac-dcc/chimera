// Seed: 378642247
module module_0 #(
    parameter id_7 = 32'd32
) (
    output wand id_0,
    input uwire id_1,
    output tri1 id_2,
    output tri1 id_3,
    input supply0 id_4,
    output uwire id_5
);
  wire  _id_7;
  logic id_8;
  int   id_9;
  ;
  assign module_1.id_2 = 0;
  wire [-1  &  -1  ?  1 'b0 : -1 'b0 : id_7] id_10;
  assign id_5 = 1'd0 ? id_9 : id_4;
endmodule
module module_1 #(
    parameter id_1 = 32'd95
) (
    output tri id_0,
    input tri0 _id_1,
    input supply1 id_2,
    output tri id_3[1 : id_1],
    input uwire id_4
);
  module_0 modCall_1 (
      id_3,
      id_4,
      id_0,
      id_3,
      id_4,
      id_0
  );
endmodule
