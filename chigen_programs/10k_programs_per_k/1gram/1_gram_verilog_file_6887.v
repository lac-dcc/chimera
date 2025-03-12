// Seed: 2455306543
module module_0 (
    id_1,
    id_2
);
  input logic [7:0] id_2;
  output wire id_1;
  module_2 modCall_1 (id_1);
  assign id_1 = id_2[1];
  assign id_1 = id_2;
  wire id_3, id_4;
  logic id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout logic [7:0] id_2;
  output wire id_1;
  assign id_2[1] = id_2;
  module_0 modCall_1 (
      id_3,
      id_2
  );
endmodule
module module_2 (
    id_1
);
  output wire id_1;
  struct packed {
    logic id_2;
    id_3  id_4;
    struct packed {
      logic id_5;
      logic id_6;
    } id_7;
  } id_8;
  ;
  logic id_9;
  assign id_8 = id_9.min;
endmodule
