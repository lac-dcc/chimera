// Seed: 2166277666
module module_0 (
    id_1,
    id_2,
    id_3,
    module_0,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_13;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_7,
      id_3,
      id_6,
      id_1,
      id_6,
      id_2,
      id_1,
      id_6,
      id_4,
      id_5
  );
  wire id_8;
  logic [7:0] id_9;
  assign id_9[1] = id_8;
  always @(1 ==? 1 or posedge 1'd0) begin : LABEL_0
    wait (id_1);
  end
endmodule
