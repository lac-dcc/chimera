// Seed: 3320566187
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
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_12;
endmodule
module module_1 #(
    parameter id_8 = 32'd62,
    parameter id_9 = 32'd23
) (
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
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  defparam id_8.id_9 = id_4[1 : 1'b0];
  wire id_10 = id_5;
  wire id_11;
  xnor primCall (id_1, id_9, id_11, id_12, id_3, id_10, id_5, id_4, id_8, id_6);
  wire id_12;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_2,
      id_5,
      id_10,
      id_5,
      id_5,
      id_7,
      id_12,
      id_1,
      id_1
  );
endmodule
