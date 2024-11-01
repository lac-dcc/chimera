// Seed: 1011448705
module module_0 (
    output wor id_0,
    output supply1 id_1,
    input supply1 id_2,
    input tri0 id_3,
    output wor id_4,
    input tri0 id_5,
    output wire id_6
);
  assign id_1 = "" - {id_2{1}} ? id_2 : id_2;
endmodule
module module_1 (
    input supply0 id_0,
    input tri1 id_1,
    output supply0 id_2,
    output supply1 id_3,
    input supply1 id_4,
    output wand id_5,
    input wire id_6,
    output tri0 id_7,
    input uwire id_8,
    input wand id_9,
    output tri0 id_10,
    input wire id_11,
    input tri1 id_12,
    input uwire id_13,
    output supply0 id_14,
    output uwire id_15,
    input supply0 id_16,
    input uwire id_17,
    input uwire id_18,
    input tri0 id_19,
    input wire id_20,
    input tri1 id_21,
    output uwire id_22,
    output wand id_23
);
  supply1 id_25;
  wire id_26;
  or (
      id_14,
      id_0,
      id_11,
      id_6,
      id_21,
      id_19,
      id_8,
      id_17,
      id_16,
      id_13,
      id_9,
      id_4,
      id_26,
      id_1,
      id_18,
      id_12
  );
  module_0(
      id_2, id_10, id_4, id_9, id_5, id_18, id_14
  );
  wire id_27;
  assign id_23 = 1;
  assign id_14 = 1;
  assign id_15 = id_8;
  tri0 id_28 = id_17;
  always @("" or posedge 1) #1;
  uwire id_29;
  always @($display)
    for (id_22 = id_25; id_28; id_15 = id_29)
      #1 begin
        $display;
      end
endmodule
