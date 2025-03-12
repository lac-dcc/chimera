// Seed: 1361578831
module module_0;
  wire id_1;
endmodule
module module_1 #(
    parameter id_3 = 32'd37
) (
    input supply1 id_0,
    input tri0 id_1,
    input wand id_2,
    output wire _id_3
);
  logic [-1 : id_3  &  1] id_5;
  assign id_3 = id_5;
  module_0 modCall_1 ();
endmodule
module module_2 (
    input  uwire id_0,
    output wire  id_1,
    input  wand  id_2,
    output uwire id_3
);
  wire id_5;
  wire id_6;
  and primCall (id_1, id_2, id_5, id_6);
  always @(posedge id_6) begin : LABEL_0
    force id_3 = id_6;
  end
  module_0 modCall_1 ();
endmodule
