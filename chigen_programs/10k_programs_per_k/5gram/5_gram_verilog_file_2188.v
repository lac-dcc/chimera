// Seed: 2296586399
module module_0 (
    output wand id_0,
    output wor id_1,
    input tri id_2,
    output uwire id_3,
    input uwire id_4,
    input tri id_5,
    output tri1 id_6,
    output tri0 id_7,
    input tri0 id_8,
    output tri id_9,
    output tri0 id_10,
    output tri0 id_11,
    input uwire id_12,
    output tri id_13,
    output wire id_14,
    output uwire id_15,
    input supply1 id_16,
    output uwire id_17,
    input tri0 id_18
);
  tri id_20, id_21;
  uwire id_22;
  wire  id_23;
  wand  id_24;
  assign id_24 = id_2;
  assign id_22 = 1 != id_20;
  wire id_25;
  id_26 :
  assert property (@(posedge 1'h0) 1'b0)
  else $display(1, 1, 1);
endmodule
module module_1 (
    input  wand id_0
    , id_5,
    output wor  id_1,
    output tri  id_2,
    output tri1 id_3
);
  case (id_0)
    1'h0 == 1: supply1 id_6 = 1;
    default:
    integer id_7;
  endcase
  module_0(
      id_3,
      id_1,
      id_0,
      id_2,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_2,
      id_3,
      id_2,
      id_0,
      id_2,
      id_1,
      id_1,
      id_0,
      id_3,
      id_0
  );
  wire id_8;
  wire id_9;
  and (id_2, id_5, id_6, id_7, id_0);
endmodule
