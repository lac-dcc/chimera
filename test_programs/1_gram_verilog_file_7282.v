// Seed: 2782570712
program module_0;
  always @(posedge 1) begin : LABEL_0
    id_2 <= -1'b0 || 1;
    @(posedge ~id_2 or posedge id_2) id_1 <= !id_1;
  end
  assign id_1 = -1;
  assign id_1 = 1'b0 == id_1;
  wire id_3;
  wire id_4;
endmodule
module module_1 (
    output tri0 id_0,
    output uwire id_1,
    input supply0 id_2,
    input wand id_3,
    output supply0 id_4,
    output wire id_5,
    input wand id_6,
    input tri1 id_7,
    input wor id_8,
    input wand id_9,
    input supply1 id_10,
    input uwire id_11,
    output wand id_12,
    id_16,
    input tri0 id_13,
    input tri1 id_14
);
  always disable id_17;
  assign id_4 = 1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
