// Seed: 3067930031
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  assign id_1 = id_2;
  reg id_3;
  always begin : LABEL_0
    id_3 <= ~{{1{id_2[1]}}, "", 1, 1'h0};
  end
endmodule
module module_1;
  reg id_2;
  logic [7:0] id_3;
  always begin : LABEL_0
    id_1 <= id_1;
    id_2 <= id_1;
    id_1 <= id_3[1];
    id_2 = !1;
    id_2 <= 1;
  end
  wire id_4;
  module_0 modCall_1 (
      id_3,
      id_3
  );
  assign modCall_1.id_3 = 0;
endmodule
