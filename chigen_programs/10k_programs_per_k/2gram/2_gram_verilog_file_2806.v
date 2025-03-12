// Seed: 4149149310
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout supply0 id_1;
  tri1 id_10 = -1;
  assign id_1 = -1;
endmodule
module module_1 #(
    parameter id_1 = 32'd97
) (
    _id_1,
    id_2,
    id_3
);
  input wire id_3;
  output logic [7:0] id_2;
  input wire _id_1;
  logic id_4;
  ;
  assign id_4 = id_3;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_1 = 0;
  assign id_2[id_1] = id_4;
endmodule
