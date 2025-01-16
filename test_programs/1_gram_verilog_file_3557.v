// Seed: 2001908494
module module_0 (
    input  tri id_0,
    output tri id_1,
    input  wor id_2
);
  assign id_1 = id_2;
  wand id_4, id_5;
  assign id_4 = 1'b0;
endmodule
module module_1 (
    input wand id_0
);
  assign id_2 = id_0;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0
  );
  assign modCall_1.id_1 = 0;
endmodule
program module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  if (id_1) wire id_5;
  else assign id_4 = id_5;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  input wire id_19;
  input wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_11 = id_7 && id_13;
  module_2 modCall_1 (
      id_4,
      id_11,
      id_10,
      id_5
  );
  id_20(
      id_13, -1, 1, 1 & id_12 + ""
  );
  nor primCall (
      id_5,
      id_9,
      id_18,
      id_4,
      id_2,
      id_12,
      id_16,
      id_6,
      id_7,
      id_11,
      id_19,
      id_14,
      id_1,
      id_15,
      id_13
  );
  function id_21(input id_22);
    @(negedge id_19 or negedge 'b0 or id_4 - id_15) id_17 <= #(id_6) id_21 - id_21;
    id_17 = 1'b0;
  endfunction
endmodule
