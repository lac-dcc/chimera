// Seed: 919448828
`timescale 1ps / 1ps
module module_0 #(
    parameter id_6 = 32'd37,
    parameter id_7 = 32'd98,
    parameter id_8 = 32'd24
) (
    input reg id_1
    , id_2,
    output reg id_3,
    input id_4,
    input logic id_5,
    output _id_6,
    output _id_7,
    output logic _id_8
);
  assign id_7 = id_1[(1-id_6)];
  always @(posedge 1 or posedge 1'd0) begin
    if (1) begin
      id_4 <= 1'b0;
      id_7 <= id_3;
    end
    if (id_6) begin
      id_5 <= id_6;
      id_5[1] <= id_5;
      id_2 <= id_4;
    end else id_6 <= 1;
  end
  assign id_4[id_8] = id_5;
  defparam id_9.id_10 = id_2;
  reg id_11;
  type_19(
      1, 1 == 1, 1
  );
  reg   id_12;
  logic id_13;
  assign id_8[1] = id_11;
  logic id_14;
  always @(posedge id_1) begin
    id_13#(
        .id_9 (id_9),
        .id_14(id_4),
        .id_2 (id_11[1'b0]),
        .id_5 (1),
        .id_13(id_14),
        .id_5 (1'h0)
    ) = 1;
    id_12 <= 1'b0 ^ id_13 * id_3 + id_9[id_7];
    id_8  <= 1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input id_5;
  output id_4;
  input id_3;
  output id_2;
  input id_1;
  reg id_6 = id_4[1%1==1];
  always @(posedge 1'b0 or 1) id_4 <= (id_3);
endmodule
