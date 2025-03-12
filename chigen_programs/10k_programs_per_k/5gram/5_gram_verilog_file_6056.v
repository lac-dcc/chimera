// Seed: 113173567
module module_0 (
    input supply0 id_0,
    input supply0 id_1,
    output supply0 id_2,
    input wor id_3,
    output wire id_4,
    input tri1 id_5,
    output wor id_6,
    output tri1 id_7
);
  reg id_9;
  always @(id_0 or posedge id_9 && id_0 != 1'b0) begin : LABEL_0
    id_9 <= id_9;
  end
endmodule
module module_1 (
    output wor id_0,
    input  tri id_1
);
  parameter id_3 = -1;
  wire id_4 = ~id_4 - -1 ? id_3 : id_1;
  buf primCall (id_0, id_3);
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.id_2 = 0;
endmodule
