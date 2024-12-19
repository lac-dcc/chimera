// Seed: 1855432874
module module_0 (
    input wire id_0,
    output wand id_1,
    input tri0 id_2,
    input wor id_3,
    output tri0 id_4,
    output supply1 id_5
);
  assign id_5 = id_0;
endmodule
module module_1 (
    output wor id_0,
    output supply1 id_1,
    output tri1 id_2,
    output wor id_3,
    output tri0 id_4,
    output wor id_5,
    input wand id_6,
    input supply1 id_7,
    output wor id_8,
    output supply1 id_9,
    output tri0 id_10,
    input wor id_11,
    input uwire id_12,
    input tri0 id_13,
    input wire id_14,
    output wire id_15,
    output uwire id_16,
    input tri id_17,
    output wor id_18,
    input wor id_19,
    input uwire id_20,
    output wire id_21,
    input tri id_22,
    input tri id_23,
    input wand id_24,
    input wire id_25,
    input tri1 id_26,
    input tri0 id_27,
    input wire id_28,
    output tri id_29,
    output logic id_30
);
  wire id_32;
  reg  id_33;
  module_0 modCall_1 (
      id_6,
      id_29,
      id_7,
      id_27,
      id_9,
      id_10
  );
  assign modCall_1.type_1 = 0;
  assign id_5 = id_23 | 1;
  wire id_34;
  wire id_35;
  initial begin : LABEL_0
    id_33 <= #1 1;
  end
  wire id_36, id_37;
  id_38(
      .id_0(id_8), .id_1(id_35), .id_2(), .id_3(id_7), .id_4(1)
  );
  wire id_39 = id_24;
  or primCall (
      id_10,
      id_17,
      id_22,
      id_28,
      id_25,
      id_24,
      id_11,
      id_26,
      id_27,
      id_14,
      id_32,
      id_13,
      id_33,
      id_6,
      id_12,
      id_19,
      id_7,
      id_20,
      id_23
  );
  wire id_40;
  wire id_41;
  always id_30#1 = #1 1;
  wire id_42;
endmodule
