// Seed: 2183834728
module module_0 (
    output uwire id_0,
    input wor id_1,
    input tri0 id_2,
    input wand id_3,
    input wor id_4,
    input supply1 id_5,
    input tri0 id_6,
    input tri0 id_7,
    input uwire id_8
);
  always @(posedge id_1 % 1 or posedge 1);
  wire id_10;
  assign id_0 = id_4;
endmodule
module module_1 (
    output supply1 id_0,
    input wor id_1,
    input wor id_2,
    input tri1 id_3,
    input supply1 id_4,
    input wire id_5,
    output tri1 id_6,
    output uwire id_7,
    output tri id_8,
    input tri1 id_9,
    output wand id_10,
    input tri id_11,
    output supply0 id_12,
    input tri0 id_13,
    input tri1 id_14,
    input uwire id_15,
    input tri1 id_16,
    output supply0 id_17,
    output wire id_18,
    input wire id_19,
    input wand id_20,
    output uwire id_21,
    output wire id_22,
    input tri1 id_23,
    output wor id_24,
    inout wor id_25,
    output wand id_26,
    input wire id_27,
    input supply1 id_28,
    input wor id_29,
    input tri0 id_30,
    output tri1 id_31
);
  module_0(
      id_6, id_23, id_27, id_16, id_9, id_5, id_20, id_19, id_14
  );
  always @(posedge id_23);
  id_33 :
  assert property (@(negedge id_13) id_11)
  else begin
    id_12 = (id_15);
    id_17 = id_13;
  end
endmodule
