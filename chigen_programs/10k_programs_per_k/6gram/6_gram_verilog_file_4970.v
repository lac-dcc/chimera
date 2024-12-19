// Seed: 4153229316
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(*) begin : LABEL_0$display
    ;
  end
  always @(posedge 1'b0) begin : LABEL_0
    id_1 <= {1, id_10, id_10, 1, id_10, id_2, 1 == 1, id_8};
  end
  wire id_11;
  wire id_12 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_4,
      id_3,
      id_4
  );
  assign modCall_1.id_9 = 0;
  wire id_5;
  initial id_2 = #1 id_4 + 1 - 1'b0;
endmodule
