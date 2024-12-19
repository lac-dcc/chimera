// Seed: 692350548
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(1) #0;
  assign module_1.id_2 = 0;
  initial begin : LABEL_0
    {1'h0} += 0;
    id_1 <= id_1 - id_2 ? id_3 : id_2;
    id_2 <= (1);
    id_1 <= 1;
    $display(1 == id_1, id_3 + (id_2));
    id_2#(.id_1(1)) <= id_1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    id_2 <= (id_3 == id_3) - 1;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2
  );
endmodule
