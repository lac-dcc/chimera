// Seed: 2778439221
module module_0;
endmodule
module module_1 #(
    parameter id_3 = 32'd99,
    parameter id_4 = 32'd62
) (
    id_1,
    id_2,
    _id_3,
    _id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  inout logic [7:0] id_5;
  output wire _id_4;
  inout wire _id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 ();
  assign id_2 = id_5[-1 :-1];
  wire id_8[id_4 : id_3];
  ;
endmodule
module module_2 #(
    parameter id_3 = 32'd53
) (
    id_1,
    id_2,
    _id_3,
    id_4
);
  input wire id_4;
  inout wire _id_3;
  input wire id_2;
  module_0 modCall_1 ();
  output logic [7:0] id_1;
  assign id_1 = id_2;
  assign id_1[id_3] = -1;
  wire id_5;
  wire id_6, id_7;
endmodule
