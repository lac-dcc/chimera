// Seed: 1950912020
module module_0 (
    id_1,
    id_2
);
  inout logic [7:0] id_2;
  input wire id_1;
  wire id_3;
  assign id_2[1] = 1 ~^ "" & 1;
endmodule
module module_1 #(
    parameter id_6 = 32'd30
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  module_0 modCall_1 (
      id_3,
      id_1
  );
  output wire id_2;
  inout logic [7:0] id_1;
  wire id_5;
  ;
  assign id_1[1] = 1;
  wire _id_6 = id_6;
  wire id_7;
  logic [id_6 : 1] id_8;
  buf primCall (id_3, id_1);
endmodule
