// Seed: 3518737760
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  assign module_1.id_1 = 0;
  wire id_3;
  tri  id_4;
  assign id_4 = 1'd0;
  wire id_5;
  wire id_6, id_7, id_8;
  wire id_9;
  wire id_10 = 1;
  wire id_11;
  wire id_12;
endmodule
module module_1 (
    input wor id_0,
    input wor id_1,
    output wire id_2,
    input supply0 id_3,
    input wor id_4,
    input wor id_5,
    input supply0 id_6,
    input tri1 id_7,
    output tri0 id_8
);
  wire id_10;
  wand id_11;
  always @(posedge id_0 or posedge 1) begin : LABEL_0
    id_11 = id_5;
    #1;
  end
  and primCall (id_2, id_11, id_5, id_7, id_4, id_3, id_0, id_1, id_10);
  module_0 modCall_1 (
      id_10,
      id_10
  );
endmodule
