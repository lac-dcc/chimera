// Seed: 2497885237
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
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  tri id_14 = id_10;
  always @(posedge -1'd0, posedge id_7) begin : LABEL_0
    cover (id_14);
  end
  assign id_14 = 1'h0;
endmodule
module module_1 (
    output uwire id_0,
    input  wand  id_1,
    input  wand  id_2,
    output uwire id_3
);
  assign id_0 = -1'h0;
  assign id_3 = id_1;
  parameter id_5 = 1'b0;
  logic id_6 = id_5;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_5,
      id_5,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
  wire id_7;
  wire [-1 'b0 : 1] id_8;
  always disable id_9;
endmodule
