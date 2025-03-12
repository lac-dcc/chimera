// Seed: 168242072
module module_0 (
    id_1,
    id_2
);
  output wand id_2;
  input wire id_1;
  assign id_2 = 1;
  wire id_3;
  parameter id_4 = 1;
  final $unsigned(61);
  ;
endmodule
module module_1;
  parameter id_1 = -1;
  wire id_2;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2
  );
endmodule
module module_2 #(
    parameter id_3 = 32'd18
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  module_0 modCall_1 (
      id_1,
      id_7
  );
  inout logic [7:0] id_6;
  output wire id_5;
  and primCall (id_7, id_2, id_6, id_1, id_8);
  output wire id_4;
  input wire _id_3;
  inout logic [7:0] id_2;
  inout wire id_1;
  assign id_2[id_3] = 1;
  assign id_4 = id_6[-1];
endmodule
