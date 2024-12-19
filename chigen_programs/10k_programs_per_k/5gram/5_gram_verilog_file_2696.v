// Seed: 1903119957
module module_0 (
    output tri id_0,
    input wand id_1,
    output wand id_2,
    output supply0 id_3,
    output wor id_4,
    output tri id_5,
    output wor id_6,
    input uwire id_7,
    output tri id_8,
    input supply1 id_9,
    output supply0 id_10,
    input wand id_11,
    output wand id_12,
    output wand id_13
    , id_16,
    input wire id_14
);
  wire id_17, id_18;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output logic id_0,
    input supply1 id_1,
    output supply0 id_2,
    output supply1 id_3,
    output wand id_4,
    output supply1 id_5,
    input supply0 id_6,
    input tri id_7,
    output wor id_8,
    input tri1 id_9,
    output tri id_10
);
  assign id_2 = 'b0;
  reg id_12;
  module_0 modCall_1 (
      id_10,
      id_1,
      id_8,
      id_5,
      id_2,
      id_5,
      id_5,
      id_7,
      id_5,
      id_7,
      id_2,
      id_1,
      id_5,
      id_3,
      id_1
  );
  initial begin : LABEL_0
    id_8 = 1'b0;
    id_0 <= id_12 == 1'd0;
    id_0 <= id_12;
  end
endmodule
