// Seed: 2980620236
module module_0 (
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
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  logic [7:0] id_8;
  assign id_8 = id_4;
  assign id_6 = id_8[1];
  assign module_1.id_1 = 0;
endmodule
module module_1 ();
  uwire id_2;
  tri1  id_3;
  assign id_3 = 1;
  logic [7:0] id_4;
  wire id_5, id_6;
  initial $display(id_4[1]);
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6,
      id_4,
      id_5,
      id_3,
      id_2
  );
  assign id_2 = 1;
  id_7(
      .id_0(1), .id_1(id_1 * id_5)
  );
  assign id_3 = id_5 * id_1;
endmodule
