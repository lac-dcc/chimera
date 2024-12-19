// Seed: 4236864166
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wand id_7;
  id_8 :
  assert property (@(posedge id_5) id_7)
  else $display;
  wire id_9;
  initial begin : LABEL_0
    @(negedge 1) id_2 = 1;
    if (id_3) disable id_10;
  end
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
  assign modCall_1.id_2 = 0;
endmodule
