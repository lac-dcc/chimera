// Seed: 2757256225
`timescale 1 ps / 1ps
`define pp_4 0
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output id_4;
  inout id_3;
  inout id_2;
  output id_1;
  type_17(
      1, ~1, 1
  );
  initial begin
    id_2 <= id_3;
    id_3 <= id_2;
    @(posedge id_3 or negedge id_3 or posedge 1'b0 - id_2) id_4 = id_2;
    id_4 = id_3;
  end
  reg id_4, id_5, id_6, id_7, id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15, id_16;
endmodule
