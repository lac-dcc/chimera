// Seed: 491539726
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout tri0 id_2;
  output wire id_1;
  wire id_7;
  assign id_2 = (id_4 - 1);
endmodule
module module_1 #(
    parameter id_6 = 32'd73
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  output wire id_15;
  module_0 modCall_1 (
      id_8,
      id_3,
      id_13,
      id_7,
      id_4,
      id_8
  );
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  inout logic [7:0] id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire _id_6;
  input wire id_5;
  nor primCall (id_9, id_8, id_12, id_1, id_5, id_7, id_4, id_13, id_3, id_10);
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  reg [1 'h0 ==  id_6 : 1] id_16;
  always @(posedge $realtime ^ (-1'h0)) begin : LABEL_0
    id_16 <= 1 - id_7;
  end
endmodule
