// Seed: 2493108789
module module_0 (
    input wand id_0,
    input supply0 id_1,
    input uwire id_2,
    input supply0 id_3,
    output wire id_4,
    output tri0 id_5,
    output tri1 id_6
);
  assign id_4 = -1;
  wire  id_8;
  wire  id_9;
  logic id_10;
  parameter id_11 = 1;
  integer id_12;
  ;
  assign id_6 = -1;
endmodule
module module_1 #(
    parameter id_0 = 32'd90
) (
    input wire _id_0,
    output tri id_1,
    output tri1 id_2,
    input tri id_3,
    input supply1 id_4,
    input tri id_5,
    output uwire id_6,
    output tri1 id_7,
    input uwire id_8
);
  wire [1 : id_0] id_10;
  module_0 modCall_1 (
      id_3,
      id_8,
      id_4,
      id_8,
      id_6,
      id_6,
      id_6
  );
  assign modCall_1.id_4 = 0;
  wire id_11;
endmodule
