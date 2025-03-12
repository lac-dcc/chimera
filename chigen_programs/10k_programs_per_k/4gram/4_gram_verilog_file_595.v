// Seed: 1585480248
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  output wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_12 = id_12;
  wire id_16;
endmodule
module module_0 (
    input  wor   id_0,
    input  wor   module_1,
    output logic id_2,
    output tri   id_3
);
  assign id_3 = id_1;
  localparam id_5 = 1;
  parameter id_6 = 1;
  parameter id_7 = 1;
  module_0 modCall_1 (
      id_5,
      id_7,
      id_5,
      id_5,
      id_7,
      id_5,
      id_6,
      id_6,
      id_5,
      id_7,
      id_7,
      id_5,
      id_5,
      id_5,
      id_5
  );
  always_latch @(posedge id_0) begin : LABEL_0
    if (id_5 & !id_5) begin : LABEL_1
      id_2 = (id_6);
      if ("") begin : LABEL_2
        $unsigned(95);
        ;
      end
    end else id_2 <= -1 - id_1;
  end
endmodule
