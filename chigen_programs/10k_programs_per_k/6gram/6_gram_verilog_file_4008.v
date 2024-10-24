// Seed: 31720289
`default_nettype id_0
`define pp_1 0
module module_0;
  reg id_0 = 1;
  always @(id_0)
    if (id_0 == 1) id_0 <= 1;
    else begin
      id_0 <= #1 id_0;
      if (1) begin
        id_0 = 1 == id_0;
      end
    end
endmodule
