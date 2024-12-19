// Seed: 1506639580
module module_0 ();
  always_ff @(posedge id_1 or posedge id_1) begin : LABEL_0
    #1 begin : LABEL_0
      id_1 = 1'h0;
      id_1 <= 1;
      if (id_1) begin : LABEL_0
        id_1 = 1;
      end
    end
  end
  assign id_1 = 1;
endmodule
macromodule module_1 (
    output tri1  id_0,
    input  wor   id_1,
    input  tri0  id_2,
    input  uwire id_3
);
  id_5 :
  assert property (@(posedge ~id_2) id_2)
  else id_5 = 1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_6;
  wire id_7;
  assign id_0 = 1'b0;
endmodule
