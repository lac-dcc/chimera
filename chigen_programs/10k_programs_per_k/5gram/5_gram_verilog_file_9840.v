// Seed: 2098710889
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_4;
  specify
    specparam id_5 = id_2;
  endspecify
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_3
  );
  uwire id_6 = 1, id_7;
endmodule
module module_2 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  assign id_1 = id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1
  );
  wire id_3;
endmodule
