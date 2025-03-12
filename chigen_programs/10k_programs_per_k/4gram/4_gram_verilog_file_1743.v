// Seed: 3459710734
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output uwire id_3;
  output wire id_2;
  input wire id_1;
  assign id_3 = 1;
endmodule
module module_1;
  wire id_1;
  tri0 id_2 = 1 & id_1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1
  );
endmodule
module module_2 #(
    parameter id_14 = 32'd55
) (
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
    id_11,
    id_12,
    id_13,
    _id_14,
    id_15
);
  output wire id_15;
  input wire _id_14;
  inout logic [7:0] id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output uwire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  module_0 modCall_1 (
      id_3,
      id_11,
      id_5,
      id_7,
      id_5,
      id_1
  );
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_8 = id_7 == id_13[-1 : id_14];
endmodule
