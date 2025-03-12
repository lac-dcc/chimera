// Seed: 3769765278
module module_0 (
    input supply1 id_0,
    output uwire id_1,
    input tri id_2,
    input uwire id_3,
    input wand id_4,
    output tri1 id_5,
    input tri1 id_6,
    output supply0 id_7
);
  logic id_9;
  ;
  assign module_1.id_10 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    input supply1 id_1,
    input tri id_2,
    input tri id_3,
    output supply0 id_4,
    input uwire id_5,
    output logic id_6,
    input wor id_7
);
  parameter id_9 = 1;
  logic id_10 = -1;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_1,
      id_5,
      id_0,
      id_1,
      id_4
  );
  always @(posedge 1 or posedge id_9) begin : LABEL_0
    id_6 = id_1 == 1;
  end
endmodule
