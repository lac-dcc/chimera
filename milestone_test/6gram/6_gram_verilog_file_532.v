// Seed: 944216604
localparam id_1 = id_1[1 : 1];
module module_0 (
    input logic id_1,
    output id_2,
    output id_3,
    input id_4,
    output logic id_5,
    input id_6,
    input logic id_7,
    output logic id_8
);
  logic id_9 (
      id_8 - 1'b0,
      1,
      id_2
  );
  type_16(
      id_2, 1, 1
  );
  assign id_4 = id_2[1'h0 : 1] + 1'd0;
  logic id_10 = id_4;
  assign id_8[1] = 1;
endmodule
`default_nettype id_1
module module_1 #(
    parameter id_2 = 32'd22,
    parameter id_7 = 32'd58
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input id_6;
  output id_5;
  input id_4;
  output id_3;
  input _id_2;
  input id_1;
  logic _id_7;
  assign id_7 = SystemTFIdentifier(id_4[1'b0]);
  always @(posedge 1 or posedge id_6) begin
    case (1'b0)
      id_5: id_5 <= id_4[~id_7 : 1'b0];
      1: {id_2, id_5} = 1'b0 + 1;
      1'd0: id_5 = id_2;
      1: id_2 = id_1;
      default: id_6[id_2][1] <= 1;
    endcase
  end
  always @(negedge 1) begin
    id_2 <= 1 != id_7;
  end
endmodule
