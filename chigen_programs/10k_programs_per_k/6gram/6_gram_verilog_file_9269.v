// Seed: 3843327779
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  output logic [7:0] id_3;
  input wire id_2;
  inout wire id_1;
  wire id_6;
  assign id_3[1] = id_6;
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
    id_10
);
  inout wire id_10;
  inout logic [7:0] id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_9,
      id_10,
      id_5
  );
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(id_8, 1 or posedge 1) begin : LABEL_0
    id_9[-1] <= id_1;
  end
endmodule
