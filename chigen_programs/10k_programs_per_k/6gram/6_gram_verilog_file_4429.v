// Seed: 415645201
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  reg id_7 = id_7;
  always @(1) begin : LABEL_0
    id_6 <= 1'h0;
    id_7 <= 1;
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
  input wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  logic [7:0] id_12;
  initial id_6 <= id_8;
  always @(posedge "") id_12[1'b0] <= 1'b0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_9,
      id_5,
      id_10,
      id_6
  );
  assign modCall_1.id_6 = 0;
endmodule
