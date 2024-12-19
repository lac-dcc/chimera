// Seed: 3524765603
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
    id_12
);
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_13;
  assign module_1.id_7 = 0;
  assign id_11 = 1;
endmodule
module module_1 (
    output tri1 id_0,
    input tri0 id_1,
    input tri0 id_2,
    input tri id_3,
    output logic id_4,
    input tri id_5,
    input uwire id_6,
    output tri0 id_7,
    input supply1 id_8,
    input supply0 id_9,
    output supply1 id_10
);
  tri0 id_12 = 1;
  reg  id_13;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12
  );
  assign id_12 = 1 - id_8;
  always @(negedge id_6 - 1 + 1) begin : LABEL_0
    id_4 <= id_13;
  end
endmodule
