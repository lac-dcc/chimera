// Seed: 3549315880
module module_0 (
    id_1,
    id_2,
    module_0,
    id_3
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 (
    output tri0 id_0,
    input uwire id_1,
    output tri id_2,
    input wor id_3,
    output tri0 id_4,
    output wand id_5,
    output supply0 id_6,
    input wor id_7,
    input tri0 id_8,
    output wand id_9
);
  always @(negedge id_7 or posedge ~id_8) begin : LABEL_0
    if (id_3) begin : LABEL_0
      id_6 = id_3;
    end
  end
  wire id_11;
  xnor primCall (id_9, id_7, id_8, id_1, id_11, id_3);
  module_0 modCall_1 (
      id_11,
      id_11,
      id_11,
      id_11
  );
endmodule
