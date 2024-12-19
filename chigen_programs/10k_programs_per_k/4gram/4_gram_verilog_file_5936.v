// Seed: 1418205929
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = 1;
  module_0 modCall_1 (
      id_1,
      id_1
  );
  `define pp_7 0
  for (id_8 = id_8; id_1 & `pp_7; `pp_7 = id_3[1]) begin : LABEL_0
    assign `pp_7[`pp_7] = id_6;
  end
  id_9(
      .id_0(1), .id_1(~id_6 && 1)
  ); id_10 :
  assert property (@(posedge 1) id_4)
  else $display;
  wire id_11, id_12;
endmodule
