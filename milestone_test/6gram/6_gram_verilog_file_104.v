// Seed: 259712522
`define pp_1 0
`default_nettype `pp_1 `timescale 1 ps / 1 ps `timescale 1ps / 1ps
module module_0 #(
    parameter id_12 = 32'd62
) (
    input reg id_1,
    input reg id_2,
    input reg id_3,
    input logic id_4,
    input id_5,
    output reg id_6,
    input id_7,
    output id_8
);
  reg id_9 = 1, id_10;
  logic id_11;
  assign id_9 = id_10;
  type_22 _id_12 (
      .id_0('b0),
      .id_1(1),
      .id_2(1),
      .id_3(1),
      .id_4(1),
      .id_5(1'h0),
      .id_6(id_3),
      .id_7(id_11 - id_10)
  );
  assign id_5 = 1;
  initial begin
    id_10 <= 1;
    id_5  <= id_1;
    id_2[1-id_12] = 1;
  end
  logic id_13;
  type_24(
      id_3, id_2, id_6
  );
  always @(posedge id_5[1])
    if (id_10) id_10 <= #id_14 1'b0;
    else begin
      id_12 <= #1 id_2[1];
    end
endmodule
