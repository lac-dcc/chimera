// Seed: 3545868600
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1
);
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
module module_2 #(
    parameter id_3 = 32'd26
) (
    id_1,
    id_2,
    _id_3
);
  input wire _id_3;
  output wire id_2;
  output wire id_1;
  logic id_4;
  wire  id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_5,
      id_4,
      id_5,
      id_4,
      id_4,
      id_5
  );
  wire [id_3 : 1 'b0] id_6;
  assign id_6 = id_3;
endmodule
