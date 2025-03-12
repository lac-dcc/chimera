// Seed: 2414119569
module module_0 (
    output supply0 id_0,
    output tri0 id_1,
    input tri id_2,
    input tri id_3,
    input tri0 id_4,
    input wand id_5
);
endmodule
module module_1 (
    output supply0 id_0,
    input tri id_1,
    input wand id_2,
    input tri1 id_3,
    output wire id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_2,
      id_1,
      id_2,
      id_3
  );
endmodule
module module_2 #(
    parameter id_9 = 32'd32
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire _id_9;
  localparam id_10 = 1 ? 1 : 1;
  logic [id_9 : 1] id_11;
endmodule
module module_3 #(
    parameter id_1 = 32'd9,
    parameter id_4 = 32'd38
) (
    _id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  inout wire _id_4;
  module_2 modCall_1 (
      id_3,
      id_2,
      id_6,
      id_5,
      id_3,
      id_3,
      id_3,
      id_2
  );
  input wire id_3;
  inout wire id_2;
  inout wire _id_1;
  logic [-1 : -1] id_7;
  ;
  assign id_7[id_4+:(id_1)] = 1;
endmodule
