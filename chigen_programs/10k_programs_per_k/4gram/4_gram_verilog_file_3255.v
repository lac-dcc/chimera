// Seed: 2011734902
module module_0 (
    output uwire id_0,
    input wand id_1,
    input supply1 id_2,
    output tri1 id_3,
    output tri1 id_4,
    input tri0 id_5,
    output supply1 id_6,
    output wor id_7
    , id_11,
    input wire id_8,
    input wand id_9
);
  assign id_3 = id_2;
endmodule
module module_1 (
    output logic   id_0,
    input  supply1 id_1,
    output supply1 id_2
);
  initial begin : LABEL_0
    #(id_1);
  end
  initial begin : LABEL_0
    id_0 <= 1;
  end
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_1,
      id_1
  );
  assign modCall_1.id_2 = 0;
  wand id_4;
  assign id_4 = id_4 ? id_1 - 1 : 1;
  id_5(
      .id_0(1), .id_1(id_2), .id_2(1), .id_3(id_1 + 1'b0), .id_4(1'b0), .id_5(1'b0)
  );
  assign id_2 = 1;
endmodule
