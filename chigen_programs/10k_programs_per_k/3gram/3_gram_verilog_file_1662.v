// Seed: 3055553599
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  assign module_1.id_2 = 0;
  output wire id_2;
  input wire id_1;
  assign {id_1, -1} = id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_7,
      id_3
  );
  input wire id_4;
  output wire id_3;
  inout reg id_2;
  nor primCall (id_3, id_4, id_2, id_6, id_7);
  output wire id_1;
  final begin : LABEL_0
    if (1) id_2 = 1 - id_6;
    else id_2 <= -1'h0;
  end
endmodule
