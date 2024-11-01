// Seed: 190933720
module module_0 (
    input  tri   id_0,
    input  uwire id_1,
    output tri1  id_2,
    input  tri0  id_3,
    output tri   id_4
);
  wire id_6;
  wire id_7;
endmodule
module module_1 (
    output wand id_0,
    output uwire id_1,
    input supply1 id_2,
    output supply1 id_3,
    output wire id_4,
    input supply0 id_5,
    output supply0 id_6,
    input tri1 id_7,
    input uwire id_8,
    output wire id_9,
    input uwire id_10,
    input wand id_11,
    input wor id_12,
    output uwire id_13,
    input tri id_14,
    input wand id_15,
    output wor id_16,
    input wire id_17,
    output logic id_18,
    output tri1 id_19,
    input supply0 id_20,
    input wire id_21,
    output logic id_22,
    output wor id_23,
    input wire id_24,
    output tri id_25,
    input supply1 id_26,
    output wand id_27,
    output tri0 id_28,
    input tri1 id_29,
    output tri1 id_30,
    input tri0 id_31,
    input tri id_32,
    input tri id_33,
    input wire id_34,
    input wire id_35,
    output wand id_36,
    output wand id_37,
    input wand id_38,
    output supply0 id_39
);
  always_latch id_18 <= 1;
  assign id_39 = 1;
  if (id_17) assign id_16 = id_34;
  else begin
    wire id_41;
    id_42 :
    assert property (@(posedge id_41, negedge 1) id_17)
    else;
  end
  module_0(
      id_34, id_14, id_39, id_35, id_39
  );
  always id_22 <= 1;
endmodule
