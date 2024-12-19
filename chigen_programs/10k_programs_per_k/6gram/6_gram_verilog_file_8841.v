// Seed: 3964256949
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2 = id_1;
  reg id_6;
  always @(posedge id_3) begin : LABEL_0
    id_6 = #id_7 id_7;
  end
endmodule
module module_1 (
    input  logic id_0,
    input  tri0  id_1
    , id_7,
    input  logic id_2,
    input  wor   id_3,
    input  tri1  id_4,
    output logic id_5
);
  assign id_5 = 1 ? id_2 : id_0;
  assign id_7 = id_2;
  assign id_7 = 1'b0;
  wire id_8;
  module_0 modCall_1 (
      id_8,
      id_8,
      id_8,
      id_8,
      id_8
  );
  initial begin : LABEL_0
    id_5 <= 1 ? id_0 : id_2;
    id_5 <= 1;
  end
endmodule
