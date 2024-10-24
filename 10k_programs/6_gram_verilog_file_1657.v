// Seed: 3113611501
module module_0 (
    output logic id_0,
    output id_1,
    input logic id_2,
    input logic id_3,
    output reg id_4,
    output reg id_5,
    input logic id_6,
    input reg id_7,
    input reg id_8
);
  reg id_9;
  assign id_4 = id_7 ? id_7 : 1'd0;
  always @(posedge 1) begin
    id_5 = 1;
    #1 id_1 = 1;
    id_4 <= 1 + id_9;
    id_9 <= 1;
    id_4 <= |id_9;
    id_5 <= id_8;
  end
  logic id_10;
  logic id_11;
endmodule
