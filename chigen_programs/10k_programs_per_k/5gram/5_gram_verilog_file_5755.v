// Seed: 2953292526
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
    id_14
);
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout logic [7:0] id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_4[-1'b0] = -1 ? 1 : id_14;
  wire id_15;
endmodule
module module_1 #(
    parameter id_0 = 32'd7
) (
    input  tri0 _id_0,
    output wire id_1
);
  wire id_3;
  logic [7:0] id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_4,
      id_3,
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
  always_latch @(posedge -1 && id_4[id_0 :-1]) begin : LABEL_0
    wait ("");
  end
  assign id_1 = 1;
endmodule
