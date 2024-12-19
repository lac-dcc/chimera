// Seed: 1644751901
module module_0 (
    input wor id_0,
    output supply1 id_1,
    input supply0 id_2,
    input wand id_3,
    input tri1 id_4,
    output tri0 id_5,
    input tri id_6,
    output tri0 id_7,
    input supply1 id_8,
    output tri1 id_9,
    output wor id_10
);
  id_12(
      .id_0(1), .id_1(1), .id_2(1), .id_3(1), .id_4(1)
  );
  wire id_13;
  wire id_14;
  wire id_15, id_16;
endmodule
module module_1 (
    output tri id_0,
    input supply0 id_1,
    input tri0 id_2,
    output wire id_3
    , id_6,
    output wor id_4
);
  logic [7:0] id_7;
  supply1 id_8;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1,
      id_1,
      id_1,
      id_4,
      id_1,
      id_3,
      id_8,
      id_3,
      id_0
  );
  assign modCall_1.id_7 = 0;
  always @(posedge 1'd0) begin : LABEL_0
    id_7[1] = id_1;
    if (id_1 ~^ 1)
      if (id_6) id_8 = id_2;
      else begin : LABEL_0$display
        ;
      end
  end
endmodule
