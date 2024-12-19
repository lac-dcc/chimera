// Seed: 3291349808
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  output wire id_1;
  `define pp_4 0
  assign module_1.id_3 = 0;
  assign `pp_4 = 1;
  assign id_1 = 1 << 1;
  for (id_5 = id_2; id_5++; `pp_4 = id_3) begin : LABEL_0
    uwire   id_6;
    supply1 id_7;
    integer id_8 = 1;
    assign id_7 = id_3;
    assign id_6 = 1;
  end
  wand id_9;
  assign id_9 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_4 = id_3;
  genvar id_5;
  assign id_3 = id_2;
  assign id_1 = 1;
  id_6 :
  assert property (@(posedge 1 + 1) 1)
  else;
  assign id_1 = id_2;
  wand id_7 = id_3;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_7
  );
endmodule
