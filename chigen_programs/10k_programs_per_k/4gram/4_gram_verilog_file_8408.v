// Seed: 146077495
module module_0 (
    input supply0 id_0,
    input wire id_1,
    input uwire id_2,
    input tri id_3
);
  assign id_5[1] = id_1;
  reg id_6;
  always @(posedge id_6) id_6 <= 1;
endmodule
module module_1 (
    input wand id_0,
    output uwire id_1,
    output supply0 id_2,
    input supply0 id_3,
    input supply1 id_4
);
  final begin : LABEL_0
    fork
      #id_6;
    join
  end
  always @(*) begin : LABEL_0
    id_1 = 1'b0;
    wait (1);
  end
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_3
  );
  assign modCall_1.type_3 = 0;
  wire id_7;
endmodule
