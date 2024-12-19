// Seed: 2849736696
module module_0 #(
    parameter id_10 = 32'd81,
    parameter id_11 = 32'd81
) (
    input uwire id_0,
    input wire id_1,
    input tri0 id_2,
    input supply0 id_3,
    input uwire id_4,
    output tri1 module_0,
    input uwire id_6,
    input supply1 id_7
);
  wire id_9;
  always force id_5 = id_4 || 1;
  assign id_5 = 1;
  defparam id_10.id_11 = 1'h0;
  wire id_12;
  assign module_1.id_3 = 0;
  tri1 id_13 = id_11;
endmodule
module module_1 (
    output wand id_0,
    input  wire id_1,
    input  wor  id_2,
    output wand id_3,
    input  tri  id_4,
    input  wand id_5,
    output wand id_6,
    output tri0 id_7
);
  always @(*)
    if (id_4) begin : LABEL_0
      if (1) begin : LABEL_0
        id_7 = id_2 == id_1;
      end
    end
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_1,
      id_4,
      id_6,
      id_5,
      id_5
  );
endmodule
