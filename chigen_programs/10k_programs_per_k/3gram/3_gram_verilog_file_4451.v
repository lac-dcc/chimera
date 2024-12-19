// Seed: 166593117
module module_0;
  reg id_1;
  initial
    if ((1)) begin : LABEL_0
      id_1 <= "";
    end else
      fork
        $display(1, 1);
        id_1 = 1 & {id_1{1}};
      join
  always id_1 = #1 1;
  wire id_4;
endmodule
macromodule module_1 (
    output uwire id_0,
    output uwire id_1,
    input tri id_2,
    output supply0 id_3,
    input uwire id_4,
    input tri id_5,
    input wor id_6,
    output wor id_7,
    input uwire id_8,
    output uwire id_9
);
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
  tri id_11 = id_2;
  initial id_9 = 1 ==? id_6;
  id_12 :
  assert property (@(posedge 1'b0) (id_4))
  else begin : LABEL_0
    id_11 = 1;
  end
  assign id_0 = 1;
endmodule
