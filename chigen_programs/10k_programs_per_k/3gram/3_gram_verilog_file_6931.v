// Seed: 537674305
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  reg id_5;
  id_6 :
  assert property (@(-1) id_4 < id_2)
  else begin : LABEL_0
    id_5 = id_3;
  end
  assign id_5 = id_6;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wand id_1;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_4,
      id_3
  );
  assign id_1 = 1;
endmodule
