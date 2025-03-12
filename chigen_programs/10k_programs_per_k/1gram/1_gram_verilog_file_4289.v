// Seed: 87382572
module module_0 #(
    parameter id_5 = 32'd70
) (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_4, _id_5;
  logic id_6;
  parameter id_7 = -1;
  wire  id_8;
  logic id_9 = id_4;
  bit [-1 'b0 : id_5] id_10, id_11, id_12, id_13, id_14, id_15;
  logic id_16;
  always
    if (1) begin : LABEL_0
      id_15 <= -1;
      id_9 = id_7;
      $unsigned(42);
      ;
      begin : LABEL_1
        id_16 <= 1;
      end
      id_16 = SystemTFIdentifier(id_1) - id_3;
      id_11 = 1'h0;
    end
  logic id_17;
  ;
endmodule
module module_1 #(
    parameter id_4 = 32'd47
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  inout wire _id_4;
  output wire id_3;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1
  );
  output wire id_2;
  inout wire id_1;
  wire [id_4 : 1 'b0] id_5, id_6, id_7;
endmodule
