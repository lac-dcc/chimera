// Seed: 4073562364
module module_0 (
    output wand id_0,
    input tri1 id_1,
    output uwire id_2,
    input tri0 id_3,
    input tri1 id_4,
    input wor id_5,
    input supply1 id_6,
    input tri1 id_7,
    input uwire id_8,
    output supply1 id_9[-1 : -1  ==  1 'h0],
    output wand id_10,
    output tri id_11,
    input wor id_12
);
  task id_14;
    id_14 <= -1;
    begin : LABEL_0
      $clog2(85);
      ;
    end
  endtask
  assign id_14 = id_3 | id_1 - -1 + 1'b0;
  assign id_11 = 1'b0;
  logic id_15;
  assign id_11 = 1;
endmodule
module module_1 (
    output wire id_0,
    input tri0 id_1,
    output wand id_2,
    output wand id_3,
    input wire id_4,
    output tri0 id_5,
    input tri0 id_6,
    input supply0 id_7,
    input tri1 id_8,
    input tri0 id_9,
    input wand id_10,
    input tri0 id_11,
    input tri id_12,
    input wire id_13,
    input tri id_14,
    output tri0 id_15,
    output uwire id_16
);
  assign id_16 = -1'b0;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_3,
      id_12,
      id_1,
      id_4,
      id_8,
      id_12,
      id_8,
      id_15,
      id_16,
      id_2,
      id_10
  );
  assign modCall_1.id_8 = 0;
endmodule
