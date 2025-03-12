// Seed: 1732614326
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
  output wire id_4;
  inout wire id_3;
  inout reg id_2;
  inout wire id_1;
  always_ff begin : LABEL_0
    id_2 <= 1;
  end
  wire id_8;
  assign id_5 = id_7;
  wire id_9;
  ;
endmodule
module module_1 #(
    parameter id_1 = 32'd57,
    parameter id_6 = 32'd19
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output tri id_5;
  inout reg id_4;
  output logic [7:0] id_3;
  input logic [7:0] id_2;
  input wire _id_1;
  wire _id_6[-1 : id_1];
  assign id_3[-1] = 1;
  always @(posedge id_6 or posedge 1'h0) begin : LABEL_0
    id_4 <= 1'b0;
  end
  wire id_7 = id_1;
  module_0 modCall_1 (
      id_7,
      id_4,
      id_7,
      id_5,
      id_5,
      id_7,
      id_7
  );
  logic [id_6 : 1] id_8;
  ;
  assign id_5 = 1;
endmodule
