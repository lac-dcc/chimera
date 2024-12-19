// Seed: 3404762055
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  logic [7:0] id_7;
  assign id_1 = 1;
  assign id_7[1] = id_6;
  assign id_4 = 1;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_1,
      id_3,
      id_2
  );
endmodule
module module_2;
  always id_1 = #id_2 1;
  reg id_4;
  always @(posedge 1) id_4 <= id_2;
  wire id_5;
  wire id_6, id_7;
  module_0 modCall_1 (
      id_5,
      id_7,
      id_5,
      id_5,
      id_7,
      id_5
  );
endmodule
