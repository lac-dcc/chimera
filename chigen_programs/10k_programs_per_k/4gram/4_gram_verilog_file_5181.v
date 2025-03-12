// Seed: 2426504726
module module_0 (
    input wand id_0,
    input tri1 id_1,
    input uwire id_2,
    output supply1 id_3,
    input wire id_4,
    output supply1 id_5,
    output supply0 id_6,
    input uwire id_7,
    input wire id_8,
    output uwire id_9
);
  wire id_11;
  ;
  wire id_12;
  assign id_5 = id_1;
  wire id_13;
  ;
  localparam id_14 = 1'b0;
  wire id_15;
endmodule
module module_1 (
    output supply0 id_0,
    input  supply0 id_1,
    input  uwire   id_2
);
  wire id_4;
  nor primCall (id_0, id_2, id_4, id_1);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_0,
      id_2,
      id_0,
      id_0,
      id_1,
      id_2,
      id_0
  );
endmodule
