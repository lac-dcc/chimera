// Seed: 3515092412
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout logic [7:0] id_1;
  wand id_4;
  assign id_1[-1] = -1;
  wire id_5;
  wire id_6;
  ;
  assign id_4 = -1;
  localparam id_7 = 1;
endmodule
module module_1 #(
    parameter id_6 = 32'd54
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7
);
  output wire id_7;
  inout wire _id_6;
  input wire id_5;
  module_0 modCall_1 (
      id_1,
      id_7,
      id_2
  );
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout logic [7:0] id_1;
  assign id_2 = id_6 ? id_1 : id_1[-1 : id_6];
endmodule
