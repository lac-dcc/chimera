// Seed: 1561070232
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_10;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_1 = id_6;
  nor primCall (id_3, id_4, id_6, id_5, id_1);
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_6,
      id_1,
      id_1,
      id_6,
      id_6,
      id_6
  );
  reg id_7 = 1;
  always @(posedge 1 or id_7) id_7 <= id_5;
  assign id_3[1'd0] = id_7;
endmodule
