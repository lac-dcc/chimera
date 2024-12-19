// Seed: 3501833329
module module_0 (
    input supply1 id_0,
    input wand id_1,
    output wand id_2,
    output tri0 id_3,
    output supply0 id_4,
    input uwire id_5,
    input wand id_6
);
  pullup (id_0, 1 - 1, id_4, id_1);
  assign id_3 = 1;
  wire id_8;
  assign module_1.type_9 = 0;
  generate
    if (1) begin : LABEL_0
      wand id_9 = 1;
    end else if (1 < 1) id_10(1, 1);
    else begin : LABEL_0
      assign id_3 = id_1;
    end
    assign id_3 = 1'b0;
  endgenerate
  wire id_11;
  tri  id_12;
  final $display(1, 1, 1'h0, 1, 1'b0, id_12);
  wire id_13;
endmodule
module module_1 (
    output wand id_0,
    output uwire id_1,
    output wand id_2,
    output tri1 id_3,
    input tri0 id_4,
    input supply1 id_5,
    input tri id_6
);
  assign id_1 = 1'b0;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_0,
      id_2,
      id_3,
      id_5,
      id_5
  );
endmodule
