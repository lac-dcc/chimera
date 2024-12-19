// Seed: 3738112131
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = 1'b0;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  wire id_3;
  initial begin : LABEL_0
    fork
      wait (1);
      assume (1'b0);
      $display(1);
    join
    if (1) assume (1);
  end
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_1,
      id_3
  );
endmodule
