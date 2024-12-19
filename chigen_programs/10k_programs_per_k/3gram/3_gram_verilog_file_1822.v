// Seed: 1822965172
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_4;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  uwire id_6;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3
  );
  id_7(
      .id_0(id_1), .id_1(id_5), .id_2(1'b0), .id_3(), .id_4(id_6 && 'b0), .id_5(id_2)
  );
  assign id_5 = id_6;
endmodule
