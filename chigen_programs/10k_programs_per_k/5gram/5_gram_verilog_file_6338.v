// Seed: 1896230619
module module_0 (
    input  tri0  id_0,
    output tri0  id_1,
    input  tri0  id_2,
    output wand  id_3,
    input  uwire id_4,
    input  wire  id_5,
    input  tri   id_6
);
  wire id_8, id_9;
endmodule
module module_1 (
    input supply1 id_0,
    output tri1 id_1,
    input supply0 id_2,
    output wand id_3,
    input tri id_4,
    input uwire id_5,
    output supply0 id_6,
    input wand id_7,
    output logic id_8,
    output tri1 id_9,
    input tri0 id_10
);
  assign id_6 = -1 ? 1 : 1 * -1;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_7,
      id_9,
      id_7,
      id_2,
      id_10
  );
  assign modCall_1.id_1 = 0;
  id_12 :
  assert property (@(posedge 1 == id_0) id_2)
  else $clog2(62);
  ;
  always @(-1'b0 or posedge -1'b0) begin : LABEL_0
    id_8 = $signed(32);
    ;
  end
endmodule
