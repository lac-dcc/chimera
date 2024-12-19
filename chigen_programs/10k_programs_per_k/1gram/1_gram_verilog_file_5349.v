// Seed: 2528455508
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_3 = {id_2, id_3, 1} ? id_3 : id_1 * id_3 | 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_7 = 1'h0;
  reg id_8;
  assign id_1 = id_5;
  id_9 :
  assert property (@(negedge 1) id_6)
  else begin : LABEL_0
    id_8 <= this;
  end
  assign id_1 = id_8 - id_1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_1
  );
  assign modCall_1.id_2 = 0;
  wire id_10;
  assign id_7 = 1;
endmodule
