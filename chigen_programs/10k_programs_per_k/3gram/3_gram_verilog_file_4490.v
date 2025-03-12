// Seed: 3999076591
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_4;
  wire id_5;
  final begin : LABEL_0
    disable id_6;
    $unsigned(59);
    ;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_3 = id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2
  );
endmodule
module module_2 (
    id_1,
    id_2,
    .id_6(id_3),
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3
  );
  assign id_1 = id_2;
endmodule
