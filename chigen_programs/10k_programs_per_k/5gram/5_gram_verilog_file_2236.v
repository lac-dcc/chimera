// Seed: 751001743
module module_0 (
    input wor id_0,
    output tri0 id_1,
    output supply1 id_2,
    output wand id_3,
    output tri0 id_4,
    input wand id_5,
    output tri0 id_6,
    input uwire id_7,
    input wire id_8,
    input tri1 module_0,
    input uwire id_10
);
  wire id_12;
endmodule
module module_1 (
    input tri1 id_0,
    input tri0 id_1,
    input tri0 id_2,
    inout supply1 id_3,
    output logic id_4,
    output tri0 id_5,
    input supply0 id_6,
    input tri id_7,
    inout uwire id_8,
    input tri1 id_9,
    input tri0 id_10,
    input wire id_11,
    input wire id_12,
    input wand id_13,
    output tri0 id_14,
    output supply0 id_15,
    input tri1 id_16,
    input wor id_17,
    input supply1 id_18,
    output wor id_19,
    input tri1 id_20,
    output supply1 id_21,
    input wand id_22,
    input tri1 id_23,
    input supply0 id_24,
    input wire id_25,
    input tri0 id_26,
    input tri1 id_27,
    output tri0 id_28,
    output wor id_29,
    input supply0 id_30,
    inout wire id_31,
    input wor id_32,
    output supply0 id_33,
    output supply1 id_34
);
  wire id_36;
  always #1 begin
    id_4 <= 1'b0;
  end
  wire id_37;
  nand (
      id_3,
      id_17,
      id_31,
      id_32,
      id_11,
      id_13,
      id_8,
      id_22,
      id_25,
      id_27,
      id_37,
      id_10,
      id_1,
      id_2,
      id_24,
      id_20,
      id_9
  );
  module_0(
      id_8, id_34, id_3, id_28, id_14, id_13, id_15, id_3, id_30, id_1, id_26
  );
endmodule
