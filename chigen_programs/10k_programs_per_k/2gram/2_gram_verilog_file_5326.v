// Seed: 1340731732
module module_0;
  wire   id_1;
  wire   id_2;
  wire   id_3;
  string id_4 = "";
  wire   id_5;
endmodule
module module_1 (
    output uwire id_0,
    input tri id_1,
    output supply1 id_2,
    input tri id_3,
    input tri1 id_4,
    input tri id_5,
    input wire id_6,
    input uwire id_7,
    input wor id_8,
    input uwire id_9,
    output wor id_10,
    output tri id_11,
    input tri id_12,
    input supply0 id_13,
    input uwire id_14,
    input wand id_15,
    output supply0 id_16,
    output tri1 id_17
);
  uwire id_19 = 1;
  always begin : LABEL_0
    @(posedge id_9 ? 1 & id_19 : id_15);
    $display(id_9, 1, id_14);
    #1 id_0 = 1'd0 * 1;
  end
  wire id_20;
  module_0 modCall_1 ();
  wire id_21;
  xnor primCall (
      id_0, id_1, id_12, id_13, id_14, id_15, id_19, id_20, id_3, id_4, id_5, id_6, id_7, id_8, id_9
  );
endmodule
