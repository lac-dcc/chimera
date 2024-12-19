// Seed: 2517966575
module module_0 (
    input tri1 id_0,
    output wire id_1,
    input tri1 id_2,
    input tri0 id_3,
    input wand id_4,
    input supply1 id_5,
    output supply1 id_6,
    output supply1 id_7,
    input tri0 id_8,
    input supply0 id_9,
    input tri1 id_10,
    input tri0 id_11,
    input tri id_12,
    input tri0 id_13,
    output wand id_14,
    output wor id_15,
    input tri id_16,
    input wand id_17,
    output wand id_18,
    output wire id_19,
    input uwire id_20,
    input uwire id_21,
    input tri0 id_22,
    input wor id_23,
    input tri1 id_24,
    input uwire id_25,
    input uwire id_26
);
  always force id_15.id_8 = 1'd0;
endmodule
module module_1 #(
    parameter id_6 = 32'd5,
    parameter id_7 = 32'd4,
    parameter id_8 = 32'd33,
    parameter id_9 = 32'd99
) (
    inout uwire id_0,
    input supply1 id_1,
    input wand id_2,
    output wand id_3
);
  assign id_3 = 1;
  case (id_1)
    id_1: begin : LABEL_0
      assign id_0 = id_2 || id_1;
      wire id_5;
    end
    default:
    begin : LABEL_0
      defparam id_6.id_7 = 1; defparam id_8.id_9 = id_9;
    end
  endcase
  string id_10 = "";
  and primCall (id_0, id_5, id_8, id_7, id_9, id_6, id_1, id_2, id_10);
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_3,
      id_3,
      id_2,
      id_2,
      id_3,
      id_3,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_2,
      id_0
  );
  assign modCall_1.id_15 = 0;
  tri0 id_11 = 1;
  id_12(
      .id_0(id_1), .id_1(id_11), .id_2(id_0)
  );
  wire id_13;
  wire id_14;
endmodule
