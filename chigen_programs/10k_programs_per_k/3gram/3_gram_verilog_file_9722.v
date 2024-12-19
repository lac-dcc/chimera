// Seed: 2961213597
module module_0 (
    input supply1 id_0,
    output wire id_1,
    input tri id_2
);
  tri id_4, id_5;
  logic [7:0] id_6;
  wire id_7;
  always @(1'd0 or posedge {1{id_4 != 1}}) begin : LABEL_0
    id_5 = 1;
    $display(id_5);
  end
  always #1 assign id_5 = id_6[1];
  assign module_1.type_11 = 0;
endmodule
module module_1 (
    output wor id_0,
    output wire id_1,
    output wire id_2,
    output wand id_3,
    input supply0 id_4,
    output wand id_5,
    input tri id_6
);
  integer id_8;
  xnor primCall (id_5, id_4, id_6, id_8);
  assign id_5 = id_8;
  module_0 modCall_1 (
      id_8,
      id_5,
      id_4
  );
endmodule
