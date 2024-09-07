// Seed: 3287588077
`timescale 1ps / 1ps
`define pp_1 0
module module_0;
  reg id_2;
  assign id_1 = id_2;
  reg id_3;
  assign id_3 = id_2;
  always
    if (id_1 - 1)
      if (id_2) begin
        id_2 = id_3;
        begin
          id_3 <= 1 && id_2;
          @(posedge 1'b0) id_1 <= id_2;
          id_1 = {id_2{1 * id_1[1]}};
        end
      end else id_2 <= id_3;
endmodule
