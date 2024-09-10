// Seed: 2644603325
module module_0 (
    output reg id_1,
    input id_2
);
  assign id_1 = 1'd0;
  assign id_2 = id_1;
  logic id_3;
  always
    if (id_2) id_1 <= id_2;
    else id_2 <= 1;
endmodule
