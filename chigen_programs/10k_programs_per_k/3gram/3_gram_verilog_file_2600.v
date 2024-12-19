// Seed: 164617464
module module_0 (
    input tri1 id_0,
    output supply0 id_1,
    input supply1 id_2,
    input tri0 id_3,
    input supply0 id_4,
    input tri id_5,
    output tri1 id_6,
    input wor id_7,
    input wor id_8,
    output logic id_9,
    input supply0 id_10,
    input wor id_11
);
  always @*;
  assign id_6 = 1;
  wor  id_13;
  wire id_14;
  assign id_13 = 1;
  always
    repeat ("") begin : LABEL_0
      assign id_13 = 1;
      if (id_3) id_14 = id_10;
      else begin : LABEL_0
        id_9 <= 1;
      end
    end
endmodule
module module_1 (
    input tri id_0,
    inout wire id_1,
    input wand id_2,
    input tri1 id_3,
    input supply0 id_4,
    input uwire id_5,
    output supply0 id_6,
    output tri0 id_7,
    input supply0 id_8,
    input tri1 id_9,
    input wand id_10,
    input wire id_11,
    input tri1 id_12,
    output wire id_13,
    output wand id_14,
    input uwire id_15,
    output uwire id_16,
    output uwire id_17,
    input wire id_18,
    output uwire id_19,
    output logic id_20,
    input uwire id_21,
    input tri id_22,
    input wire id_23,
    input wand id_24,
    input wand id_25,
    output uwire id_26,
    input wand id_27,
    input tri0 id_28
);
  initial
  fork
    if (1) begin : LABEL_0
      id_20 <= #1 1;
      $display(1);
    end
  join_none
  wire id_30;
  wire id_31;
  module_0 modCall_1 (
      id_8,
      id_1,
      id_5,
      id_11,
      id_10,
      id_22,
      id_6,
      id_28,
      id_4,
      id_20,
      id_8,
      id_11
  );
  assign modCall_1.type_20 = 0;
  supply1 id_32;
  id_33(
      id_6, 1
  );
  assign id_17 = 1 << 1;
  assign id_20 = 1;
  assign id_32 = id_23;
  assign id_13 = 1;
endmodule
