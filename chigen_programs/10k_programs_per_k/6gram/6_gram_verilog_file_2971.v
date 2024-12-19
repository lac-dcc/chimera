// Seed: 4237483711
module module_0 (
    output supply1 id_0,
    input supply1 id_1,
    input tri id_2,
    output uwire id_3
);
  assign id_0 = id_2 == 1;
  always @(posedge id_2 or posedge id_1) begin : LABEL_0
    if (id_1) id_0 = id_2;
    else begin : LABEL_0
      id_0 = 1 + id_1;
    end
  end
endmodule
module module_1 (
    output supply1 id_0,
    input tri1 id_1,
    output wor id_2,
    input wand id_3,
    input tri0 id_4,
    input uwire id_5,
    input wire id_6,
    input tri0 id_7,
    input uwire id_8,
    output wand id_9
);
  wire id_11;
  xnor primCall (id_9, id_7, id_8, id_1, id_11, id_3, id_4, id_6, id_5);
  module_0 modCall_1 (
      id_2,
      id_7,
      id_1,
      id_9
  );
  assign modCall_1.id_3 = 0;
endmodule
