// Seed: 1764933210
module module_0 (
    input tri0 id_0,
    output tri1 id_1
    , id_6,
    input supply1 id_2,
    input tri1 id_3,
    output wor id_4
);
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    output supply1 id_1,
    input tri1 id_2,
    input wand id_3,
    output tri1 id_4,
    output logic id_5,
    input wire id_6,
    input tri0 id_7,
    output tri1 id_8,
    output tri0 id_9
);
  always @(posedge id_0 or posedge (id_7)) begin : LABEL_0
    wait (1);
  end
  assign id_4 = -1;
  module_0 modCall_1 (
      id_2,
      id_8,
      id_6,
      id_7,
      id_9
  );
  always @(posedge id_3) id_5 = (-1);
endmodule
