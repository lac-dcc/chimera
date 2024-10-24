// Seed: 3630628772
`timescale 1ps / 1ps
module module_0 (
    input id_0,
    input logic id_1,
    input supply1 id_2,
    input id_3
);
  always @(posedge id_0) begin
    id_4 <= 1'b0;
    if (id_3) begin
      id_4 <= id_3 | id_4;
    end
    #(id_2) id_4 <= id_4;
    if (id_4) begin
      id_4 <= 'b0;
    end else begin
      id_4 <= id_2[1];
    end
  end
endmodule
