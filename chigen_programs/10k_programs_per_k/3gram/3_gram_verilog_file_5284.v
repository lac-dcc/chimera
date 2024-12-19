// Seed: 4088799758
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  always #(id_2);
  assign id_6 = 1 != id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_3 = id_2;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_5,
      id_5,
      id_5,
      id_2
  );
  assign modCall_1.id_5 = 0;
endmodule
