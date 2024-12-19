// Seed: 1130736369
module module_0;
  wand id_1;
  assign module_1.type_6 = 0;
  assign id_1 = 1;
  assign module_2.type_30 = 0;
  wire id_2;
endmodule
module module_1;
  uwire id_2;
  uwire id_3 = id_3, id_4;
  module_0 modCall_1 ();
endmodule
module module_0 #(
    parameter id_10 = 32'd13,
    parameter id_5  = 32'd26
) (
    input supply1 id_0,
    input supply1 id_1,
    output wor id_2,
    input supply0 id_3,
    input supply0 id_4,
    input wire _id_5,
    output supply1 id_6
    , id_17,
    output wor id_7,
    output tri0 id_8,
    output wand id_9,
    input tri1 _id_10,
    input uwire id_11,
    input wire id_12,
    output logic id_13,
    output uwire module_2,
    input uwire id_15
);
  always_latch #1 id_13 <= 1'b0;
  assign id_6 = 1;
  logic [7:0] id_18;
  wire id_19;
  assign id_18[""] = 1 == id_0;
  id_20(
      .id_0(1'b0), .id_1(1)
  );
  module_0 modCall_1 ();
  assign id_7 = 1;
  tri  id_21 = id_1;
  wire id_22;
  wire id_23;
  wire id_24 = id_22;
  id_25(
      .id_0(id_8), .id_1(1), .id_2(id_14)
  );
  always force id_21[1+:id_10*id_5] = 1;
endmodule
