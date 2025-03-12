// Seed: 1872343953
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  genvar id_5;
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
  output logic [7:0] id_11;
  input wire id_10;
  inout wire id_9;
  output reg id_8;
  inout wire id_7;
  output reg id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  module_0 modCall_1 (
      id_1,
      id_7,
      id_10,
      id_9
  );
  input wire id_2;
  inout uwire id_1;
  always @(posedge $realtime) begin : LABEL_0
    id_8#(.id_3(1)) <= id_5;
    id_6 = -1;
    if (1) begin : LABEL_1
      @(posedge id_4 == 1);
    end
  end
  assign id_1 = 1;
  wire id_12;
  assign id_11[1] = id_7;
endmodule
