// Seed: 1584066160
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_6, id_7;
  wire id_8, id_9;
  wire id_10, id_11;
  supply0 id_12 = 1;
  wire id_13;
  assign id_10 = id_10;
  always id_5 = id_5;
  always id_1 <= -1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_9;
  always id_2 <= #1 id_2;
  module_0 modCall_1 (
      id_2,
      id_9,
      id_5,
      id_9,
      id_9
  );
  wire id_10 = id_3, id_11, id_12;
  id_13 :
  assert property (@(posedge 1) -1'b0);
  xnor primCall (id_6, id_4, id_5, id_9, id_7, id_1, id_3, id_2);
endmodule
