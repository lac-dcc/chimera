// Seed: 529668000
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  logic id_8;
  ;
endmodule
module module_1 #(
    parameter id_9 = 32'd48
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  input wire _id_9;
  output logic [7:0] id_8;
  input wire id_7;
  module_0 modCall_1 (
      id_13,
      id_11,
      id_13,
      id_12,
      id_13,
      id_13,
      id_13
  );
  output wire id_6;
  output reg id_5;
  output reg id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  always @* begin : LABEL_0
    if (-1) begin : LABEL_1
      id_5 <= id_7;
      id_4 <= id_7;
      if (1) begin : LABEL_2
        id_8[id_9-1] <= id_2;
      end else begin : LABEL_3
        disable id_14;
      end
    end else assert (id_1);
  end
endmodule
