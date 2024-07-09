`define id_0 0
module module_1 (
    id_2,
    input logic id_3,
    id_4,
    id_5,
    input [id_2 : 1] id_6,
    id_7,
    id_8,
    output logic id_9,
    id_10,
    input id_11,
    id_12
);
  logic id_13;
  always @(posedge 1'b0 or posedge id_3[1]) begin
    if (id_4) id_6 <= id_8;
    else begin
      case ((id_6))
        1, id_3: id_13 = id_4;
        default: id_12 = id_11;
      endcase
    end
  end
  logic [1 : id_14] id_15, id_16, id_17, id_18, id_19, id_20, id_21, id_22, id_23, id_24;
endmodule
