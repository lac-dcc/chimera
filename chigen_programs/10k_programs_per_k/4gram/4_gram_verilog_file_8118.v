// Seed: 682910637
module module_0 (
    input wand id_0,
    output supply0 id_1,
    input wor id_2,
    input wire id_3,
    input wire id_4
);
  assign id_1 = id_3;
  genvar id_6;
  always @(1) $display(id_2);
  wire id_7;
  wire id_8;
  assign id_6 = id_0 ? id_6 : id_7;
  wand id_9 = 1;
endmodule
module module_1 (
    input tri1 id_0,
    output supply0 id_1,
    output wand id_2,
    output supply1 id_3,
    output tri1 id_4,
    input wor id_5,
    input supply1 id_6,
    input supply0 id_7,
    output wire id_8,
    input tri0 id_9
);
  wire id_11;
  always @(*) begin : LABEL_0
    wait (1);
    disable id_12;
  end
  tri1 id_13 = 1 - id_6;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_6,
      id_5,
      id_9
  );
  assign modCall_1.id_1 = 0;
endmodule
