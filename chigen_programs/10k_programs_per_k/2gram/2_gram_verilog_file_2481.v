// Seed: 3098656108
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_3 = id_1;
  assign id_2 = 1;
  assign module_2.id_2 = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  assign id_1 = id_3;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  tri1 id_5;
  always begin : LABEL_0
    id_2 <= 1;
  end
  for (id_6 = 1; 1; id_4 = 1) begin : LABEL_0
    assign id_5 = id_5 == 1;
  end
  uwire id_7 = id_6;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_7
  );
endmodule
