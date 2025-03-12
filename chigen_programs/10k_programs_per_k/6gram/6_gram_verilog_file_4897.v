// Seed: 1254272603
module module_0 #(
    parameter id_4 = 32'd31,
    parameter id_5 = 32'd17
) (
    id_1,
    id_2,
    id_3
);
  output logic [7:0] id_3;
  output wire id_2;
  output wire id_1;
  logic _id_4, _id_5;
  assign id_3[id_5 : id_4] = -1;
  assign id_5 = id_4;
endmodule
module module_1 #(
    parameter id_9 = 32'd38
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
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout logic [7:0] id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_2
  );
  wire id_10;
  ;
  wire [id_9 : -1] id_11;
  assign id_2[1] = 1;
  always @(1) begin : LABEL_0
    disable id_12;
    if (1'b0) $unsigned(21);
    ;
  end
endmodule
