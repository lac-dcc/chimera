// Seed: 947971444
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_6;
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
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  or primCall (id_12, id_10, id_6, id_11, id_3, id_7, id_4, id_8, id_9);
  inout wire id_9;
  input logic [7:0] id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  module_0 modCall_1 (
      id_11,
      id_4,
      id_9,
      id_5,
      id_6,
      id_12,
      id_4,
      id_7,
      id_12
  );
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  logic id_13;
  ;
  always @(id_8[1'b0 :-1] or posedge 1 - 1) begin : LABEL_0
    disable id_14;
  end
endmodule
