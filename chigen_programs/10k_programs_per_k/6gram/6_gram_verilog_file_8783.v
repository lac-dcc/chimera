// Seed: 1499479726
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_5;
  assign id_5 = id_5;
  always begin : LABEL_0
    id_3 <= 1;
  end
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(1'b0) begin : LABEL_0
    if (id_3) id_2 <= 1 == 1;
  end
  module_0 modCall_1 (
      id_1,
      id_1,
      id_2,
      id_3
  );
endmodule
