// Seed: 1761545773
module module_0 (
    id_1,
    id_2
);
  inout id_2;
  inout id_1;
  type_2(
      id_2, id_1, id_1
  );
  assign  id_1  =  id_2  ?  id_2  :  ~  id_2  ?  id_1  :  id_2  ?  id_1  :  id_1  ?  id_1  :  1 'b0 ?  id_2  :  1  ?  id_1  :  1  ?  id_1  :  1  ;
  always @(posedge id_2) begin
    id_2 = 1;
  end
endmodule
