// Seed: 3654280992
module module_0 (
    input wire id_0,
    output supply0 id_1,
    input supply0 id_2,
    input tri id_3,
    output supply1 id_4,
    output supply0 id_5,
    input tri id_6,
    input wand id_7,
    input tri id_8,
    input tri0 id_9,
    output supply1 id_10
);
  parameter id_12 = 1;
  assign id_4 = id_7 - 1 + id_12#(.id_12(-1));
  always @(1 or posedge 1) begin : LABEL_0
    deassign id_1;
  end
endmodule
module module_1 (
    output tri0 id_0,
    output uwire id_1,
    output uwire id_2,
    input tri1 id_3,
    input tri0 id_4,
    output supply0 id_5
);
  assign id_5 = id_3;
  assign id_1 = 1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_3,
      id_3,
      id_0,
      id_2,
      id_4,
      id_4,
      id_3,
      id_3,
      id_5
  );
  assign modCall_1.id_9 = 0;
endmodule
