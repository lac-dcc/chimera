// Seed: 1300731735
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always begin : LABEL_0
    id_5 = id_2;
  end
  id_7(
      .id_0(1'b0), .id_1(id_1)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  uwire id_6;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_4,
      id_4,
      id_1,
      id_4
  );
  assign id_4 = ~!id_6;
  wor id_7;
  final id_7 = id_6;
endmodule
