// Seed: 1599125262
`resetall `default_nettype id_2 `timescale 1ps / 1 ps
module module_0 (
    input reg id_0,
    input reg id_1,
    input id_2,
    output id_3
);
  always @(posedge id_1) begin
    case (id_0)
      id_2[1]: begin
        id_3 <= id_0;
      end
      1'd0: id_3 = 1;
      1: id_3 = id_1 & 1;
    endcase
  end
  logic id_4;
endmodule
