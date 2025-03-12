// Seed: 3309165105
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    access,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    module_0,
    id_12,
    id_13,
    id_14
);
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  always @(-1'b0, posedge 1) begin : LABEL_0
    deassign id_2;
  end
endmodule
module module_1 #(
    parameter id_2 = 32'd76,
    parameter id_3 = 32'd16
) (
    id_1,
    _id_2
);
  input wire _id_2;
  output logic [7:0] id_1;
  assign id_1[id_2] = id_2;
  parameter id_3 = -1'b0;
  reg id_4;
  wor id_5;
  assign id_5 = 1;
  wire id_6;
  logic [7:0][1 : id_3] id_7;
  initial begin : LABEL_0
    return id_3;
  end
  logic [id_3 : -1] id_8;
  wire id_9;
  module_0 modCall_1 (
      id_9,
      id_8,
      id_6,
      id_5,
      id_8,
      id_6,
      id_9,
      id_8,
      id_5,
      id_5,
      id_5,
      id_9,
      id_8,
      id_5
  );
  logic [1 : 1 'b0] id_10;
  wire id_11;
  logic [7:0] id_12;
  wire id_13;
  assign id_6 = id_12[~id_3 :-1&1];
  always @(posedge 1)
    if (id_3) id_4 <= id_7 - -1'd0;
    else id_7[-1] <= "";
  wire id_14;
endmodule
