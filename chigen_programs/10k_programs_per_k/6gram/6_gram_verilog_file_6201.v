// Seed: 3904753311
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  always force id_2 = -1 == id_1;
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
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  inout logic [7:0] id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output reg id_1;
  parameter id_13 = 1;
  wire id_14;
  wire id_15;
  assign id_15 = id_8[-1'b0];
  module_0 modCall_1 (
      id_6,
      id_12
  );
  always @(id_6 or 1) begin : LABEL_0
    id_1 = id_8 << -1;
  end
endmodule
