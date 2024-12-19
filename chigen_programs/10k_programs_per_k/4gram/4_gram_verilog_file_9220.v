// Seed: 194900882
module module_0 ();
  reg id_2, id_3, id_4, id_5, id_6, id_7, id_8, id_9, id_10, id_11, id_12, id_13 = id_1;
  assign module_1.type_1 = 0;
  wand id_14;
  always
    if (id_13 == id_14) begin : LABEL_0
      id_5 = 1;
    end else begin : LABEL_0
      id_7 <= 1;
      if (id_3)
        forever begin : LABEL_0
          disable id_15;
        end
      assume (id_13);
    end
endmodule
module module_1 (
    input tri id_0,
    output wand id_1,
    input supply1 id_2,
    output wand id_3,
    output wire id_4
);
  id_6(
      id_0, 1, 1, 1, $display(1, id_3) !== 1'b0
  );
  module_0 modCall_1 ();
endmodule
