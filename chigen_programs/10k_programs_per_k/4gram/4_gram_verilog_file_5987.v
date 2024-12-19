// Seed: 4040445795
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  always @({1, id_3});
  module_2 modCall_1 (id_5);
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  supply1 id_3 = 1, id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3
  );
endmodule
module module_2 (
    id_1
);
  output wire id_1;
  supply1 id_2 = 1;
  wire id_3;
  always_latch @(posedge id_2 || 1) begin : LABEL_0
    id_1 = 1;
  end
endmodule
