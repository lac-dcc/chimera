// Seed: 3473756572
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
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_7 = id_4;
endmodule
module module_1 #(
    parameter id_5 = 32'd12
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output reg id_3;
  output reg id_2;
  output wire id_1;
  assign id_2 = 1;
  initial begin : LABEL_0
    if (1) begin : LABEL_1
      id_3 <= -1'h0 + 1;
    end else begin : LABEL_2
      id_2 = -1;
      id_3 <= id_4;
    end
  end
  parameter id_5 = 1;
  parameter id_6 = -1;
  module_0 modCall_1 (
      id_6,
      id_1,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
  generate
    struct packed {
      logic id_7;
      logic [-1 : id_5] id_8;
    } id_9;
    ;
  endgenerate
endmodule
