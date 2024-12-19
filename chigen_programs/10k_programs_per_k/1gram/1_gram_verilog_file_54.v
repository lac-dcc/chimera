// Seed: 1222528938
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  wire id_3, id_4, id_5;
  wire id_6, id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_4;
  final begin : LABEL_0
    id_3 <= 1;
  end
  assign id_1 = id_3;
  wire id_6 = id_4;
  module_0 modCall_1 (
      id_4,
      id_6
  );
endmodule
