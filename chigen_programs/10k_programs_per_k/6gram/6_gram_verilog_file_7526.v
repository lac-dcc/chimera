// Seed: 1951130750
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(posedge -1, posedge 1'd0) begin : LABEL_0
    if (1) $signed(62);
    ;
  end
endmodule
module module_1 #(
    parameter id_3 = 32'd90,
    parameter id_5 = 32'd92
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  module_0 modCall_1 (
      id_2,
      id_9,
      id_7,
      id_7,
      id_8,
      id_4,
      id_7
  );
  input wire id_7;
  output wire id_6;
  inout wire _id_5;
  inout wire id_4;
  inout wire _id_3;
  input wire id_2;
  output logic [7:0] id_1;
  logic [id_3 : id_5] id_11 = -1 == 1;
  assign id_1 = id_9;
  wire id_12;
  initial begin : LABEL_0
    id_11 = (-1'b0 && -1);
    id_1[1] <= id_2;
  end
endmodule
