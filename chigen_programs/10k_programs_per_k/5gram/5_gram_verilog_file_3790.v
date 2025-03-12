// Seed: 2883934964
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout logic [7:0] id_3;
  output wire id_2;
  inout logic [7:0] id_1;
  assign id_1[1] = id_3[!((1))] ? id_3 : id_5;
  logic id_6;
endmodule
module module_1 #(
    parameter id_4 = 32'd42
) (
    id_1,
    id_2,
    id_3
);
  inout logic [7:0] id_3;
  input wire id_2;
  inout logic [7:0] id_1;
  wire _id_4;
  assign id_1[id_4] = id_3[-1];
  wire id_5;
  ;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_1,
      id_5,
      id_5
  );
endmodule
