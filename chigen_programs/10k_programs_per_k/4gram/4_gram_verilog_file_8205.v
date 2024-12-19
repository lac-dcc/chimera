// Seed: 2183681646
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  always @(*) id_1 = id_7;
endmodule
module module_1 (
    input  logic id_0,
    output logic id_1
);
  always @(negedge id_0)
    if (1) begin : LABEL_0
      id_1 = 1;
    end else begin : LABEL_0
      id_1 <= id_0;
    end
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  always @(*) begin : LABEL_0
    if (1) begin : LABEL_0
      id_1 = 1;
    end
  end
  assign id_1 = id_0;
endmodule
