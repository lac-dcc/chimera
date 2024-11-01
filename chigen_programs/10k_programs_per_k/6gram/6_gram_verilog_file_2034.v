// Seed: 1151257531
module module_0 (
    input tri0 id_0,
    input tri id_1,
    output tri id_2,
    input supply0 id_3,
    input uwire id_4,
    input tri id_5,
    input uwire id_6,
    input wor id_7,
    input wire id_8,
    output supply0 id_9,
    input tri0 id_10,
    input tri0 id_11,
    output tri1 id_12
    , id_39,
    output tri1 id_13,
    input tri1 id_14,
    output supply1 id_15,
    input wor id_16,
    output tri1 id_17,
    input uwire id_18,
    input supply1 id_19,
    input tri id_20
    , id_40,
    input supply1 id_21,
    input tri1 id_22,
    input tri id_23,
    input tri0 id_24,
    output wand id_25,
    input tri id_26,
    output tri id_27,
    output wire id_28,
    input wor id_29,
    input wor id_30,
    input tri1 id_31,
    input wire id_32,
    input wand id_33,
    input supply0 id_34,
    input tri0 id_35,
    input wire id_36,
    output uwire id_37
);
  always #(1'b0) #1;
  assign id_9 = 1'h0;
  wire id_41;
  wire id_42;
  wire id_43;
  id_44(
      .id_0(~id_37), .id_1(1), .id_2(id_6)
  );
endmodule
module module_1 (
    output logic id_0,
    input tri0 id_1,
    input wand id_2,
    input supply0 id_3,
    input tri0 id_4,
    input uwire id_5,
    output wand id_6,
    input tri1 id_7,
    input tri1 id_8,
    input wand id_9,
    input logic id_10,
    input wor id_11,
    output tri1 id_12,
    input wand id_13,
    input tri id_14,
    input wor id_15,
    output tri0 id_16,
    input tri0 id_17,
    output wor id_18
);
  module_0(
      id_4,
      id_13,
      id_6,
      id_5,
      id_1,
      id_3,
      id_4,
      id_9,
      id_2,
      id_18,
      id_14,
      id_17,
      id_18,
      id_6,
      id_4,
      id_16,
      id_4,
      id_12,
      id_11,
      id_8,
      id_14,
      id_3,
      id_5,
      id_5,
      id_2,
      id_16,
      id_13,
      id_16,
      id_18,
      id_13,
      id_5,
      id_2,
      id_8,
      id_1,
      id_8,
      id_2,
      id_8,
      id_18
  );
  assign id_6 = id_5;
  always @(negedge id_17) id_0 <= id_10;
endmodule
