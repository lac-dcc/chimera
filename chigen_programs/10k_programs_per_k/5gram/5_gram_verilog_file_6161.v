// Seed: 768004555
module module_0;
  supply1 id_1 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(posedge id_4[1 : 1] == 1 - 1) if (1) assume (id_1);
  module_0 modCall_1 ();
  wire id_7;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_1[1'b0] = id_3 == 1;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_6[1] = id_1;
  assign id_2 = id_4;
  module_2 modCall_1 (
      id_6,
      id_2,
      id_7
  );
  assign modCall_1.id_3 = 0;
  wire id_8;
endmodule
