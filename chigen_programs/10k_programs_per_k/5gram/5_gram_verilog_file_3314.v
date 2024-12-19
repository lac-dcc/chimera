// Seed: 1168886684
module module_0 (
    output tri id_0,
    input supply0 id_1,
    output wor id_2,
    input tri0 id_3,
    input supply1 id_4,
    input supply0 id_5,
    output wire id_6
);
  assign id_0 = !id_1;
  assign id_0 = 1;
  wire id_8;
  wire id_9;
  always @(posedge 1 or 1'b0) begin : LABEL_0
    wait (~id_5 - id_4);
  end
endmodule
module module_1 (
    input wor id_0,
    output wire id_1,
    output wand id_2,
    input supply0 id_3,
    input supply1 id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_3,
      id_0,
      id_3,
      id_1
  );
endmodule
