// Seed: 3874045284
`timescale 1ps / 1ps
module module_0 #(
    parameter id_3 = 32'd46
) (
    input logic id_1,
    input id_2,
    output _id_3,
    input logic id_4,
    output id_5,
    input id_6,
    input id_7,
    input logic id_8,
    input logic id_9,
    input logic id_10,
    input id_11,
    output logic id_12
);
  always @(1'h0 or id_5 or 1'b0, posedge id_2[id_3] - {1, 1} or posedge 1) begin
    id_3 <= -id_3;
  end
  assign id_1 = 1 ? id_4 : id_11 ? ~id_10 : 1;
  type_21 id_13 (
      .id_0 (id_9),
      .id_1 (id_11[1] == 1),
      .id_2 (id_12 << 1),
      .id_3 (id_2),
      .id_4 (id_9),
      .id_5 (1'b0),
      .id_6 (id_11),
      .id_7 (id_10),
      .id_8 (1),
      .id_9 (id_2),
      .id_10(id_7)
  );
  logic id_14;
  always @(posedge 1) begin
    id_11 <= 1;
    id_5  <= 1;
  end
  initial begin
    SystemTFIdentifier(1, ~id_1);
    SystemTFIdentifier(id_10, id_9);
    id_4 = id_9[1];
  end
endmodule
