// Seed: 4011895155
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  id_3(
      .id_0(1 <= id_2), .id_1((1)), .id_2(1), .id_3(1), .id_4(1'b0), .id_5(1), .id_6(1)
  );
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  assign id_1 = 1'b0;
  module_0 modCall_1 (
      id_1,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
