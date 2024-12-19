// Seed: 1285860069
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  reg id_4;
  module_2 modCall_1 ();
  always force id_3 = id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  initial begin : LABEL_0
    begin : LABEL_0
      id_4 = 1;
      #1;
    end
  end
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4
  );
endmodule
module module_2 ();
  logic [7:0] id_1;
  assign id_1[1] = id_1;
  assign id_1 = id_1;
endmodule
