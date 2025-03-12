// Seed: 960411823
module module_0 #(
    parameter id_4 = 32'd71
) (
    input tri id_0,
    input supply0 id_1,
    input uwire id_2
);
  wire _id_4;
  ;
  initial begin : LABEL_0
    $signed(24);
    ;
  end
  wire id_5;
  logic [id_4 : 1] id_6 = id_4;
  assign id_5 = id_0;
  logic
      id_7 = (id_2#(
          .id_0(-1),
          .id_5(1),
          .id_1(1),
          .id_6(-1),
          .id_7(1),
          .id_6(1),
          .id_1(1'b0),
          .id_6(1)
      )),
      id_8;
  assign module_1.id_3 = 0;
  wire id_9;
endmodule
module module_1 #(
    parameter id_0 = 32'd8
) (
    input wire _id_0,
    output wor id_1,
    output wor id_2,
    input supply1 id_3,
    input wor id_4,
    input uwire id_5,
    output wor id_6,
    input tri id_7
);
  wor [id_0 : -1] id_9;
  and primCall (id_6, id_5, id_7, id_4, id_3, id_9);
  assign id_9 = 1;
  module_0 modCall_1 (
      id_3,
      id_7,
      id_5
  );
endmodule
