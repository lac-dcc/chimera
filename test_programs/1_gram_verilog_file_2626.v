// Seed: 2798428946
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_5;
  assign id_1 = id_2;
  assign id_3 = id_3 + 1;
  logic [7:0] id_6;
  wire id_7;
  wire id_8;
  always begin : LABEL_0
    id_6[1'b0|1] <= -1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_7,
      id_1
  );
endmodule
