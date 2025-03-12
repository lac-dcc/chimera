// Seed: 1051973173
module module_0;
  uwire id_1 = -1;
endmodule
module module_1 #(
    parameter id_3 = 32'd39,
    parameter id_5 = 32'd2
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  inout logic [7:0] id_8;
  output wire id_7;
  output wire id_6;
  input wire _id_5;
  output logic [7:0] id_4;
  inout wire _id_3;
  input wire id_2;
  inout wire id_1;
  assign id_4[id_3] = id_8[id_3];
  assign id_4[id_5] = id_2((id_2 != 1));
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
