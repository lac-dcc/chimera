// Seed: 744923350
module module_0 (
    output id_0,
    input id_1,
    input id_2,
    input id_3
    , id_20,
    input logic id_4,
    output id_5,
    input id_6,
    output id_7,
    output id_8,
    output logic id_9,
    input id_10,
    input id_11,
    output reg id_12,
    input id_13,
    input id_14,
    output id_15,
    output id_16,
    input logic id_17,
    input id_18,
    output logic id_19
);
  logic id_21;
  assign id_19 = id_11;
  assign id_21 = 1;
  always @(negedge id_20 or posedge 1'b0) begin
    case (1'b0 - 1)
      1'b0:
      if (id_1[1]) begin
        id_19 = id_20;
      end
      1'b0: {id_4, id_17, id_13} = 1'b0;
      default: id_8 <= 1'b0;
    endcase
  end
  logic id_22;
  always @(id_20 or negedge 1) id_12 <= #1 id_2 * id_10 * 1;
  logic id_23 = id_4;
  logic id_24;
endmodule
