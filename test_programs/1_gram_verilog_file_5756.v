// Seed: 3672633047
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_4 = -1 & -1'b0;
  wire id_5;
  wire id_6, id_7;
  wire \id_8 , id_9;
  wire id_10;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign (highz1, strong0) id_7 = id_6;
  nor primCall (id_9, id_10, id_7, id_5, id_6, id_8);
  module_0 modCall_1 (
      id_7,
      id_6,
      id_10,
      id_9
  );
  assign id_1 = -1;
endmodule
