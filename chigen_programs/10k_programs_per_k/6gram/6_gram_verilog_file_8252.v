// Seed: 1478853809
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(*) begin : LABEL_0
    id_1 <= id_1 == 1;
  end
endmodule
module module_0 (
    id_1,
    module_1,
    id_2,
    id_3,
    id_4
);
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  always
    if (1 / id_3 - (id_4)) begin : LABEL_0
      id_1 <= 1;
    end
  module_0 modCall_1 (
      id_1,
      id_3,
      id_3
  );
  assign modCall_1.id_1 = 0;
endmodule
