// Seed: 1483365110
`timescale 1ps / 1ps
module module_0 (
    input reg id_0,
    output id_1,
    output id_2
);
  always @(posedge id_0 or negedge id_0) begin
    if (id_0) begin
      #1;
      id_2 <= 1;
      id_2 = id_0;
      id_1 = "";
      repeat (id_0[1'b0]) begin
        id_2 = 1;
      end
    end
  end
endmodule
