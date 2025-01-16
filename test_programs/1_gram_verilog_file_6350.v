// Seed: 2496748930
module module_0 (
    input  wor  id_0,
    output wire id_1
);
endmodule
module module_1 (
    input  wand id_0,
    output tri0 id_1
);
  assign id_1 = id_0;
  module_0 modCall_1 (
      id_0,
      id_1
  );
  assign modCall_1.id_0 = 0;
  id_3 :
  assert  property  (  @  (  posedge  id_0  ?  (  1 'b0 +  id_3  )  :  id_3  or  posedge  id_0  or  id_0  !=  -1  or  posedge  1  or  1 'b0 )  id_3  -  ~  id_0  )  begin :LABEL_0
    if (-1) id_1 = id_3;
    $display(-1, id_0 - id_3);
  end
  wire id_4, id_5;
endmodule
