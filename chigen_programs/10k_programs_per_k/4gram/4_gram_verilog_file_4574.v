// Seed: 2660694116
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  localparam id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_1,
      id_3,
      id_2
  );
endmodule
module module_2 #(
    parameter id_1 = 32'd72
) (
    _id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_3,
      id_3,
      id_3
  );
  input wire _id_1;
  wire [id_1 : id_1] id_4;
endmodule
