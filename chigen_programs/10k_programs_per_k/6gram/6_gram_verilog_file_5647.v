// Seed: 3895824689
module module_0 (
    input wire id_0,
    input tri0 id_1,
    input supply1 id_2,
    input wand id_3,
    input supply0 id_4,
    input wand id_5,
    input tri id_6,
    input tri1 id_7,
    input wor id_8,
    output supply0 id_9,
    output supply1 id_10,
    output tri0 id_11,
    output tri0 id_12,
    output tri1 id_13,
    output tri0 id_14,
    input tri id_15,
    output tri id_16,
    input uwire id_17,
    input wire id_18,
    input supply1 id_19,
    output tri1 id_20,
    output wire id_21,
    output wire id_22,
    input supply1 id_23,
    input tri id_24,
    output tri id_25
);
  always disable id_27;
endmodule
module module_1 (
    input supply0 id_0,
    output supply1 id_1,
    output wand id_2,
    input supply1 id_3,
    input wor id_4,
    output wire id_5,
    input tri id_6,
    input uwire id_7,
    input wand id_8,
    input uwire id_9,
    output wor id_10,
    output wor id_11,
    input uwire id_12,
    input uwire id_13,
    input supply0 id_14,
    input supply1 id_15,
    input tri id_16,
    input wor id_17,
    input tri1 id_18
);
  wire id_20;
  assign id_11 = id_12;
  id_21(
      .id_0(),
      .id_1(1),
      .id_2(1),
      .id_3(id_6),
      .id_4(1),
      .id_5(1),
      .id_6({id_16{1}}),
      .id_7(1'd0),
      .id_8(id_7),
      .id_9(1)
  );
  wire id_22;
  module_0(
      id_9,
      id_16,
      id_8,
      id_4,
      id_9,
      id_0,
      id_4,
      id_12,
      id_17,
      id_11,
      id_5,
      id_1,
      id_10,
      id_5,
      id_11,
      id_15,
      id_2,
      id_8,
      id_16,
      id_18,
      id_5,
      id_5,
      id_10,
      id_18,
      id_16,
      id_1
  );
  assign id_1 = id_12;
  specify
    specparam id_23 = 1'b0;
  endspecify
endmodule
