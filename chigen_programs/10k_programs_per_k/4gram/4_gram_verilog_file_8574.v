// Seed: 1003572027
module module_0 ();
  module_2 modCall_1 ();
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_6 = id_2;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2;
  uwire id_1 = 1'h0;
  assign module_3.id_4 = 0;
endmodule
module module_3 (
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
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  logic [7:0] id_7;
  assign id_7[1] = 1 ? id_4 : 1;
  nor primCall (id_1, id_3, id_4, id_5, id_6, id_7);
  module_2 modCall_1 ();
  assign id_6 = id_5 ? id_4 : {1, id_5, 1'b0, 1'h0, 1};
  id_8(
      .id_0(1), .id_1(1)
  );
endmodule
