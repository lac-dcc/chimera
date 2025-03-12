// Seed: 1501185945
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  output logic [7:0] id_1;
  bit id_4 = 1;
  always begin : LABEL_0
    if (1 ? 1 : ~1) id_1[1] = -1;
    else id_4 <= id_2;
  end
endmodule
module module_1 #(
    parameter id_3 = 32'd7,
    parameter id_9 = 32'd92
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6[-1 :-1==1],
    id_7,
    id_8,
    _id_9,
    id_10
);
  output wire id_10;
  input wire _id_9;
  inout wire id_8;
  input wire id_7;
  inout logic [7:0] id_6;
  inout wire id_5;
  output wire id_4;
  inout wire _id_3;
  input wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_6,
      id_7,
      id_5
  );
  assign modCall_1.id_4 = 0;
  wire id_11[id_3 : id_9];
endmodule
