// Seed: 3909174007
module module_0 (
    input supply0 id_0,
    input uwire id_1,
    input tri id_2,
    input wand id_3,
    output wire id_4,
    input tri0 id_5,
    input uwire id_6,
    input tri0 id_7,
    input wor id_8,
    input tri0 id_9,
    input uwire id_10
    , id_17,
    input wand id_11,
    output tri1 id_12,
    input tri0 id_13,
    input supply0 id_14,
    output tri1 id_15
);
  wire id_18;
  assign id_12 = id_0;
  wire id_19;
  id_20(
      .id_0(1), .id_1(id_18), .id_2(id_8), .id_3(1), .id_4(id_10)
  );
  tri id_21 = 1;
  wire id_22, id_23, id_24, id_25, id_26, id_27;
  wire id_28;
  id_29(
      .id_0(id_28), .id_1(1), .id_2(1)
  );
endmodule
module module_1 (
    input supply1 id_0,
    output tri1 id_1,
    input uwire id_2,
    output logic id_3,
    input tri1 id_4,
    input supply0 id_5,
    input supply1 id_6,
    output supply0 id_7,
    input supply1 id_8,
    input tri0 id_9,
    output supply0 id_10
    , id_13,
    input wire id_11
);
  always @(id_9) begin : LABEL_0
    id_3 = #1 1;
  end
  module_0 modCall_1 (
      id_11,
      id_5,
      id_8,
      id_5,
      id_1,
      id_9,
      id_9,
      id_9,
      id_6,
      id_8,
      id_5,
      id_0,
      id_1,
      id_8,
      id_8,
      id_7
  );
endmodule
