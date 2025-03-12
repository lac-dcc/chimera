// Seed: 3039232719
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  logic id_4;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1
  );
  output wire id_1;
  wire id_3;
  ;
endmodule
module module_2 #(
    parameter id_1 = 32'd62,
    parameter id_5 = 32'd7
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  inout wire _id_5;
  input wire id_4;
  input wire id_3;
  module_0 modCall_1 (
      id_6,
      id_2,
      id_2
  );
  inout wire id_2;
  input wire _id_1;
  wire id_8;
  wire [id_1 : id_5] id_9;
endmodule
