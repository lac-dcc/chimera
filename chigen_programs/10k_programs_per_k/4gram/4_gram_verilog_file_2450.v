// Seed: 1397456581
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout logic [7:0] id_3;
  input wire id_2;
  output wire id_1;
  generate
    assign id_3[1] = !id_2 ? id_3 : (-1);
  endgenerate
endmodule
module module_1 #(
    parameter id_5 = 32'd48
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire _id_5;
  output wire id_4;
  input wire id_3;
  inout logic [7:0] id_2;
  inout wire id_1;
  assign id_2[(-1&1==-1+id_5)] = id_5;
  assign id_6 = ~-1;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_2
  );
endmodule
