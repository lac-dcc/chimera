// Seed: 3180140325
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
    id_10
);
  input wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_11;
  wire id_12;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_5;
  reg  id_6;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_1,
      id_5,
      id_1,
      id_4,
      id_5,
      id_5,
      id_4,
      id_4
  );
  always @(posedge 1'h0 or posedge id_3[1'd0+:1'b0] + 1) begin : LABEL_0
    id_6 <= 1;
  end
  reg id_7 = id_6;
  always @(posedge 1);
endmodule
