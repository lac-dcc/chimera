// Seed: 231484545
`define pp_11 0
`celldefine
module module_0 (
    input id_0,
    input reg id_1,
    output reg id_2,
    input id_3,
    input reg id_4,
    output id_5,
    input id_6,
    input id_7,
    output reg id_8,
    input id_9,
    input logic id_10
);
  type_18(
      1, id_9
  );
  assign id_2 = 1'h0;
  always @(posedge (1)) begin
    id_8 <= id_9;
  end
  assign id_2 = id_6;
  assign id_8#(.id_6(id_7 & 1)) = id_6;
  assign id_8 = 1'b0 ? (id_3) : id_7;
  assign id_8 = 1 ? 1 : 1;
  logic id_11;
  always @(posedge 1) begin
    casez (id_7)
      1: id_2 = id_1;
      default: begin
        id_8  = id_9;
        id_11 = 1'h0;
        id_11 = id_0;
      end
    endcase
    #1 begin : id_12
      id_12 <= 1;
    end
    id_2 <= id_4;
  end
endmodule
