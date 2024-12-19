// Seed: 812473401
module module_0;
  wire id_2;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    output wire id_0,
    output tri id_1,
    output wor id_2,
    output tri id_3,
    input supply0 id_4,
    input tri1 id_5,
    input tri1 id_6
);
  integer id_8;
  final begin : LABEL_0
    id_0 = 1;
  end
  and primCall (id_0, id_4, id_5, id_6, id_8, id_9);
  wire id_9;
  module_0 modCall_1 ();
  logic [7:0] id_10;
  wire id_11;
  wire id_12;
  wire id_13;
  assign id_10[1] = 1 ? 1'd0 : 1'b0;
  id_14(
      .id_0(id_2), .id_1(1), .id_2((id_6)), .id_3(id_6), .id_4(id_8), .id_5(id_6), .id_6(id_10)
  );
endmodule
