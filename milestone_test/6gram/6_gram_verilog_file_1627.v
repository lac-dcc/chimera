// Seed: 3379074134
module module_0;
  always @(1)
    if (id_1) id_1 <= 1'b0;
    else id_1[1] <= 1'b0;
  logic id_2;
  assign id_1 = id_1 ? id_1 : id_1;
endmodule
