// Seed: 3783560047
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output reg id_2;
  output wire id_1;
  initial begin : LABEL_0
    id_2 <= 1'b0;
  end
  wire id_5;
  wire id_6;
endmodule
module module_1 #(
    parameter id_4 = 32'd29
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  inout wire _id_4;
  output logic [7:0] id_3;
  inout wire id_2;
  input wire id_1;
  logic id_5;
  ;
  assign id_3[id_4] = id_4;
  id_6 :
  assert property (@(1) -1)
  else begin : LABEL_0
    id_5 <= id_6;
  end
  parameter id_7 = 1;
  always_comb @(*) id_5 = id_4;
  logic id_8 [1 : -1];
  wire  id_9;
  module_0 modCall_1 (
      id_9,
      id_5,
      id_7,
      id_2
  );
  wire id_10;
endmodule
