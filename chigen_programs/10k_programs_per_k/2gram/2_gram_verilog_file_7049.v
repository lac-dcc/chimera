// Seed: 609016
module module_0 #(
    parameter id_4 = 32'd75,
    parameter id_5 = 32'd50,
    parameter id_8 = 32'd81
) (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output reg id_2;
  output wire id_1;
  parameter id_4 = 1;
  integer _id_5;
  ;
  defparam id_4.id_4 = 1;
  assign id_2 = 1;
  parameter id_6 = -1;
  reg  id_7;
  wire _id_8;
  ;
  always begin : LABEL_0
    if (id_6 < -1) id_2 = id_6;
    id_7 = (id_6[1 : {1}]);
  end
  localparam id_9 = (id_6);
  assign id_8 = id_5;
  assign id_2 = -1;
  logic [1  ==  id_8 : id_5] id_10;
endmodule
module module_1 #(
    parameter id_10 = 32'd21,
    parameter id_9  = 32'd42
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9
);
  inout wire _id_9;
  input wire id_8;
  inout tri1 id_7;
  inout wire id_6;
  output reg id_5;
  output logic [7:0] id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6
  );
  assign modCall_1.id_4 = 0;
  assign id_7 = 1;
  wire _id_10;
  always begin : LABEL_0
    id_4[id_10 : id_9] = id_10;
  end
  and primCall (id_6, id_7, id_1, id_2, id_8);
  wire id_11;
  ;
  wire id_12;
  final begin : LABEL_1
    id_5 <= id_10;
  end
endmodule
