// Seed: 1880381700
module module_0;
  wand id_1 = 1 << 1;
  assign id_1 = 1;
  specify
    (id_2 => id_3) = 1;
    (id_4 => id_5) = (1 & 1, 1'b0 - 1  : 1  : 1 - 1);
    (id_6 => id_7) = (id_2 + id_6);
    (id_8 => id_9) = 0;
    if (~1) (id_10 => id_11) = (1, id_7  : id_11  : 1);
    (id_12 => id_13) = (id_10  : 1'b0 - id_12  : 1, id_6);
    (id_14 => id_15) = (1  : id_13  : id_8, id_10 || 1'b0 & id_11  : id_7  : id_14);
    (id_16 *> id_17) = (id_6);
    (id_18 => id_19) = (1'b0 : 1  : id_2);
  endspecify
endmodule
module module_1;
  assign id_1 = 1;
  wire id_2, id_3, id_4, id_5, id_6;
  module_0();
endmodule
