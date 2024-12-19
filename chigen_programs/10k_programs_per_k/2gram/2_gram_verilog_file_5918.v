// Seed: 1161846696
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  reg id_8;
  id_9(
      .id_0(), .id_1(id_1), .id_2(id_5), .id_3(1)
  );
  supply1 id_10 = "" - 1;
  wand id_11;
  assign id_11 = 1;
  wand id_12 = 1;
  wire id_13;
  always
    if ((1 == 1 !== 1)) begin : LABEL_0
      id_8 <= 1;
    end else id_5 = 1'b0;
  wire id_14, id_15;
  id_16(
      .id_0(1), .id_1(id_1)
  );
  wire id_17 = 1;
  id_18(
      .id_0(1 <-> (""))
  );
endmodule
module module_1 #(
    parameter id_5 = 32'd65,
    parameter id_6 = 32'd47
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  defparam id_5.id_6 = +1; id_7(
      .id_0((id_6)), .id_1(1), .id_2(id_5), .id_3(id_2)
  );
  and primCall (id_2, id_8, id_7, id_1, id_4, id_5, id_3);
  id_8(
      .id_0(id_6), .id_1(id_6), .id_2(1), .id_3(id_4), .sum(id_2)
  );
  assign id_3 = 1'h0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_2,
      id_2,
      id_3,
      id_2
  );
  assign modCall_1.type_19 = 0;
endmodule
