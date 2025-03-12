// Seed: 1305443265
module module_0;
  tri1 id_1;
  struct packed {
    logic id_2;
    logic id_3;
    logic id_4;
  } id_5;
  ;
  always @* id_5.id_2 = id_5.id_4;
  generate
    assign id_1 = 1;
  endgenerate
endmodule
module module_1 (
    inout  uwire id_0,
    input  wire  id_1,
    input  wand  id_2,
    input  wire  id_3,
    output wire  id_4,
    input  uwire id_5,
    inout  tri1  id_6
);
  module_0 modCall_1 ();
  id_8 :
  assert property (@(posedge 1) id_1 == -1) begin : LABEL_0
    logic id_9 = 1;
  end
  wire id_10;
  nor primCall (id_0, id_1, id_2, id_3, id_5, id_6);
  assign id_0 = id_1;
endmodule
