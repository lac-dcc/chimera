// Seed: 1754319688
module module_0 (
    output wor id_0,
    input supply1 id_1,
    input supply0 id_2,
    input supply1 id_3,
    input tri id_4,
    input wand id_5,
    input tri1 id_6,
    output tri id_7,
    input wand id_8
);
  supply1 id_10;
  wand id_11 = (id_10 > id_6);
  assign module_1.type_1 = 0;
  id_12(
      .id_0({1, 1}), .id_1(1), .id_2(1)
  );
endmodule
module module_1 (
    input  tri  id_0,
    input  wire id_1,
    input  tri0 id_2,
    input  tri  id_3,
    input  wor  id_4,
    output tri1 id_5
);
  assign id_5 = id_1;
  tri0 id_7;
  assign id_7 = id_3;
  module_0 modCall_1 (
      id_7,
      id_1,
      id_7,
      id_2,
      id_3,
      id_0,
      id_1,
      id_5,
      id_2
  );
  assign id_7 = id_7 >= id_0;
  always @(posedge 1) begin : LABEL_0$display
    ;
  end
endmodule
