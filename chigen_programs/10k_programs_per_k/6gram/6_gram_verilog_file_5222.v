// Seed: 3616398834
module module_0 (
    input uwire id_0,
    input wand id_1,
    input tri1 id_2,
    input tri0 id_3,
    output wor id_4,
    output supply1 id_5
);
  wire id_7 = id_7, id_8;
endmodule
module module_1 (
    input tri0 id_0,
    output tri1 id_1,
    input tri1 id_2,
    output uwire id_3,
    input tri0 id_4,
    input wire id_5,
    input wire id_6,
    input tri id_7,
    output logic id_8,
    input tri0 id_9,
    input supply1 id_10,
    output tri0 id_11
);
  assign id_3 = id_2;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_9,
      id_5,
      id_1,
      id_11
  );
  assign modCall_1.id_0 = 0;
  assign id_8 = 1;
  always @(posedge 1 or posedge id_7) begin : LABEL_0
    id_8 <= 1;
  end
endmodule
