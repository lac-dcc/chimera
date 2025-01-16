// Seed: 2138403966
module module_0 (
    output wor id_0,
    output tri1 id_1,
    output supply0 id_2,
    output wire id_3,
    output uwire id_4,
    input wand id_5,
    input tri0 id_6,
    input tri0 id_7,
    output tri id_8,
    input tri0 void id_9,
    output tri0 id_10,
    input wand id_11,
    output tri1 id_12
);
  wire id_14;
  assign module_1.id_18 = 0;
  wire id_15;
endmodule
module module_1 #(
    parameter id_33 = 32'd85
) (
    input supply1 id_0,
    output wor id_1,
    output wor id_2,
    input tri0 id_3,
    input tri1 id_4,
    input uwire id_5,
    input wire id_6,
    input tri1 id_7,
    input wire id_8,
    output wire id_9,
    output supply1 id_10,
    input tri1 id_11,
    input tri1 id_12,
    input tri0 id_13,
    input wor id_14,
    input tri id_15,
    input wor id_16,
    input tri1 id_17,
    input tri0 id_18,
    input uwire id_19,
    output tri1 id_20,
    input wand id_21,
    input supply1 id_22,
    output tri1 id_23,
    output uwire id_24,
    input supply1 id_25,
    input wand id_26,
    input tri id_27,
    input wor id_28,
    output wand id_29,
    input tri0 id_30,
    output tri id_31
);
  defparam id_33 = -1'b0;
  assign id_9 = 1'b0;
  id_34(
      .id_0(id_14), .id_1(-1'b0 | (-1)), .id_2(1), .id_3(-1)
  );
  assign id_23 = 1;
  xnor primCall (
      id_20,
      id_25,
      id_22,
      id_0,
      id_33,
      id_18,
      id_21,
      id_11,
      id_34,
      id_4,
      id_14,
      id_15,
      id_7,
      id_19,
      id_28,
      id_16,
      id_3,
      id_12,
      id_8,
      id_6,
      id_17,
      id_26,
      id_30,
      id_27,
      id_13,
      id_5
  );
  assign id_20 = id_25;
  assign id_2  = id_27;
  module_0 modCall_1 (
      id_9,
      id_29,
      id_1,
      id_10,
      id_31,
      id_3,
      id_3,
      id_21,
      id_24,
      id_17,
      id_10,
      id_30,
      id_20
  );
  assign id_31 = 1 - id_7;
  wire id_35;
  wire id_36;
  parameter id_37 = 1;
endmodule
