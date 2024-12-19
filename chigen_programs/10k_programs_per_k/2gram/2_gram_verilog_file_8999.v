// Seed: 477326694
module module_0 (
    input wand id_0,
    input supply1 id_1
);
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    input wire id_0,
    input tri1 id_1,
    output tri id_2,
    output wand id_3,
    input wor id_4,
    input wire id_5,
    input supply1 id_6,
    input wor id_7,
    output wire id_8,
    input supply0 id_9,
    input uwire id_10,
    output tri id_11
);
  assign id_3 = id_9;
  for (id_13 = ~id_6; id_5; id_3 = 1) begin : LABEL_0
    assign id_11 = id_0;
    wire id_14;
  end
  nor primCall (
      id_11, id_5, id_17, id_15, id_10, id_1, id_4, id_14, id_9, id_0, id_13, id_6, id_7, id_16
  );
  wire id_15;
  tri1 id_16 = 1 == id_9, id_17;
  assign id_11 = id_10;
  always begin : LABEL_0
    assert (1'b0) begin : LABEL_0
      wait (id_4);
    end
  end
  module_0 modCall_1 (
      id_6,
      id_5
  );
endmodule
