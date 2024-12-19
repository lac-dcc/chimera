// Seed: 1948237726
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    output uwire id_2,
    input tri0 id_3,
    input wire id_4,
    input tri1 id_5,
    input uwire id_6,
    input wand id_7,
    input wire id_8,
    output wand id_9,
    output supply1 id_10,
    output tri1 id_11,
    input supply1 id_12,
    output supply0 id_13,
    input wand id_14,
    output supply0 id_15,
    input tri0 id_16
    , id_19,
    output supply1 id_17
);
  wire id_20;
  tri0 id_21;
  assign id_11 = 1'b0 - 1;
  assign id_21 = id_4;
endmodule
module module_1 (
    input supply1 id_0,
    output tri0 id_1,
    output supply0 id_2,
    input tri0 id_3,
    input wire id_4,
    output wor id_5,
    output tri id_6,
    output wire id_7,
    output logic id_8,
    input tri1 id_9,
    input tri1 id_10,
    input supply1 id_11,
    input supply0 id_12,
    input wand id_13
);
  tri1 id_15;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_7,
      id_4,
      id_9,
      id_4,
      id_0,
      id_4,
      id_4,
      id_5,
      id_1,
      id_7,
      id_10,
      id_6,
      id_4,
      id_1,
      id_4,
      id_7
  );
  assign modCall_1.id_12 = 0;
  always @* begin : LABEL_0
    id_8 <= 1;
    $display(id_10, 1, 1'b0, id_0, id_13, id_0, .id_16(id_15), 1 > 1);
    deassign id_15;
  end
endmodule
