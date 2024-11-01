// Seed: 127319476
module module_0 (
    output wor id_0,
    output wor id_1,
    output uwire id_2,
    input uwire id_3,
    input uwire id_4,
    input uwire id_5,
    output tri id_6,
    output wand id_7,
    input wire id_8,
    output wor id_9,
    input supply0 id_10,
    input supply1 id_11,
    output wand id_12,
    input supply1 id_13,
    input supply0 id_14,
    inout supply1 id_15,
    input uwire id_16,
    input supply0 id_17,
    output tri id_18,
    output tri id_19,
    output supply1 id_20,
    output wire id_21,
    input wire id_22,
    input tri1 id_23,
    output supply1 id_24,
    input tri1 id_25,
    input tri id_26,
    output wand id_27,
    input supply0 id_28,
    input wand id_29,
    output wor id_30
);
  generate
    wire id_32;
    always @(*) id_1 = 1;
    wire id_33 = 1'b0;
    begin
      assign id_20 = !1;
      wire id_34;
      wire id_35;
      wire id_36;
    end
    id_37(
        1
    );
    begin
      wire id_38;
      id_39(
          .id_0(id_17)
      );
    end
  endgenerate
  assign id_18 = 1 - id_14;
  assign id_33 = 1'b0;
endmodule
module module_1 (
    input  supply1 id_0,
    input  supply0 id_1,
    output supply0 id_2,
    output supply1 id_3
);
  assign id_3 = id_0;
  wire id_5 = id_1;
  module_0(
      id_3,
      id_3,
      id_5,
      id_5,
      id_0,
      id_1,
      id_2,
      id_5,
      id_1,
      id_5,
      id_5,
      id_1,
      id_3,
      id_0,
      id_0,
      id_5,
      id_1,
      id_1,
      id_2,
      id_5,
      id_5,
      id_3,
      id_5,
      id_5,
      id_5,
      id_5,
      id_0,
      id_5,
      id_0,
      id_5,
      id_5
  );
endmodule
