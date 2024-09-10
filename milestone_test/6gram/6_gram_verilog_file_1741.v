// Seed: 2409354821
module module_0 (
    input id_2,
    output reg id_3,
    output logic id_4
);
  logic id_5;
  reg   id_6;
  logic id_7;
  always @(*) begin
    id_6 <= id_3[1];
  end
endmodule
module module_1 #(
    parameter id_4 = 32'd49,
    parameter id_5 = 32'd21
) (
    input logic id_1,
    output reg id_2,
    input id_3,
    input logic _id_4,
    output _id_5,
    output id_6
);
  logic id_7 = 1;
  always @(posedge id_5) begin
    id_2 <= 1'h0;
  end
  assign id_6 = 1'b0 ? 1 * 1 : 1 + "" - id_4[1+id_4 : id_5-1];
endmodule
