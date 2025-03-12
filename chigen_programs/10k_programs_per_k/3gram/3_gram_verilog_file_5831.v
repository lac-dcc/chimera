// Seed: 640430382
module module_0 (
    output tri0 id_0,
    input supply0 id_1,
    output supply1 id_2,
    input tri id_3,
    input supply0 id_4,
    input tri0 id_5,
    input wor id_6,
    input wor id_7,
    output supply0 id_8,
    input supply0 id_9
);
  wire [1 : (  1 'b0 )] id_11;
  assign id_8 = -1 == 1;
  assign module_1.id_0 = 0;
  always @(posedge id_5);
endmodule
module module_1 (
    output logic id_0,
    input  wor   id_1,
    output tri1  id_2
);
  reg id_4;
  ;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1
  );
  id_5 :
  assert property (@(posedge 1) -1'd0)
  else begin : LABEL_0
    id_0 = id_5;
    id_4 <= 1;
    id_4 <= -1;
    id_0 <= id_4;
    id_4 = id_5;
    id_5 <= 1;
  end
endmodule
