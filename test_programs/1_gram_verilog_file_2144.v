// Seed: 1667072555
module module_0;
  wire id_2, id_3;
  module_3 modCall_1 (id_3);
endmodule
macromodule module_1 (
    output supply0 id_0,
    output tri1 id_1,
    id_3
);
  wire id_4;
  module_0 modCall_1 ();
endmodule
macromodule module_2 ();
  wire id_1;
  module_0 modCall_1 ();
endmodule
module module_3 (
    id_1
);
  inout wire id_1;
  id_2(
      id_3
  );
  wire id_4, id_5;
  parameter id_6 = -1'd0;
endmodule
program module_4 (
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
  input wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_8 = id_10;
  wire id_11, id_12, id_13;
  module_3 modCall_1 (id_12);
  id_15(
      id_3, 1 >= 1, id_9
  );
  wor id_16, id_17;
  wire id_18;
  wor  id_19, id_20 = id_3;
  id_21 :
  assert property (@(id_16 or posedge (id_12) or !id_5) 1 >> -1) id_10 <= -1;
  wire id_22;
endmodule
