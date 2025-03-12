// Seed: 1457335501
module module_0 (
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
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_4 = 32'd7
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6
);
  input wire id_6;
  xnor primCall (id_1, id_3, id_5, id_6);
  inout wire id_5;
  inout wire _id_4;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_1
  );
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  initial assume (id_1);
  tri0 [id_4 : -1  -  -1] id_7 = ~id_3 ^ 1;
  always force id_4 = 1;
endmodule
