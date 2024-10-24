// Seed: 1919011405
`endcelldefine
module module_0 (
    output logic id_0,
    input logic id_1,
    input id_2,
    input logic id_3,
    input id_4,
    input logic id_5,
    input logic id_6,
    input logic id_7,
    input id_8,
    output logic id_9,
    input logic id_10,
    input id_11,
    input logic id_12,
    input id_13,
    inout id_14,
    output logic id_15,
    input id_16,
    output id_17,
    output logic id_18
);
  reg id_19;
  type_35(
      id_15, id_7
  );
  assign id_19 = 1;
  generate
    if (1 == 1) begin
      defparam id_20.id_21 = 1'b0;
      always @(posedge id_8) begin
        id_19 <= {id_4 ^ 1'b0{1}} === 1;
      end
    end else
      case (id_12)
        id_10: logic id_22;
        1'b0:  assign id_17 = id_11;
      endcase
  endgenerate
endmodule
