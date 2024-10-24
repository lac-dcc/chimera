// Seed: 2241603804
`timescale 1ps / 1ps
module module_0 (
    input id_0,
    input id_1,
    input id_2,
    input id_3,
    input id_4,
    input logic id_5,
    output reg id_6,
    input id_7,
    input id_8,
    output id_9
);
  logic id_10;
  logic id_11;
  always @(posedge 1'b0) id_9 = !id_1;
  logic id_12 = 1;
  assign id_6 = 1;
  logic id_13;
  type_25(
      id_7, 1, 1
  );
  tri1 id_14, id_15;
  logic id_16;
  assign id_12 = 1;
  logic id_17;
  logic id_18;
  always @(~id_11 or negedge id_0) begin
    SystemTFIdentifier(id_14);
    if ((id_13)) begin : id_19
      id_13 = 1;
      #1;
      if (1) begin
        id_6 <= 1;
      end else id_14[(1==1)] <= 1;
      SystemTFIdentifier;
    end
  end
endmodule
