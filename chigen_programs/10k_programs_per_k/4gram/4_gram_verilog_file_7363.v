// Seed: 2645104338
`define pp_6 0
localparam id_4 = id_5 + (1);
`default_nettype id_4
`define pp_7 0
`timescale 1ps / 1ps
`define pp_8 0
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout id_6;
  input id_5;
  input id_4;
  inout id_3;
  input id_2;
  output id_1;
  function id_6(input id_7);
    id_3 <= #1 id_5;
    id_3 <= id_5 & 1'b0 & id_6 ? 1'h0 - 1 : id_4;
  endfunction
  assign id_6 = 1;
  type_8(
      id_6, id_2
  );
  assign id_6 = 1 ? id_5 : id_6;
endmodule
