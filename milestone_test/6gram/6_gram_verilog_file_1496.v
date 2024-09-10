// Seed: 1384059130
`timescale 1ps / 1ps
module module_0 #(
    parameter id_14 = 32'd27,
    parameter id_15 = 32'd65
) (
    output reg id_1,
    input id_2,
    input reg id_3,
    output reg id_4,
    input id_5,
    output id_6,
    output id_7,
    input id_8,
    input reg id_9,
    output id_10
);
  reg   id_11;
  logic id_12;
  assign id_1 = id_4;
  always @(*) begin
    if (1) if (id_8) id_9 = id_4;
  end
  logic id_13 = id_4 - 1;
  logic _id_14;
  always @(posedge 1) begin
    if (id_4) begin
      if (1) begin
        id_11 <= id_4;
      end else begin
        SystemTFIdentifier(1);
      end
    end else begin
      if (id_5) begin
        id_10 <= 1'b0;
      end else id_3 <= 1'b0;
    end
  end
  assign id_10 = 1 < id_9;
  logic _id_15;
  assign id_9[1+:id_14] = id_10;
  type_27(
      1'b0, 1, id_1, 1
  );
  logic id_16;
  logic id_17;
  assign id_1 = id_6;
  type_30(
      id_11, 1, id_5
  ); type_31(
      1, 1, id_1, id_10 - id_3
  );
  assign id_6[id_15] = 1'b0;
  assign id_15 = 1;
  type_32(
      1'h0, 1, 1, id_2
  );
  always @(*) begin
    id_5 <= (1);
  end
endmodule
