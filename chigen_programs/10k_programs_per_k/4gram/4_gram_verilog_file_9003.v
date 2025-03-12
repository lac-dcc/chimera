// Seed: 861738780
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
    id_15,
    id_16
);
  input wire id_16;
  input wire id_15;
  input wire id_14;
  input wire id_13;
  output tri1 id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output supply1 id_2;
  input wire id_1;
  assign id_12 = -1;
  assign id_2  = -1;
  wire id_17;
  always @(id_16 or posedge id_14) begin : LABEL_0
    $unsigned(42);
    ;
  end
endmodule
module module_1 (
    output logic id_0,
    input  wire  id_1,
    input  tri0  id_2
);
  localparam id_4 = 1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  always_comb @(posedge id_1) begin : LABEL_0
    id_0 = -1;
  end
endmodule
