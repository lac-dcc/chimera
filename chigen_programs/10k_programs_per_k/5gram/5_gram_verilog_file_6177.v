// Seed: 2413502276
module module_0 (
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
  tri id_7 = 1;
  supply0 id_8 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(posedge id_3 == 1) $display(1);
  final begin : LABEL_0
    wait ("");
  end
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2
  );
  assign modCall_1.type_11 = 0;
  wire id_4;
endmodule
