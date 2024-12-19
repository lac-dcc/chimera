// Seed: 4210281594
module module_0 (
    output wire id_0,
    input supply1 id_1,
    input tri1 id_2,
    input tri1 id_3,
    output uwire id_4,
    input wire id_5,
    output wire id_6
);
  wand id_8 = {id_1{1 - id_5}};
  assign module_1.type_14 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1,
    input wand  id_2,
    input tri0  id_3
);
  logic [7:0] id_5;
  assign id_5[1] = 1 == 1;
  reg id_6;
  assign id_5[1 : 1] = 1'b0;
  wor id_7 = 1;
  module_0 modCall_1 (
      id_7,
      id_1,
      id_7,
      id_2,
      id_7,
      id_0,
      id_7
  );
  always @(negedge id_7 or posedge id_0) id_6 <= 1;
  wire id_8;
  tri  id_9 = 1;
endmodule
