// Seed: 1671102508
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
    id_13
);
  output wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(posedge 1'd0 or posedge -1'b0) begin : LABEL_0
    if (1 || 1) begin : LABEL_1
      if (1) disable id_14;
    end
  end
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
    id_11
);
  output wire id_11;
  xor primCall (id_6, id_1, id_7, id_2, id_8, id_10);
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  module_0 modCall_1 (
      id_10,
      id_7,
      id_10,
      id_7,
      id_6,
      id_10,
      id_6,
      id_6,
      id_10,
      id_6,
      id_11,
      id_9,
      id_6
  );
  inout wire id_6;
  output reg id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_5 = 1;
  logic [7:0][1 : 1] id_12 = id_8;
  always_comb @(-1 == id_10 or id_8 or posedge id_7) id_5 = ((id_12)) & id_12[1 : 1];
endmodule
