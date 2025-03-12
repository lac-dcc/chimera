// Seed: 590750213
module module_0 (
    input tri1 id_0,
    output tri0 id_1,
    input tri1 id_2,
    output supply1 id_3,
    output tri0 id_4,
    input wand id_5,
    input wor id_6,
    input wor id_7,
    output tri0 id_8
);
  genvar id_10;
  reg  id_11;
  wire id_12;
  always id_11 = #({id_7, id_6 + id_2}) id_12;
endmodule
module module_1 (
    input supply0 id_0,
    output wand id_1,
    output wire id_2,
    input supply0 id_3,
    output logic id_4,
    input supply0 id_5
    , id_14,
    input tri id_6,
    input tri id_7,
    input tri0 id_8,
    input supply1 id_9,
    input wire id_10,
    input tri0 id_11,
    output tri id_12
);
  assign id_14[-1] = id_0;
  always @(posedge -1) #1;
  always @(negedge -1'b0) id_4 = id_3;
  wire id_15;
  ;
  module_0 modCall_1 (
      id_8,
      id_2,
      id_11,
      id_1,
      id_2,
      id_0,
      id_7,
      id_5,
      id_1
  );
  assign modCall_1.id_8 = 0;
endmodule
