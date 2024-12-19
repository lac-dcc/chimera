// Seed: 44746664
module module_0 (
    input tri1 id_0,
    output wor id_1,
    output tri id_2,
    output wand id_3,
    input supply1 id_4,
    output wand id_5
);
  assign id_5 = 1 == id_0;
  wire id_7;
  wire id_8 = 1;
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    inout tri0 id_2,
    output wor id_3,
    input tri0 id_4,
    input supply1 id_5,
    output wor id_6,
    output supply1 id_7
);
  wire id_9 = 1;
  wire id_10;
  module_0 modCall_1 (
      id_1,
      id_7,
      id_7,
      id_6,
      id_4,
      id_7
  );
  assign modCall_1.id_4 = 0;
  always @(posedge id_4 or posedge 1'b0) begin : LABEL_0
  end
endmodule
