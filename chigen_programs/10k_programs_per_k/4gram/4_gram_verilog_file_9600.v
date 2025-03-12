// Seed: 577914453
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  logic id_5;
  ;
  wire id_6;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3
  );
  wire id_4;
  ;
endmodule
module module_2 #(
    parameter id_1 = 32'd25
) (
    input  wire id_0,
    output tri1 _id_1
);
  wire [-1 : 1] id_3;
  wire [-1 : id_1] id_4;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_3
  );
endmodule
