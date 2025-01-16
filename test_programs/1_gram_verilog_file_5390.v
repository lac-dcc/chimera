// Seed: 270594657
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  output wire id_1;
  tri1 id_4, id_5;
  xor primCall (id_2, id_7, id_6, id_5, id_4);
  wire id_6;
  parameter id_7 = id_4;
  wire id_8;
  module_2 modCall_1 (id_3);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_7
  );
  nor primCall (id_5, id_4, id_2, id_3);
endmodule
module module_2 (
    id_1#(
        .id_2(id_2 - 1'b0),
        .id_3(1)
    )
);
  input wire id_1;
  wire id_4;
  wire id_5;
  assign module_0.id_5 = 0;
endmodule
