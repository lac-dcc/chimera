// Seed: 1805389634
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout tri id_1;
  wand id_5 = -1;
  assign id_1 = id_2 ? 1 : 1 & id_4;
  logic id_6;
  ;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_4,
      id_3
  );
  assign modCall_1.id_1 = 0;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_2 = id_4;
  always @(*) $signed(99);
  ;
  not primCall (id_2, id_1);
endmodule
