// Seed: 416105399
module module_0 (
    output uwire id_0,
    output wand  id_1
);
  assign id_0 = 1;
  wire id_4, id_5;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input supply1 id_1,
    output logic id_2,
    input logic id_3,
    input logic id_4,
    output wand id_5,
    output tri1 id_6,
    input logic id_7,
    input tri1 id_8,
    input supply0 id_9
);
  function id_11;
    input id_12, id_13;
    input id_14;
    id_2 <= 1;
  endfunction
  module_0 modCall_1 (
      id_6,
      id_5
  );
  always $display;
  wire id_15, id_16;
  longint id_17 = 1'b0;
  id_18(
      .id_0(1),
      .id_1((id_14) && 1),
      .id_2(id_4),
      .id_3(1),
      .id_4(1),
      .id_5(id_9),
      .id_6(id_11),
      .id_7(1),
      .id_8(1),
      .id_9(1),
      .id_10(id_13),
      .id_11(1'd0),
      .id_12(!id_11),
      .id_13(1'd0 - 1),
      .id_14(1)
  );
  assign id_11 = id_7 !=? 1;
endmodule
