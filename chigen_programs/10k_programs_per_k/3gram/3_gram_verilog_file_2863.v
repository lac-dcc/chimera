// Seed: 1646977182
module module_0 (
    output supply0 id_0,
    input wand id_1
);
endmodule
module module_1 (
    input tri0 id_0,
    output tri1 id_1,
    input wor id_2,
    input supply0 id_3
);
  assign id_1 = id_0;
  module_0 modCall_1 (
      id_1,
      id_2
  );
  assign modCall_1.id_0 = 0;
  logic id_5 = -1;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output tri1 id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_7 = -1;
endmodule
module module_3 #(
    parameter id_2 = 32'd87,
    parameter id_6 = 32'd95
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire _id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  input wire _id_2;
  input wire id_1;
  logic id_10;
  ;
  wire [id_6  ?  id_2 : 1 : 1] id_11;
  module_2 modCall_1 (
      id_8,
      id_10,
      id_10,
      id_10,
      id_11,
      id_3,
      id_7
  );
  wire id_12;
  assign id_10 = id_5;
  logic id_13;
endmodule
