// Seed: 4190430434
module module_0;
  wire id_2;
  wire id_3;
  wire id_4 = id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  task id_4;
    begin : LABEL_0
      id_2 <= id_4;
    end
  endtask
  wire id_5, id_6, id_7, id_8;
  wire id_9;
  module_0 modCall_1 ();
endmodule
module module_2 (
    input tri1 id_0,
    input wor id_1,
    output tri id_2,
    input wand id_3,
    output supply1 id_4,
    input wand id_5,
    input wire id_6,
    input wand id_7,
    output tri id_8,
    output supply1 id_9,
    output supply0 id_10,
    input supply1 id_11,
    input wand id_12,
    input supply1 id_13,
    output supply0 id_14,
    input wor id_15
);
  wire id_17;
  wire id_18;
endmodule
module module_3 #(
    parameter id_27 = 32'd55,
    parameter id_28 = 32'd79
) (
    input uwire id_0,
    inout supply1 id_1,
    input wand id_2,
    input wor id_3,
    output wire id_4,
    output wor id_5,
    input uwire id_6
    , id_20,
    input wire id_7
    , id_21,
    output supply0 id_8,
    output supply0 id_9,
    input tri0 id_10,
    output wand id_11,
    input uwire id_12,
    input tri id_13,
    output supply0 id_14,
    input uwire id_15,
    input supply0 id_16,
    input tri id_17,
    input supply1 id_18
);
  wire id_22;
  tri id_23 = 1 + 1;
  supply1 id_24;
  always
  fork
    $display((id_24), id_24, id_16);
    #0;
  join_none : SymbolIdentifier
  assign id_14 = 1;
  assign id_20 = 1;
  uwire id_25 = 1;
  module_2 modCall_1 (
      id_21,
      id_1,
      id_20,
      id_2,
      id_20,
      id_18,
      id_20,
      id_17,
      id_4,
      id_24,
      id_4,
      id_13,
      id_17,
      id_7,
      id_14,
      id_2
  );
  wand id_26 = id_20;
  defparam id_27.id_28 = 1 - 1;
  assign id_9 = id_21;
endmodule
