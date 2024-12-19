// Seed: 1287788380
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2 = id_4++;
  wire id_7;
  module_2 modCall_1 (
      id_1,
      id_2,
      id_7,
      id_3
  );
endmodule
module module_1;
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
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
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  logic [7:0] id_5;
  wire id_6;
  always force id_2[1] = 1;
  assign id_2 = !id_3;
  assign id_5[1] = 1;
endmodule
