// Seed: 4142046435
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
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_11;
  assign id_4 = id_10;
  logic id_12;
  ;
  logic id_13;
  ;
  always @(posedge -1 or negedge -1) begin : LABEL_0
    fork
      repeat (-1) begin : LABEL_1
        $unsigned(89);
        ;
      end
    join
  end
endmodule
module module_1 (
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
    id_12
);
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  module_0 modCall_1 (
      id_11,
      id_4,
      id_4,
      id_5,
      id_12,
      id_5,
      id_5,
      id_7,
      id_12,
      id_7
  );
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output logic [7:0] id_1;
  assign id_1[-1'b0] = -1;
endmodule
