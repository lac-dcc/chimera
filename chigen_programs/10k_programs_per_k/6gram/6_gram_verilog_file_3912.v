// Seed: 392330636
module module_0;
  always @(posedge !1) id_1 <= #1 id_1;
  assign module_2.id_3 = 0;
endmodule
module module_1 (
    input  tri1  id_0,
    input  wand  id_1,
    input  wand  id_2,
    input  tri0  id_3,
    output logic id_4
);
  wand id_6 = 1;
  always @(posedge id_2) begin : LABEL_0
    id_4 <= 1 - id_0;
  end
  tri id_7 = 1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    input supply0 id_0,
    output uwire id_1,
    output tri0 id_2,
    input tri0 id_3,
    output wire id_4
);
  assign id_4 = 1;
  assign id_1 = id_3;
  module_0 modCall_1 ();
endmodule
