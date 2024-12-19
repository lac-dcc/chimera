// Seed: 4022237788
module module_0 (
    input  tri1  id_0,
    input  uwire id_1,
    output wire  id_2
);
  logic [7:0] id_4;
  assign id_4[1'b0] = 1'h0;
endmodule
module module_1 (
    output logic   id_0,
    output supply1 id_1
);
  supply1 id_4;
  assign id_1 = id_4;
  integer id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_1
  );
  assign modCall_1.id_2 = 0;
  id_6(
      id_6, 1, 1, id_3 == id_6
  ); id_7 :
  assert property (@(negedge id_6 && "" or posedge id_5) 1) begin : LABEL_0
    #1 #0 $display;
    id_0 <= id_3;
  end
endmodule
