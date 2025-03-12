// Seed: 1564322890
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  assign module_1.id_8 = 0;
  inout wire id_1;
  integer [-1 'd0 : 1] id_6 = id_3;
  assign id_5 = id_3;
endmodule
module module_1 (
    output uwire id_0,
    output supply0 id_1,
    input tri id_2,
    input supply1 id_3,
    input tri id_4,
    output supply0 id_5,
    input wor id_6,
    input wand id_7,
    output supply1 id_8,
    output uwire id_9,
    output wor id_10,
    output wire id_11
);
  id_13 :
  assert property (@(negedge -1) id_4)
  else $clog2(27);
  ;
  wire id_14;
  wire id_15;
  ;
  assign id_14 = id_2;
  case (id_2)
    id_15: begin : LABEL_0
      wire id_16;
    end
    1: begin : LABEL_1
      assign id_1 = -1 ? id_3 : 1;
    end
  endcase
  module_0 modCall_1 (
      id_14,
      id_15,
      id_15,
      id_14,
      id_13
  );
endmodule
