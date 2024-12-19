// Seed: 743374042
module module_0 (
    input wor id_0,
    output wor id_1,
    input wand id_2,
    output supply1 id_3,
    output wor id_4,
    input supply1 id_5,
    input tri0 void id_6,
    output uwire id_7,
    output supply1 id_8,
    output tri1 id_9,
    output wor id_10,
    input tri0 id_11,
    output uwire id_12,
    output tri id_13,
    output wor id_14,
    input wor id_15
);
  assign id_10 = id_11.id_6;
  assign module_1.id_7 = 0;
  wire id_17;
  id_18(
      id_9, ~id_10, id_7, id_7 - 1, id_0, 1, 1, 1'h0
  );
  assign id_3 = 1;
endmodule
module module_1 (
    output logic id_0,
    input wand id_1,
    input wor id_2,
    input supply1 id_3,
    input uwire id_4,
    input supply0 id_5,
    output tri0 id_6,
    output wand id_7,
    input supply0 id_8,
    input wire id_9,
    input wand id_10,
    output tri1 id_11,
    output uwire id_12,
    output uwire id_13,
    input wand id_14,
    input tri0 id_15,
    output tri1 id_16
);
  always begin : LABEL_0
    wait (id_15 - 1 == 1 * id_2) id_13 = id_5;
  end
  always id_16 = 1;
  initial id_0 <= id_15 - (1'b0);
  module_0 modCall_1 (
      id_4,
      id_11,
      id_3,
      id_16,
      id_13,
      id_5,
      id_8,
      id_12,
      id_16,
      id_7,
      id_16,
      id_9,
      id_11,
      id_12,
      id_7,
      id_2
  );
  assign id_13 = 1;
  id_18(
      id_8, id_15, 1'd0 - 1, id_1
  );
endmodule
