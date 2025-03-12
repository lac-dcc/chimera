// Seed: 3911141540
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_6;
  assign module_1.id_4 = 0;
  wire [-1 'b0 : 1] id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  inout tri0 id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  xor primCall (id_3, id_2, id_5, id_4);
  assign id_4 = 1'b0;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_4,
      id_2,
      id_1
  );
endmodule
