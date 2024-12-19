// Seed: 809128196
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input tri id_3
);
  wire id_5;
  module_2 modCall_1 (
      id_3,
      id_3
  );
  assign modCall_1.type_5 = 0;
endmodule
module module_1 (
    input wand id_0,
    input tri id_1,
    output supply1 id_2,
    output wand id_3
);
  always @(*) begin : LABEL_0
    id_3 = id_0;
  end
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.type_1 = 0;
  wire id_5;
endmodule
module module_2 (
    input tri   id_0,
    input uwire id_1
);
  id_3 :
  assert property (@(posedge id_0) id_3)
  else $display(1, 1'b0);
  id_4(
      .id_0(id_1), .id_1(1), .id_2(id_3), .id_3(id_0), .id_4(id_1)
  );
endmodule
