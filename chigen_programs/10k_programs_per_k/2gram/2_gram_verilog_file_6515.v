// Seed: 4229064865
module module_0 (
    output wire id_0,
    input supply0 id_1,
    inout wire id_2,
    input wand id_3,
    output supply0 id_4,
    output tri0 id_5,
    input uwire id_6,
    input wor id_7,
    input uwire id_8,
    input supply1 id_9,
    output wand id_10,
    output wor id_11
);
  wire id_13;
  wire id_14;
  assign id_4 = (id_9);
  id_15(
      .id_0(1 == 1), .id_1(id_1)
  );
endmodule
module module_1 #(
    parameter id_25 = 32'd21,
    parameter id_26 = 32'd66
) (
    input tri1 id_0,
    input tri1 id_1,
    input wand id_2,
    output wand id_3,
    inout tri0 id_4,
    input wire id_5,
    output wor id_6,
    output supply0 id_7,
    output supply0 id_8,
    input supply0 id_9,
    output wor id_10,
    output wire id_11,
    input tri1 id_12,
    input tri id_13,
    input wand id_14,
    input logic id_15
);
  wor id_17;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_5,
      id_4,
      id_4,
      id_13,
      id_12,
      id_17,
      id_17,
      id_17,
      id_8
  );
  assign modCall_1.id_7 = 0;
  supply0 id_18 = id_14;
  function id_19;
    output id_20;
    id_19 <= id_15;
  endfunction
  wire id_21, id_22, id_23;
  assign id_7 = id_18;
  wire id_24;
  defparam id_25.id_26 = 1;
  always id_7 = id_0;
  wand id_27 = id_18;
  always id_19 = 1;
endmodule
