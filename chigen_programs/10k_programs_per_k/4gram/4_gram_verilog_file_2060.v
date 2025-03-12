// Seed: 1860190311
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input supply0 id_2
);
  logic [7:0][1 'b0 : 1  +  1] id_4;
  assign id_4[-1] = id_0;
  assign module_1.id_3 = 0;
  wire id_5;
  logic [1 'b0 : -1] id_6;
  ;
  logic [-1 : 1] id_7;
  ;
endmodule
module module_1 (
    input tri id_0,
    input tri id_1,
    output logic id_2,
    input supply1 id_3,
    input supply0 id_4,
    output uwire id_5,
    output uwire id_6,
    output wand id_7,
    input supply0 id_8,
    input wand id_9
);
  generate
    always @(id_9 or posedge id_0) id_2 <= -1;
  endgenerate
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1
  );
endmodule
