// Seed: 4050437827
module module_0 (
    input uwire id_0
);
  assign id_2 = "";
endmodule
module module_1 (
    input supply1 id_0,
    id_8,
    input tri id_1,
    input tri id_2,
    input supply1 id_3,
    output tri id_4,
    input wor id_5,
    input wire id_6
);
  reg id_9, id_10, id_11;
  module_0 modCall_1 (id_0);
  assign modCall_1.id_0 = 0;
  always id_9 <= 1 / (id_5);
  final id_10 <= 1;
  assign id_9 = -1'h0;
  assign id_8 = -1;
endmodule
module module_2 (
    id_1
);
  output wire id_1;
  always id_1 <= id_2;
  id_3(
      id_1, id_1
  );
endmodule
module module_3 (
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
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  parameter id_9 = -1;
  supply0 id_10;
  or primCall (id_2, id_1, id_9, id_4, id_8, id_7, id_11, id_10, id_6);
  id_11 :
  assert property (@(posedge id_6 or posedge id_7 or -1) 1 * 1)
    if (id_10)
      if (id_6) @(posedge id_9 & -1'b0) id_9 <= -1;
      else id_5 = id_4;
  module_2 modCall_1 (id_9);
endmodule
