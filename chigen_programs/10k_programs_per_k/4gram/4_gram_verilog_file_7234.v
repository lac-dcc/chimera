// Seed: 5271183
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3;
  wire id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_4,
      id_5
  );
  input wire id_1;
  wire id_6;
  assign id_3 = id_6;
endmodule
module module_2;
  parameter id_1 = -1;
  module_0 modCall_1 (
      id_1,
      id_1
  );
endmodule
module module_3 #(
    parameter id_2 = 32'd35,
    parameter id_7 = 32'd31
) (
    id_1,
    _id_2,
    id_3
);
  inout wire id_3;
  output wire _id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_3
  );
  logic id_4;
  integer [-1 : id_2] id_5;
  ;
  logic [7:0] id_6;
  ;
  wire _id_7;
  assign id_6[1] = 1;
  assign id_5[id_7-:1] = 1;
  wire id_8;
  ;
endmodule
