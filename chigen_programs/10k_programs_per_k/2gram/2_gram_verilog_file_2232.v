// Seed: 3638140602
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  module_2 modCall_1 (
      id_3,
      id_3
  );
  assign modCall_1.type_6 = 0;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    id_1 <= 1'b0;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
endmodule
module module_2 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  reg  id_3;
  wire id_4;
  wire id_5 = id_1;
  assign id_5 = id_2;
  initial id_3 <= 1;
  assign id_2 = id_4;
  assign id_4 = id_5;
endmodule
