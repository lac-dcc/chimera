// Seed: 3155921600
module module_0 (
    input wor id_0,
    input supply0 id_1,
    output wand id_2,
    output wor id_3,
    output tri0 id_4,
    input supply0 id_5,
    input tri id_6,
    output tri0 id_7
);
  initial $clog2(53);
  ;
endmodule
module module_1 (
    output tri0 id_0,
    inout tri id_1,
    output tri id_2,
    output logic id_3,
    input uwire id_4,
    input tri1 id_5,
    input supply1 id_6
);
  always @(posedge id_5 or -1) begin : LABEL_0
    id_3 <= 1'b0 ? 1 : id_6 == "";
  end
  module_0 modCall_1 (
      id_4,
      id_5,
      id_0,
      id_2,
      id_2,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_4 = 0;
endmodule
