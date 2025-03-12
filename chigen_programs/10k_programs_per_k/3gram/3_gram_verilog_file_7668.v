// Seed: 2739874424
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  final begin : LABEL_0
  end
endmodule
module module_1 #(
    parameter id_6 = 32'd38
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_5,
      id_5,
      id_1,
      id_5
  );
  input wire id_3;
  inout logic [7:0] id_2;
  inout wire id_1;
  supply1 _id_6 = id_6 == id_2[id_6];
endmodule
