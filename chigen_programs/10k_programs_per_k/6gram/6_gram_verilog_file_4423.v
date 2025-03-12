// Seed: 628556930
module module_0 (
    input tri id_0,
    input supply1 id_1,
    input tri id_2,
    input tri0 id_3,
    input supply0 id_4,
    output logic id_5,
    input wor id_6,
    input wire id_7,
    input wor id_8,
    input wand id_9,
    output supply1 id_10
);
  assign id_5  = {id_4, -1 && -1'h0};
  assign id_5  = id_4 - 1 ? id_8 : -1;
  assign id_10 = 1 + id_3;
  always @(negedge (id_1 ^ id_6 >= id_0)) begin : LABEL_0
    id_5 <= id_0;
    id_5 <= id_2 ? -1 : -1;
  end
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output logic id_0,
    input  tri1  id_1,
    input  tri1  id_2,
    input  wand  id_3,
    output tri0  id_4,
    output wand  id_5
);
  initial begin : LABEL_0
    id_0 <= id_2;
    disable id_7;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_0,
      id_3,
      id_3,
      id_2,
      id_1,
      id_5
  );
endmodule
