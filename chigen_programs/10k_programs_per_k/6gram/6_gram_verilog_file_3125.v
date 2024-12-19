// Seed: 3628690448
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
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_9 = id_5;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input  logic id_0,
    output logic id_1
);
  always @(posedge id_0 or posedge 1) begin : LABEL_0
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
      id_3
  );
endmodule
