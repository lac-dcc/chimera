// Seed: 4241542908
module module_0 (
    output tri1 id_0,
    output wire id_1,
    output wor id_2,
    output supply1 id_3,
    output wire id_4,
    input uwire id_5,
    input wire id_6,
    input tri0 id_7,
    input tri id_8,
    input supply0 id_9,
    output supply0 id_10,
    output supply0 id_11,
    output wor id_12
);
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input wire id_1,
    output wand id_2,
    output uwire id_3
);
  assign id_2 = 1;
  reg id_5;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_2,
      id_2,
      id_3
  );
  always @(posedge id_1) begin : LABEL_0
    fork
      id_5 <= 1;
    join
  end
  xor primCall (id_3, id_5, id_0, id_1);
  wire id_6;
  wire id_7;
endmodule
