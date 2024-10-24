// Seed: 3142586169
`timescale 1 ps / 1 ps `timescale 1 ps / 1 ps `timescale 1ps / 1 ps
`define pp_2 0
module module_0 (
    input id_0,
    input id_1
);
  reg id_2;
  always @(posedge 1) begin
    if (id_1) id_2 <= 1;
    if (id_0) begin
      id_2 <= 1;
    end
    id_2 <= #id_0 1;
    if (1'h0)
      if (1) begin
        if (id_1) begin
          id_2 <= id_1;
        end
      end else id_2 = 1;
    id_2 = (id_0);
    if (1) id_2 <= 1'b0;
  end
endmodule
