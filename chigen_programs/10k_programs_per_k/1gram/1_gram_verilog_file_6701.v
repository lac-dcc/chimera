// Seed: 2758017300
module module_0 (
    input supply1 id_0,
    output tri id_1,
    input tri0 id_2,
    input uwire id_3
);
  wire id_5;
  assign module_1.id_6 = 0;
  wire id_6, id_7;
endmodule
module module_1 (
    input wire id_0,
    input uwire id_1,
    input tri0 id_2,
    input uwire id_3,
    input uwire id_4,
    input wor id_5,
    output supply0 id_6
);
  module_0 modCall_1 (
      id_3,
      id_6,
      id_5,
      id_2
  );
  wire id_8, id_9;
endmodule
module module_2 (
    output supply0 id_0,
    input supply1 id_1,
    input supply0 id_2,
    input uwire id_3,
    input tri id_4,
    input tri1 id_5,
    input tri id_6,
    output logic id_7,
    output supply1 id_8,
    input wor id_9,
    output tri0 id_10,
    input supply1 id_11,
    output supply1 id_12,
    input uwire id_13,
    input wire id_14,
    input supply0 id_15,
    output wire id_16,
    input uwire id_17,
    input supply0 id_18,
    input tri1 id_19,
    output supply0 id_20,
    output uwire id_21,
    input supply0 id_22,
    input logic id_23,
    output tri1 id_24,
    input wor id_25,
    input uwire id_26,
    output tri0 id_27,
    input tri id_28,
    output tri id_29,
    input tri0 id_30,
    input uwire id_31,
    input wor id_32,
    input tri id_33,
    input wand id_34,
    input tri0 id_35,
    output tri id_36,
    input wor id_37,
    output supply1 id_38,
    input supply0 id_39,
    output wand id_40
    , id_44 = ^1'h0,
    input wand id_41,
    input uwire id_42
);
  id_45 :
  assert property (@(negedge 1'b0 or posedge id_30) 1'b0) id_7 <= id_23;
  module_0 modCall_1 (
      id_35,
      id_24,
      id_35,
      id_32
  );
  assign modCall_1.type_0 = 0;
  always id_7 <= 1;
endmodule
