// Seed: 4192702562
module module_0 (
    input supply0 id_0,
    output tri0 id_1,
    input wand id_2,
    input wor id_3,
    output tri0 id_4,
    output supply1 id_5,
    input tri id_6,
    input tri1 id_7,
    input wire id_8,
    input wire id_9,
    input tri0 id_10,
    input tri1 id_11,
    output uwire id_12,
    output tri0 id_13,
    output tri1 id_14
);
  wire id_16;
  assign id_4 = {~(1) == id_9{1}} == 1 ? 1 : id_2;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output wor id_0,
    input supply1 id_1,
    input tri0 id_2
    , id_8,
    input uwire id_3,
    output wand id_4,
    output tri1 id_5,
    output wire id_6
);
  assign id_0 = id_1;
  assign id_4 = 1 ? 1 : 1'b0;
  assign id_8 = id_8;
  always @(negedge id_1) begin : LABEL_0
    id_8 <= 1;
  end
  module_0 modCall_1 (
      id_2,
      id_5,
      id_3,
      id_1,
      id_6,
      id_4,
      id_1,
      id_2,
      id_3,
      id_3,
      id_3,
      id_2,
      id_5,
      id_6,
      id_4
  );
endmodule
