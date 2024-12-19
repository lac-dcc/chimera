// Seed: 1491545725
module module_0 (
    output tri0 id_0,
    input tri0 id_1,
    input wand id_2,
    input tri0 id_3,
    input tri id_4,
    input supply1 id_5,
    input tri0 id_6,
    input wor id_7,
    input wor id_8,
    output uwire id_9,
    input supply1 id_10,
    output tri id_11,
    input supply1 id_12,
    input tri id_13,
    input supply0 id_14,
    inout uwire id_15,
    input supply0 id_16,
    output wor id_17,
    output supply0 id_18,
    input tri1 id_19,
    inout supply0 id_20
);
  wire id_22;
  wire id_23;
endmodule
module module_1 (
    output uwire id_0,
    input  wand  id_1
);
  uwire id_3;
  assign id_0 = 1 + 1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_0,
      id_1,
      id_3,
      id_1,
      id_3,
      id_1,
      id_3,
      id_0,
      id_1,
      id_3
  );
  assign modCall_1.id_4 = 0;
  tri  id_4 = id_1 & id_3;
  wire id_5;
  function automatic id_6;
    input id_7;
    input id_8;
    case (id_8)
      1: id_0 = id_6;
      default: begin : LABEL_0
        if ("") $display(id_6, id_3);
      end
    endcase
  endfunction
  wire id_9;
  wire id_10, id_11, id_12, id_13;
  wire id_14 = id_12;
endmodule
