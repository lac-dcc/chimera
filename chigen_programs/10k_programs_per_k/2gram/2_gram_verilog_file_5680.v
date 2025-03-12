// Seed: 2213448591
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output tri0 id_2;
  input wire id_1;
  if (-1'd0) begin : LABEL_0
    wire id_5;
  end else bit id_6;
  assign id_2 = id_6;
  wire id_7;
  ;
  always begin : LABEL_1
    id_6 = id_4;
  end
  assign id_2 = 1;
endmodule
module module_1 #(
    parameter id_7 = 32'd64
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  input wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire _id_7;
  output logic [7:0] id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_4
  );
  output wire id_1;
  final begin : LABEL_0
    id_6[id_7] <= 1;
  end
endmodule
