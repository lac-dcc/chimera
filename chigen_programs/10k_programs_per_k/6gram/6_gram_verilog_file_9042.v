// Seed: 2445344082
module module_0 (
    inout wand id_0,
    input supply1 id_1,
    input tri0 id_2,
    output wand id_3,
    output supply0 id_4,
    output tri1 id_5,
    input wire id_6
    , id_8
);
  wire [-1 : 1] id_9;
  wire [1 'b0 : 1] id_10;
  wire id_11;
  ;
  struct packed {
    id_12 id_13;
    logic id_14;
  } id_15;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input uwire id_1,
    input supply1 id_2,
    input tri0 id_3,
    output supply1 id_4,
    output tri id_5,
    inout supply0 id_6
    , id_11,
    input supply0 id_7,
    output uwire id_8,
    inout supply1 id_9
);
  assign id_9 = 1;
  module_0 modCall_1 (
      id_9,
      id_7,
      id_1,
      id_9,
      id_9,
      id_6,
      id_6
  );
  assign id_5 = 1;
endmodule
