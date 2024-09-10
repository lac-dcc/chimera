// Seed: 1628062698
`timescale 1ps / 1ps
module module_0 (
    output logic id_1,
    output reg id_2,
    output logic id_3,
    output logic id_4,
    input logic id_5,
    input id_6,
    input id_7,
    input id_8,
    input reg id_9,
    output logic id_10,
    input id_11,
    output logic id_12
);
  reg   id_13 = id_2;
  logic id_14;
  type_24(
      id_9, 1, id_13
  );
  reg id_15;
  initial begin
    for (id_14 = 1'b0; id_13; id_8 = 1'b0) begin
      SystemTFIdentifier(id_10, 1, id_11, id_7 + 1, id_14);
    end
    id_15 <= id_9;
    id_8 = 1'h0 === id_14;
  end
endmodule
