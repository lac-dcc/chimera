// Seed: 2942140410
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4[1'b0 :-1],
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input logic [7:0] id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_9;
  ;
  reg id_10;
  always id_10 <= #1 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd0
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5
);
  output reg id_5;
  output wire id_4;
  input wire id_3;
  input wire _id_2;
  inout wire id_1;
  parameter id_6 = -1;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_4,
      id_6,
      id_1,
      id_1,
      id_1,
      id_1
  );
  always begin : LABEL_0
    id_5 <= {1};
    id_5 <= -1 !== id_6[id_2].id_2 * -1;
    #1 id_5 <= 1'b0;
  end
  always $clog2(76);
  ;
  assign #(id_1  : -1  : -1, !id_2) id_5 = -1;
endmodule
