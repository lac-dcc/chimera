// Seed: 256654629
module module_0 ();
  supply1 id_1, id_2;
  generate
    for (id_3 = -1; -1 == 1; ++id_1) begin : LABEL_0
      assign id_2 = id_1;
    end
  endgenerate
  wand id_4, id_5 = 1;
endmodule
module module_1 ();
  initial begin : LABEL_0
    disable id_1#(.id_2(1));
  end
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wand id_3 = 1'b0;
  wire id_4;
endmodule
module module_2 (
    input tri  id_0,
    input wire id_1,
    input wor  id_2
);
  wire id_4;
  wire [1 : -1] id_5;
  id_6 :
  assert property (@(posedge id_6++) -1'b0)
  else $clog2(0);
  ;
  assign id_6 = id_6;
  module_0 modCall_1 ();
endmodule
