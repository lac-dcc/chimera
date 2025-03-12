// Seed: 4079519660
module module_0 (
    input uwire id_0,
    input wor id_1,
    output tri id_2,
    input uwire id_3,
    output wand id_4,
    input tri0 id_5,
    output wor id_6,
    input supply1 id_7,
    output wor id_8,
    input supply0 id_9,
    input tri id_10
);
  assign id_6 = id_5;
endmodule
module module_1 #(
    parameter id_0 = 32'd14,
    parameter id_4 = 32'd71
) (
    input wire _id_0,
    input supply1 id_1,
    input wor id_2,
    output logic id_3,
    output tri _id_4,
    input wand id_5,
    output tri0 id_6
);
  wire id_8;
  assign id_3 = 1;
  struct packed {
    id_9 id_10;
    logic id_11;
    logic [1 : 1] id_12;
    logic [1 'h0 : 1] id_13;
    logic [-1 'b0 : id_4] id_14;
  } [1 : id_0] id_15;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_6,
      id_2,
      id_6,
      id_2,
      id_6,
      id_5,
      id_6,
      id_5,
      id_2
  );
  assign modCall_1.id_7 = 0;
  wire  id_16;
  wire  id_17;
  logic id_18;
  ;
  assign id_15.id_9 = 1;
  id_19(
      1'b0, id_5, id_2
  );
  always id_3 = -1;
endmodule
