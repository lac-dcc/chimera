// Seed: 1134551157
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_8;
endmodule
module module_1 #(
    parameter id_5 = 32'd50
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6
);
  output wire id_6;
  input wire _id_5;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_3,
      id_1,
      id_2,
      id_3
  );
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  logic [(  1  ) : 1 'b0 +  1 'h0] id_7[id_5] = id_3;
  logic [7:0] id_8;
  ;
  nor primCall (id_1, id_3, id_4);
  assign id_8[id_5] = 1 & id_5;
  parameter id_9 = 1, id_10 = id_3, id_11 = 1'b0, id_12 = id_11, id_13 = -1;
endmodule
