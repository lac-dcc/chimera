// Seed: 1481597888
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  assign id_1 = id_2;
endmodule
module module_1 (
    id_1
);
  inout wire id_1;
  wire id_2;
  assign id_2 = id_1;
  module_0 modCall_1 (
      id_2,
      id_1
  );
endmodule
module module_2 #(
    parameter id_1 = 32'd75
) (
    _id_1,
    id_2
);
  input wire id_2;
  inout wire _id_1;
  wire [-1  *  id_1 : 1] id_3;
  logic id_4 = id_4;
  logic id_5;
  assign id_4 = 1'b0;
  module_0 modCall_1 (
      id_4,
      id_4
  );
endmodule
module module_3 #(
    parameter id_2 = 32'd67,
    parameter id_6 = 32'd56
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7
);
  output wire id_7;
  output wire _id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire _id_2;
  module_0 modCall_1 (
      id_7,
      id_5
  );
  input wire id_1;
  logic [id_2 : id_6] id_8;
endmodule
