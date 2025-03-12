// Seed: 3345639022
module module_0;
endmodule
module module_1 #(
    parameter id_0 = 32'd2
) (
    input supply0 _id_0,
    input uwire id_1,
    input supply0 id_2,
    input supply1 id_3,
    input tri0 id_4,
    output logic id_5,
    output tri0 id_6
);
  logic [id_0 : -1] id_8;
  final begin : LABEL_0
    if (-1) id_8 <= id_2;
    id_5 <= 1'b0;
  end
  id_9 :
  assert property (@(posedge id_1) id_8)
  else id_5 = id_1 == 1'd0;
  module_0 modCall_1 ();
  tri0 id_10 = -1;
endmodule
