// Seed: 2625214532
`timescale 1 ps / 1 ps
module module_0 (
    input id_1,
    input id_2,
    input id_3
);
  generate
    for (id_4 = id_3; 1; id_1 = id_3) begin : id_5
      reg id_6 (
          id_1,
          id_2,
          id_1
      );
    end
  endgenerate
  logic id_7;
  initial begin
    id_3 <= id_4;
    #1 id_4 = (1);
    id_4 <= 1;
  end
endmodule
