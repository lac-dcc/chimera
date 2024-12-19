// Seed: 4103694401
module module_0;
  string id_2 = "";
endmodule
module module_1 ();
  assign id_1 = 1;
  reg id_2 = 1;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = "";
  final begin : LABEL_0
    id_2 <= 1;
    id_2 = id_1;
  end
endmodule
module module_2 (
    input wor id_0,
    input wor id_1,
    output wire id_2,
    input tri1 id_3,
    output wand id_4,
    output logic id_5,
    input uwire id_6,
    output tri0 id_7,
    input supply1 id_8,
    input tri0 id_9,
    input logic id_10
);
  for (id_12 = id_8; id_1; id_4 = id_0) begin : LABEL_0
    if (1'b0) begin : LABEL_0
      assign id_2 = id_8;
      always @(id_8 & 1 or posedge id_0) id_5 = #1 id_10;
    end
  end
  module_0 modCall_1 ();
  assign modCall_1.id_2 = "";
endmodule
