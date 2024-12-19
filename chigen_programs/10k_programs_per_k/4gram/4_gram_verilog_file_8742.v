// Seed: 2518733446
module module_0;
  supply1 id_1 = 1'b0 ^ 1;
endmodule
module module_1 (
    input tri id_0,
    input tri id_1,
    input wor id_2,
    input supply0 id_3,
    input wand id_4,
    input supply0 id_5,
    inout wire id_6,
    output supply0 id_7,
    input wand id_8,
    input supply1 id_9,
    input tri1 id_10,
    input supply1 id_11,
    input tri id_12
);
  assign id_7 = &id_9;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_14;
endmodule
module module_2 (
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
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  always_comb @* begin : LABEL_0
    id_2 = id_5(1);
    if (1) begin : LABEL_0
      if (1'b0) id_3 <= id_4;
    end
  end
  module_0 modCall_1 ();
  assign modCall_1.type_2 = 0;
endmodule
