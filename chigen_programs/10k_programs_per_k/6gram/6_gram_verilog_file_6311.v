// Seed: 401277813
module module_0 (
    output logic id_0,
    input tri id_1,
    output uwire id_2,
    input supply0 id_3,
    input supply1 id_4,
    input tri id_5,
    input uwire id_6,
    input tri1 id_7,
    output logic id_8,
    input supply0 id_9,
    output supply1 id_10,
    input tri0 id_11,
    input wand id_12,
    output tri id_13
);
  always @(posedge -1) begin : LABEL_0
    id_0 = -1;
    id_0 <= id_11;
    id_8 <= id_7;
  end
endmodule
module module_1 (
    output supply0 id_0,
    input wire id_1,
    output logic id_2
);
  logic id_4;
  ;
  always @(posedge id_4 & -1 or posedge id_1 << -1) begin : LABEL_0
    id_2 <= id_1;
  end
  module_0 modCall_1 (
      id_2,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
