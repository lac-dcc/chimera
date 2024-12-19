// Seed: 943576789
module module_0 (
    input tri0 id_0,
    output uwire id_1,
    input wor id_2,
    input wand id_3,
    output wand id_4,
    input supply0 id_5,
    input tri1 id_6,
    input wor id_7,
    input uwire id_8,
    output wor id_9,
    input supply1 id_10,
    output wor id_11,
    output wor id_12
);
  wire id_14;
  assign id_1  = 1;
  assign id_14 = 1;
  wire id_15;
  assign id_9 = 'b0;
endmodule
module module_1 (
    input tri0 id_0,
    output logic id_1,
    output wire id_2,
    input wire id_3,
    input wand id_4,
    input tri0 id_5,
    output tri id_6,
    input wire id_7,
    output wire id_8,
    output tri1 id_9,
    output supply0 id_10,
    output supply1 id_11
);
  initial begin : LABEL_0
    wait (id_4 - 1);
    $display(1, 1, id_5, id_7);
    id_1 <= 1'b0;
  end
  module_0 modCall_1 (
      id_5,
      id_10,
      id_4,
      id_5,
      id_6,
      id_5,
      id_5,
      id_7,
      id_5,
      id_8,
      id_0,
      id_10,
      id_2
  );
  assign modCall_1.id_6 = 0;
endmodule
