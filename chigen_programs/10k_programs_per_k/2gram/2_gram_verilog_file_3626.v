// Seed: 3218230882
module module_0 (
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
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  wire id_3;
  final begin : LABEL_0
    id_2[1] = 1;
  end
  assign id_2[1+:1<1] = id_1;
  wire id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3
  );
endmodule
module module_2 (
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
  always $display((id_4), id_3, id_2);
  xnor primCall (id_1, id_3, id_2, id_4);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_2,
      id_1
  );
endmodule
