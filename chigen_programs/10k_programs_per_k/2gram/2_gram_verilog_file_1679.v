// Seed: 3086913179
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_5;
  module_2 modCall_1 (
      id_4,
      id_1,
      id_5
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  id_4(
      .id_0(1 & 1)
  );
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2
  );
  final begin : LABEL_0
    wait (1 & 1);
  end
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  output wire id_1;
  always_latch begin : LABEL_0
    id_1 = id_2;
  end
endmodule
