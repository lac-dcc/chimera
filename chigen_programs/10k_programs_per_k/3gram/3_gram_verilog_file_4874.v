// Seed: 1597359688
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  always @(id_2 or posedge 1) begin : LABEL_0
    logic id_3;
    id_3 <= -1;
  end
  parameter id_4 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd21
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout logic [7:0] id_7;
  input wire id_6;
  output wire id_5;
  module_0 modCall_1 (
      id_3,
      id_2
  );
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire _id_1;
  assign id_7[1+:-1] = id_6;
  wire id_8;
  wire [id_1 : -1] id_9;
endmodule
