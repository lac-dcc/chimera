// Seed: 3195694594
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(1 or posedge id_4) begin : LABEL_0
    wait (1'b0);
  end
endmodule
module module_1 #(
    parameter id_7 = 32'd27
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9
);
  inout wire id_9;
  input wire id_8;
  inout wire _id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_9,
      id_6,
      id_6,
      id_1,
      id_8
  );
  logic [-1 : 1] id_10["" ==  id_7 : id_7];
  assign id_4 = id_6;
  wire id_11;
  ;
endmodule
