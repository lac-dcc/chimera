// Seed: 1496188637
module module_0 ();
  wire id_2, id_3, id_4, id_5, id_6, id_7, id_8;
  wire id_9;
  assign module_1.type_36 = 0;
  wire id_10;
endmodule
module module_1 (
    input supply0 id_0,
    output tri id_1,
    input uwire id_2,
    output uwire id_3,
    input wor id_4,
    output uwire id_5,
    output wor id_6,
    input tri id_7,
    input supply1 id_8,
    output wire id_9,
    input wire id_10,
    output tri1 id_11,
    output supply1 id_12,
    input tri1 id_13,
    output tri id_14
);
  wand id_16;
  always @(posedge id_10) begin : LABEL_0
    id_1 = id_8;
    $display(!id_7);
  end
  uwire id_17;
  always @(id_16) begin : LABEL_0
    disable id_18;
  end
  uwire id_19;
  tri   id_20;
  wire  id_21;
  id_22 :
  assert property (@(posedge {id_20 === 1{id_19.id_22}}) id_17)
  else $display(1);
  wand id_23 = id_0 == id_23;
  wire id_24;
  module_0 modCall_1 ();
endmodule
