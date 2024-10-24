// Seed: 1608502361
`define pp_3 0
module module_0 (
    input  reg id_0,
    input  reg id_1,
    output reg id_2
);
  always @(negedge id_1)
    if (1) begin
      id_2 <= id_1;
    end else begin
      id_2 = id_1;
      id_2 <= id_0;
      id_2 = id_1;
    end
endmodule
`default_nettype id_0
