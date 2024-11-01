// Seed: 1880254087
module module_0 (
    output tri0 id_0,
    input tri1 id_1,
    input supply0 id_2,
    output wire id_3,
    input wand id_4,
    output supply1 id_5,
    input tri1 id_6,
    output tri0 id_7,
    output wor id_8
);
  id_10(
      .id_0(),
      .id_1(1),
      .id_2(id_7),
      .id_3(1),
      .id_4(1'b0),
      .id_5(id_0.id_6),
      .id_6(1 - 1),
      .id_7(1)
  );
endmodule
module module_1 #(
    parameter id_29 = 32'd45,
    parameter id_30 = 32'd46,
    parameter id_31 = 32'd51,
    parameter id_32 = 32'd21,
    parameter id_33 = 32'd55,
    parameter id_34 = 32'd79,
    parameter id_35 = 32'd88,
    parameter id_36 = 32'd64,
    parameter id_37 = 32'd28,
    parameter id_38 = 32'd41,
    parameter id_39 = 32'd50,
    parameter id_40 = 32'd93,
    parameter id_41 = 32'd0,
    parameter id_42 = 32'd34,
    parameter id_43 = 32'd64,
    parameter id_44 = 32'd24,
    parameter id_45 = 32'd14,
    parameter id_46 = 32'd87
) (
    input uwire id_0,
    input tri1 id_1,
    input wand id_2,
    input supply1 id_3,
    input tri0 id_4,
    input tri1 id_5,
    output wor id_6,
    input tri id_7,
    output wor id_8,
    input uwire id_9,
    input wand id_10,
    output tri1 id_11,
    output tri0 id_12,
    input supply1 id_13,
    input tri id_14,
    output uwire id_15,
    input tri0 id_16,
    input supply0 id_17,
    output wand id_18,
    input wire id_19,
    output supply0 id_20,
    output uwire id_21
);
  logic [7:0] id_23;
  module_0(
      id_20, id_10, id_19, id_6, id_3, id_12, id_13, id_11, id_6
  );
  wire id_24;
  assign id_18 = 1;
  assign id_6  = 1;
  wor   id_25;
  uwire id_26;
  assign id_18 = id_4;
  assign id_23[1'b0] = id_24 && id_17 && id_23[1] == id_3 && id_26;
  wire id_27;
  always @(posedge 1) if (id_10 & id_2) deassign id_11;
  wand id_28;
  defparam id_29.id_30 = 1'b0, id_31.id_32 = id_28, id_33.id_34 = id_33, id_35.id_36 = 1'b0,
      id_37.id_38 = id_32, id_39.id_40 = 1, id_41.id_42 = id_25, id_43.id_44 = 1,
      id_45.id_46 = ~id_16;
endmodule
