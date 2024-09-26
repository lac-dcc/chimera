// Seed: 1005786093
`timescale 1ps / 1ps `timescale 1 ps / 1 ps
module module_0 (
    input id_0,
    input logic id_1,
    output id_2,
    input id_3,
    input id_4
);
  generate
    if (id_1) begin : id_5
      always @(negedge 1'b0) begin
        id_2 <= id_0 - 1;
      end
      assign id_5 = 1;
    end else begin
      defparam id_6.id_7 = 1 & 1'b0;
    end
  endgenerate
  type_0 id_8 (
      .id_0(~id_2),
      .id_1(1),
      .id_2(id_0),
      .id_3(1)
  );
  logic id_9, id_10;
  logic id_11 = 1'b0, id_12;
endmodule
