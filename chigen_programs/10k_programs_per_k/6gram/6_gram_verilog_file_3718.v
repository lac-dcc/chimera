// Seed: 4046465343
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = 1'd0 ? 'b0 : {id_5{id_3}};
  wire id_10;
  wire id_11;
  assign id_8 = 1 || -id_7;
endmodule
module module_1 (
    input wire id_0
);
  initial id_2 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_8 = 0;
  wire id_3;
  wire id_4;
endmodule
