// Seed: 2813295095
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  output wire id_1;
  logic   id_4 = -1;
  integer id_5;
  ;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2
  );
  assign id_1 = id_2;
endmodule
module module_2 #(
    parameter id_1 = 32'd75
) (
    _id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2
  );
  inout wire _id_1;
  wire [1 'b0 : id_1] id_4;
endmodule
