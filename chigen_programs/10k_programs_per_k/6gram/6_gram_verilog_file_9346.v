// Seed: 2325368903
module module_0;
  wire id_1;
  wire id_2, id_3, id_4, id_5;
  wire id_6;
  assign module_2.id_5 = 0;
  assign id_6 = (id_5);
endmodule
module module_1 (
    input wor id_0,
    output uwire id_1,
    input uwire id_2,
    input wand id_3
    , id_6,
    output supply1 id_4
);
  wire id_7 = 1;
  module_0 modCall_1 ();
  wire id_8;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_1 = 1'h0;
  module_0 modCall_1 ();
  always @(posedge id_3 & id_5 or posedge 1) begin : LABEL_0
    if (id_5)
      assume (id_1);
      else begin : LABEL_0
        id_5 <= 1;
      end
  end
endmodule
