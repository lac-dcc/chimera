// Seed: 2084320256
module module_0 (
    input wand id_0
);
  wire id_2;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    inout  wand id_0,
    output tri0 id_1,
    output wand id_2,
    output tri0 id_3,
    output wire id_4
);
  assign id_2 = id_0;
  module_0 modCall_1 (id_0);
  assign id_0 = 1'b0;
endmodule
macromodule module_2 (
    input logic id_0,
    input logic id_1,
    input tri id_2,
    input tri id_3,
    output logic id_4,
    input supply1 id_5,
    input logic id_6,
    output logic id_7,
    output tri id_8,
    input wire id_9,
    output wand id_10,
    output logic id_11
);
  tri0 id_13;
  assign id_7 = 1'b0;
  or primCall (id_4, id_3, id_15, id_2, id_18, id_16, id_5, id_13, id_9, id_17, id_1);
  reg id_15;
  reg id_16, id_17, id_18;
  module_0 modCall_1 (id_3);
  assign modCall_1.id_0 = 0;
  always begin : LABEL_0
    id_7 <= id_6;
    {id_16, 1, 1} <= 1;
    $display(id_14, 1, 1);
    id_11 <= "";
    if ({1'b0, 1 == 1'b0, 1}) begin : LABEL_0
      id_15 <= 1;
    end else id_4 <= (id_18);
  end
  assign id_13 = 1;
endmodule
