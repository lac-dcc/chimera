// Seed: 1643738348
module module_0 ();
  wire id_2;
  wire id_3;
  wire id_4;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_1 = 1;
  module_0 modCall_1 ();
  assign id_3 = id_2;
endmodule
module module_2 (
    output supply1 id_0,
    input logic id_1,
    input tri id_2,
    output supply0 id_3,
    input wand id_4,
    input uwire id_5,
    input tri0 id_6,
    input wand id_7,
    output supply0 id_8,
    output logic id_9,
    output supply1 id_10,
    output wor id_11,
    input supply0 id_12,
    input wor id_13,
    input uwire id_14,
    output uwire id_15,
    input wire id_16,
    output supply1 id_17,
    input wand id_18,
    output wor id_19,
    output supply0 id_20,
    input tri id_21,
    inout wire id_22,
    input wand id_23,
    input tri0 id_24
    , id_29,
    output supply1 id_25,
    output supply0 id_26,
    input tri0 id_27
);
  id_30 :
  assert property (@(posedge 1) id_4)
  else begin : LABEL_0
    id_9 <= id_1;
  end
  module_0 modCall_1 ();
  always @(posedge id_7);
  wire id_31;
endmodule
