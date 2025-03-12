// Seed: 3358483490
module module_0 (
    input supply1 id_0,
    input tri0 id_1,
    input supply0 id_2,
    input supply1 id_3,
    input tri1 id_4,
    input tri id_5,
    output tri0 id_6,
    input supply0 id_7,
    output wire id_8
);
  always disable id_10;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    inout wand id_2,
    input wand id_3,
    output uwire id_4
);
  parameter id_6 = ~1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_0,
      id_3,
      id_4,
      id_3,
      id_2
  );
  bit id_7;
  assign id_2 = id_0 ? -1 : id_1;
  always @(posedge -1'b0) begin : LABEL_0
    if (id_6) id_7 <= -1;
  end
endmodule
