// Seed: 3479563103
module module_0 (
    input supply1 id_0,
    input wand id_1
);
  uwire [-1 : 1] id_3;
  string id_4;
  assign id_4 = "";
  wire id_5;
  wire id_6;
  assign id_3 = 1;
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    output wire id_2,
    input supply1 id_3,
    input tri0 id_4
);
  wire id_6;
  xor primCall (id_2, id_1, id_3);
  module_0 modCall_1 (
      id_3,
      id_0
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input logic [7:0] id_1;
  assign id_6 = -1;
  always @(*) $signed(4);
  ;
endmodule
module module_3 #(
    parameter id_9 = 32'd3
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10
);
  output wire id_10;
  inout wire _id_9;
  inout logic [7:0] id_8;
  module_2 modCall_1 (
      id_8,
      id_10,
      id_10,
      id_1,
      id_4,
      id_10,
      id_5,
      id_3
  );
  input wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_11;
  wire id_12;
  always @(posedge id_12 or posedge id_7) while (id_8 == id_11) @("") id_8[~id_9] <= -1;
endmodule
