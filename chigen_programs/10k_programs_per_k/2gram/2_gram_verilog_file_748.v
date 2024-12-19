// Seed: 1079922716
module module_0;
  wire id_2, id_3, id_4, id_5, id_6, id_7, id_8, id_9, id_10, id_11, id_12, id_13;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output tri0 id_0
);
  wand id_2;
  assign id_0 = id_2 == 1 ^ 1 ? ~id_2 : (1);
  for (id_3 = id_2; id_3; id_3 = 1) begin : LABEL_0
    assign id_3 = id_2;
  end
  module_0 modCall_1 ();
  always begin : LABEL_0
    id_0 = 1;
    id_2 = id_2;
  end
  wire id_4;
  assign id_0 = id_4;
endmodule
