// Seed: 252491774
module module_0;
  wire id_1, id_2;
endmodule
module module_1 #(
    parameter id_14 = 32'd22
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    _id_14
);
  input wire _id_14;
  inout wire id_13;
  inout wire id_12;
  inout logic [7:0] id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout reg id_2;
  input wire id_1;
  always @(id_2 ^ 1) begin : LABEL_0
    if (-1) begin : LABEL_1
      id_11[1+:1'h0&(id_14)] = id_14;
    end else begin : LABEL_2
      $unsigned(9);
      ;
    end
  end
  module_0 modCall_1 ();
  always @(id_12) id_2 = -1;
  assign id_2 = ~id_11;
endmodule
