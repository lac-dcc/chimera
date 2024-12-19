// Seed: 3357014772
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_4 = 1;
  wire id_7;
endmodule
module module_1;
  wire id_1, id_2, id_3, id_4, id_5, id_6, id_7, id_8, id_9, id_10, id_11, id_12;
  module_0 modCall_1 (
      id_11,
      id_4,
      id_8,
      id_5,
      id_6,
      id_5
  );
  assign modCall_1.id_4 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = 1'h0;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_1,
      id_4,
      id_5
  );
  assign modCall_1.id_4 = 0;
  assign (weak1, highz0) id_4 = id_5 && ~id_8 - 1'b0 && 'b0;
endmodule
