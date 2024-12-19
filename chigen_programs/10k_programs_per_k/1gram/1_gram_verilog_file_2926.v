// Seed: 2233087348
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_9;
  assign module_1.type_10 = 0;
  initial #1 id_7 = id_5 == 1;
endmodule
module module_1 (
    input logic id_0,
    input tri1  id_1,
    input wor   id_2,
    input tri   id_3
);
  reg id_5 = 1;
  always id_5 <= id_0;
  wire id_6;
  reg  id_7;
  wire id_8;
  initial
    if (1) begin : LABEL_0
      @(posedge id_5);
      id_7 <= 1;
    end
  module_0 modCall_1 (
      id_8,
      id_6,
      id_6,
      id_6,
      id_8,
      id_6,
      id_6,
      id_6
  );
  initial begin : LABEL_0
    id_5 = 1;
  end
endmodule
