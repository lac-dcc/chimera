// Seed: 531769611
module module_0 (
    input tri0 id_0,
    input wor id_1,
    output wor id_2,
    input supply1 id_3,
    input wand id_4,
    input wor id_5,
    input wor id_6,
    output tri0 id_7
);
  assign id_7 = 1 && id_4 && id_4;
  reg id_9;
  assign id_2 = 1;
  wire id_10;
  always @(*) if (id_9) id_9 <= id_9;
  always @($display);
  supply1 id_11;
  assign id_7 = id_11;
  wire id_12, id_13 = id_5;
endmodule
module module_1 (
    input tri id_0,
    input supply0 id_1,
    input tri0 id_2,
    output logic id_3,
    input tri0 id_4,
    input tri0 id_5,
    output wire id_6,
    input logic id_7,
    output wor id_8,
    input wor id_9
);
  wire id_11;
  always @(posedge 1) id_3 <= id_7;
  assign id_3 = ~id_4 < 1;
  always @(*) begin : LABEL_0
    id_8 = id_5;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_8,
      id_9,
      id_9,
      id_1,
      id_4,
      id_8
  );
  assign modCall_1.id_1 = 0;
endmodule
