// Seed: 3835667297
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  assign id_2 = id_1;
endmodule
module module_1 #(
    parameter id_3 = 32'd72,
    parameter id_5 = 32'd21
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    _id_5,
    id_6,
    id_7
);
  inout wire id_7;
  module_0 modCall_1 (
      id_7,
      id_6
  );
  output wire id_6;
  inout wire _id_5;
  input wire id_4;
  input wire _id_3;
  input wire id_2;
  output wire id_1;
  wire [id_3 : id_5] id_8;
  xnor primCall (id_6, id_4, id_7, id_2);
endmodule
