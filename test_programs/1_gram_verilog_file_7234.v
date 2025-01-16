// Seed: 1763753218
module module_0;
  assign id_1 = -1'b0;
endmodule
module module_1 (
    input  logic id_0,
    output wand  id_1,
    output logic id_2
);
  logic id_4 = id_0, id_5, id_6;
  always_ff begin : LABEL_0
    @* id_7;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  assign id_2 = 1;
  assign id_6 = id_0;
  assign id_4 = id_5;
  tri id_8, id_9;
  always
    if (1) @(*) id_2 <= 1;
    else @(posedge 1 or posedge id_6) id_5 <= id_8 - id_8;
  assign id_2 = 1;
endmodule
