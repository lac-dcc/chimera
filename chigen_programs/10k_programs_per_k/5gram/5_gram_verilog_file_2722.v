// Seed: 1153608966
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    output wire id_2,
    output tri id_3,
    input tri id_4,
    input uwire id_5,
    input supply0 id_6,
    output wand id_7,
    input tri1 id_8,
    input wand id_9,
    input wor id_10,
    output supply0 id_11,
    input tri id_12,
    input tri0 id_13,
    output uwire id_14,
    input wire id_15,
    input wand id_16,
    input wand id_17,
    input tri0 id_18
);
  assign id_11 = 1;
endmodule
module module_0 (
    input supply1 id_0,
    output tri id_1,
    output logic id_2,
    input wor id_3,
    input tri1 id_4,
    output supply0 module_1,
    input supply1 id_6,
    input wand id_7
);
  wire id_9;
  id_10(
      .id_0(id_1), .id_1(id_4), .id_2(id_5), .id_3(1)
  );
  module_0 modCall_1 (
      id_0,
      id_4,
      id_1,
      id_1,
      id_4,
      id_4,
      id_6,
      id_1,
      id_0,
      id_0,
      id_3,
      id_1,
      id_4,
      id_6,
      id_1,
      id_0,
      id_7,
      id_3,
      id_3
  );
  assign modCall_1.id_5 = 0;
  supply1 id_11;
  wire id_12;
  always @(negedge 1) begin : LABEL_0
    id_2 <= 1;
    $display;
  end
  wire id_13;
  id_14(
      .id_0(id_13), .id_1(id_11 | id_4)
  );
endmodule
