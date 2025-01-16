// Seed: 440746040
module module_0 (
    output supply1 id_0,
    id_11,
    input uwire id_1,
    input supply1 id_2,
    input tri id_3,
    output tri id_4,
    input supply0 id_5,
    input uwire id_6,
    input wand id_7,
    output tri0 id_8,
    input tri0 id_9
);
  supply0 id_12 = 1'd0;
  wor id_13;
  for (id_14 = -1 && {-1{id_12}}; id_6; id_13 = id_1) tri0 id_15 = id_13;
  wire id_16;
  assign module_1.type_18 = 0;
  wire id_17;
endmodule
module module_1 (
    output wire id_0,
    input  tri0 id_1,
    input  tri1 id_2,
    input  wor  id_3
);
  bit id_5;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_2,
      id_3,
      id_0,
      id_1,
      id_2,
      id_1,
      id_0,
      id_2
  );
  logic [7:0][-1 'b0 -  1] id_6 (id_3);
  string id_7 = "";
  function bit id_8;
    bit id_9 = 1'b0;
    begin : LABEL_0
      id_5 <= id_2 == 1;
      id_8 <= id_9;
      if (-1) id_5 = -1;
    end
  endfunction
  wire id_10;
  always id_9 = 1;
  assign id_9 = 1;
  wire id_11;
  wire id_12;
endmodule
