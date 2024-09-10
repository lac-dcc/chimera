// Seed: 2620112082
module module_0 #(
    parameter id_1 = 32'd23,
    parameter id_2 = 32'd67
) (
    _id_1,
    _id_2
);
  output _id_2;
  input _id_1;
  always @(posedge 1 or posedge id_1 / id_1[1] - 1)
    if (id_1) #1 id_1[1] <= id_2;
    else id_2 = 1;
  reg id_3;
  assign  id_3  =  1 'h0 &&  {  1  ,  1  -  id_2  }  &&  1 'b0 &&  id_1  ==  1 'b0 &&  id_2  &&  id_1  ==  id_2  &&  id_1  &&  id_2  ;
  initial begin
    id_3 <= 1;
    if (id_3) begin
      SystemTFIdentifier('b0);
      if (id_2[id_2[1+id_1[id_1]]])
        if (id_3) id_3 <= 1;
        else begin
          id_1 <= "";
        end
    end else SystemTFIdentifier(id_1, id_1);
  end
endmodule
