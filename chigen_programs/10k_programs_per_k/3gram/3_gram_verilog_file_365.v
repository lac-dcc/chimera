// Seed: 3924926920
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign module_2.id_1 = 0;
  wire id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_7
  );
  input wire id_2;
  inout wire id_1;
  assign id_1 = id_2;
endmodule
module module_2 #(
    parameter id_1 = 32'd95
) (
    _id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input logic [7:0] id_2;
  input wire _id_1;
  wire [1 : id_1] id_5 = id_2[1 :-1];
  wire [1 : id_1] id_6 = id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6
  );
endmodule
