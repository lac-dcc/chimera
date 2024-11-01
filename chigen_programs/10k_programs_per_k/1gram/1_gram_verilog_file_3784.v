// Seed: 1385483911
module module_0;
  generate
    reg id_1;
  endgenerate
  reg id_2;
  reg id_3, id_4;
  always_ff #1 begin
    id_1 <= 1;
  end
  assign id_2 = 1'h0;
  initial
    {  1  ?  id_4  :  1  ,  1 'b0 ,  id_4  ,  1  ,  id_1  ,  1 'b0 ,  1 'b0 ,  1  ,  1  ?  1  :  id_4  ,  id_3  ,  id_4  ,  id_1  -  1  ,  id_2  ,  id_3  }  <=  {  id_2  }  -  id_1  ;
  wire id_5, id_6;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_3[1'b0] = id_5;
  module_0();
  wire id_6;
endmodule
