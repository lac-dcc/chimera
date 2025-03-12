// Seed: 1974639434
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output logic [7:0] id_1;
endmodule
module module_1 #(
    parameter id_1 = 32'd59,
    parameter id_2 = 32'd36
) (
    _id_1,
    _id_2,
    id_3["" : id_1],
    id_4[id_2==1 : id_2]
);
  input logic [7:0] id_4;
  inout logic [7:0] id_3;
  output wire _id_2;
  input wire _id_1;
  wire id_5;
  ;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5
  );
  assign id_2 = id_4;
  localparam id_6 = 1;
  assign id_3 = id_6;
  assign id_3 = id_4;
endmodule
