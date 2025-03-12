// Seed: 2611703491
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    output tri0 id_2,
    input tri id_3,
    input uwire id_4,
    output supply0 id_5,
    input supply1 id_6,
    input tri id_7,
    input wand id_8
);
  assign id_2 = id_7;
endmodule
module module_1 (
    input tri id_0,
    output logic id_1,
    output uwire id_2,
    input supply0 id_3,
    input tri0 id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_3,
      id_0,
      id_2,
      id_4,
      id_4,
      id_3
  );
  assign modCall_1.id_6 = 0;
  final begin : LABEL_0
    if (1) begin : LABEL_1
      id_1 <= 1'b0;
    end
  end
endmodule
