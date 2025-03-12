// Seed: 3950013035
module module_0 (
    output supply1 id_0,
    input  supply0 id_1,
    output logic   id_2
);
  always @(posedge 1'b0) id_2 = 1;
  assign id_0 = id_1 ? (id_1 == id_1) : id_1;
  logic [1 'b0 : -1] id_4;
  wor id_5 = 1, id_6;
  wand id_7 = 1;
  tri id_8 = id_6 == (1'b0 ^ id_4[-1] ^ id_4);
  assign module_1.id_3 = 0;
  wire id_9;
  ;
endmodule
module module_1 #(
    parameter id_4 = 32'd80,
    parameter id_5 = 32'd86
) (
    input wor id_0,
    input supply1 id_1,
    inout supply0 id_2,
    output wor id_3,
    input tri _id_4,
    input supply1 _id_5,
    output tri id_6,
    output logic id_7
);
  logic [id_5 : id_4] id_9;
  wire id_10;
  ;
  logic id_11;
  ;
  initial
    #1 begin : LABEL_0
      id_7 <= id_1;
    end
  assign id_3 = -1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_7
  );
endmodule
