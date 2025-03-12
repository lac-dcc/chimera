// Seed: 3823685817
module module_0 (
    input supply0 id_0,
    output logic id_1,
    output tri id_2,
    output tri id_3,
    input supply0 id_4,
    output supply0 id_5,
    input tri1 id_6,
    output tri1 id_7
);
  always @(posedge id_6) id_1 = id_0;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input  supply0 id_0,
    output logic   id_1,
    output supply1 id_2
);
  logic id_4;
  assign id_4 = id_0;
  wire [1 : -1] id_5;
  assign id_5 = id_0;
  initial begin : LABEL_0
    id_4 = -1;
    #1;
    id_1 <= 1;
  end
  module_0 modCall_1 (
      id_0,
      id_1,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0,
      id_2
  );
endmodule
