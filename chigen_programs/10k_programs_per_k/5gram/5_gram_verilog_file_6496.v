// Seed: 615554654
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  assign id_1 = id_2;
  supply1 id_3;
  tri1 id_4;
  assign id_4 = 1'b0;
  always_latch @(id_3)
    if (1'b0 - id_4) begin : LABEL_0
      id_2#(
          .id_2(1 >= 1'b0),
          .id_3(id_3),
          .id_4(module_0)
      ) = id_4;
    end
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_2,
      id_1
  );
  assign modCall_1.type_7 = 0;
endmodule
