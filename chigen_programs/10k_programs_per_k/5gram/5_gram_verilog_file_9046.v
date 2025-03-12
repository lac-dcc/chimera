// Seed: 381698432
module module_0;
  task id_1;
    input id_2;
    begin : LABEL_0
      #1 begin : LABEL_1
        id_2 += -1;
      end
      wait (1);
    end
  endtask
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  module_0 modCall_1 ();
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  nand primCall (id_1, id_2, id_4, id_5, id_6, id_7);
endmodule
module module_2 (
    output wire id_0,
    output uwire id_1,
    input uwire id_2,
    input uwire id_3,
    output tri0 id_4,
    output tri0 id_5
    , id_13,
    output supply0 id_6,
    input supply0 id_7,
    input wor id_8,
    input supply0 id_9
    , id_14,
    input supply0 id_10,
    input wand id_11
);
  assign id_5 = id_7;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
endmodule
