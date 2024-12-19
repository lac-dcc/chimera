// Seed: 3216456694
module module_0 (
    output tri   id_0,
    input  tri1  id_1,
    output wand  id_2,
    output uwire id_3,
    input  wand  id_4,
    input  uwire id_5
);
  assign module_1.type_15 = 0;
endmodule
module module_1 (
    input tri id_0,
    input tri0 id_1,
    input wor id_2,
    output tri0 id_3,
    input tri0 id_4,
    output logic id_5,
    output tri0 id_6,
    input tri id_7,
    input supply1 id_8,
    input uwire id_9,
    input tri0 id_10,
    output wor id_11
);
  always @(posedge id_0 or posedge id_0 | id_2)
    @(negedge id_0 & 1'b0 & id_0) begin : LABEL_0
      if (id_1 < 1'h0) begin : LABEL_0
        id_5 <= 1;
      end
    end
  id_13(
      .id_0(1 && id_0), .id_1(), .id_2(id_11), .id_3(id_4)
  );
  module_0 modCall_1 (
      id_11,
      id_7,
      id_6,
      id_3,
      id_2,
      id_9
  );
endmodule
