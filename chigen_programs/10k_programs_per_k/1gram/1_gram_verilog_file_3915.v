// Seed: 1609121388
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
endmodule
module module_1 (
    input wand id_0,
    input tri id_1,
    output wor id_2,
    input wand id_3,
    input wand id_4,
    output tri id_5,
    input uwire id_6,
    input tri id_7,
    output uwire id_8,
    input supply1 id_9,
    output tri id_10,
    input wire id_11,
    input uwire id_12,
    input tri0 id_13,
    output supply1 id_14,
    output wire id_15,
    output supply1 id_16,
    input wor id_17,
    output tri id_18,
    input tri0 id_19,
    input tri id_20,
    input wire id_21,
    output tri0 id_22,
    output supply1 id_23,
    output wand id_24,
    output uwire id_25,
    input supply0 id_26,
    output uwire id_27,
    input wire id_28,
    output tri id_29,
    input uwire id_30,
    output wire id_31,
    input wor id_32,
    input uwire id_33,
    input wor id_34,
    input wor id_35
);
  wire  id_37;
  wire  id_38;
  uwire id_39;
  wire  id_40;
  id_41(
      id_15
  );
  assign id_29 = 1;
  always id_25 = 1;
  always_ff
  fork
    if (1'd0) #1 id_8 = id_0;
    $display();
  join
  assign id_25 = ~id_39;
  wire id_42;
  module_0(
      id_40, id_39, id_42, id_37, id_37, id_42, id_38, id_38, id_37
  );
endmodule
