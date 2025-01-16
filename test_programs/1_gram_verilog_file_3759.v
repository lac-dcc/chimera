// Seed: 3922540077
module module_0 (
    input uwire id_0,
    input tri   id_1,
    input uwire id_2
);
  wire id_4, id_5;
  assign id_4 = (-1) - 1'b0;
  supply1 id_6;
  function id_7(id_8);
    #id_9 @(*);
    $display((id_9), id_9, id_7);
  endfunction
  tri id_10;
  assign id_8 = id_1;
  always if (id_6 - 1) id_4 = id_10;
  assign id_4 = 1;
endmodule
macromodule module_1 (
    input  wor   id_0,
    input  uwire id_1,
    output logic id_2,
    input  logic id_3,
    input  wor   id_4,
    output logic id_5,
    input  tri   id_6
);
  assign id_5 = 1;
  wire id_8;
  always id_2 <= id_3;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_4
  );
  assign modCall_1.id_4 = 0;
  assign id_2 = 1'b0 ? -1 : -1;
  assign id_5 = 1;
  or primCall (id_5, id_4, id_6, id_3, id_0, id_1, id_8);
  assign id_2 = 1;
  wire id_9;
  assign id_5 = id_3;
  uwire id_10, id_11, id_12, id_13;
  assign id_12 = id_6;
endmodule
