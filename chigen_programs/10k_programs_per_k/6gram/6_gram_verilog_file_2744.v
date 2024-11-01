// Seed: 1379198529
module module_0 ();
  id_1(
      .id_0(id_2 == ""),
      .id_1(""),
      .id_2(1),
      .id_3(),
      .id_4(1),
      .id_5(1),
      .id_6(1),
      .id_7(id_3 - ~id_2),
      .id_8(1),
      .id_9(1),
      .id_10(id_4 + id_3 == id_4),
      .id_11('b0),
      .id_12(1'h0),
      .id_13()
  );
  assign id_2 = 1;
  wire id_5;
  supply1 id_6;
  assign #1 id_2 = 1'b0;
  assign id_6 = 1'b0;
endmodule
module module_1 #(
    parameter id_25 = 32'd38,
    parameter id_26 = 32'd89
) (
    output supply0 id_0,
    input tri1 id_1,
    input tri1 id_2,
    input wand id_3,
    output uwire id_4,
    input uwire id_5,
    input tri1 id_6,
    output tri1 id_7,
    input wor id_8,
    output wor id_9,
    input uwire id_10,
    input tri0 id_11,
    input supply0 id_12,
    input tri1 id_13,
    input wand id_14,
    input supply1 id_15,
    input uwire id_16,
    input tri id_17,
    output wand id_18,
    input supply1 id_19,
    input wand id_20,
    output wire id_21
);
  always
  fork
    id_23('b0 == id_10);
    #id_24 $display(1);
    #1 id_9 = id_10;
  join
  assign id_4 = id_10 ? id_19 >> 1 : 1'd0;
  defparam id_25.id_26 = 1'b0; module_0();
endmodule
