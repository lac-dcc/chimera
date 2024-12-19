// Seed: 2063437771
module module_0 (
    output uwire id_0,
    output uwire id_1,
    output tri   id_2
);
endmodule
module module_1 (
    output supply1 id_0,
    input wand id_1
);
  supply0 id_3 = 1;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.id_1 = 0;
  supply1 id_4;
  specify
    specparam id_5 = 1;
    if (1) (posedge id_6 => (id_7 +: 1)) = (1, 1);
    if  (  1  |  1  |  1  |  id_4  )  (  posedge  id_8  =>  (  id_9  +:  id_6  )  )  =  (  id_8  :  id_1  +  id_7  -  id_5  :  id_8  ,  id_4  )  ;
  endspecify
endmodule
