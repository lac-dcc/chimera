// Seed: 251480157
module module_0 (
    input tri1 id_0,
    output tri id_1,
    input wand id_2,
    input wor id_3,
    output tri id_4,
    output supply1 id_5,
    output supply0 id_6
);
  reg id_8;
  assign module_1.id_2 = 0;
  supply1 id_9 = id_2;
  always @(posedge id_8) begin : LABEL_0
    if (id_0) id_8 <= 1;
  end
endmodule
module module_1 (
    output wire id_0,
    input supply0 id_1,
    input wor id_2
);
  assign id_0 = 1'b0;
  assign id_0 = id_2 & (1) == id_1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0
  );
endmodule
