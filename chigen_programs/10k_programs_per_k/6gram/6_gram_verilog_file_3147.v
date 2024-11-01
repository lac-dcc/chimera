// Seed: 1683832183
module module_0 (
    input  tri1  id_0,
    output tri1  id_1,
    output wor   id_2,
    output wor   id_3,
    output uwire id_4,
    input  tri0  id_5,
    output wand  id_6
);
  assign id_6 = 1;
  assign  id_4  =  1  ?  id_5  :  1  ?  id_0  :  id_5  ?  id_5  :  1 'd0 ?  1  :  1  ?  id_5  :  1 'b0 ?  id_5  :  id_5  *  id_0  +  1  ?  id_0  ==  id_5  +  id_5  :  1  ;
  assign id_1 = id_5;
  assign id_1 = 1'b0;
endmodule
module module_1 (
    output tri0  id_0,
    input  tri0  id_1,
    output logic id_2,
    output uwire id_3
);
  always @(posedge id_1 or id_1 - 1) begin
    id_2 <= 1'b0;
    forever #1;
  end
  module_0(
      id_1, id_0, id_3, id_3, id_3, id_1, id_3
  );
  supply1 id_5;
  assign id_5 = 1;
  assign id_3 = 1 == id_1 - 1;
  id_7(
      .id_0(id_5)
  );
endmodule
