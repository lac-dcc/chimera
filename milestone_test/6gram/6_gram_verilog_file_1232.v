// Seed: 3402332785
module module_0 #(
    parameter id_3 = 32'd84,
    parameter id_4 = 32'd27,
    parameter id_5 = 32'd36,
    parameter id_6 = 32'd5
) (
    id_1,
    id_2,
    _id_3
);
  input _id_3;
  output id_2;
  input id_1;
  logic _id_4;
  type_0 _id_5 (
      .id_0((1)),
      .id_1(1),
      .id_2(1),
      .id_3(1),
      .id_4(1 == id_2),
      .id_5({id_4[1], id_3}),
      .id_6(id_1),
      .id_7(id_4 + id_3)
  );
  always @(1 or posedge id_3)
    if (1) begin
      id_5 <= "";
    end else begin
      id_1 = (id_2 - 1'b0);
    end
  assign id_4[id_5] = 1;
  logic _id_6;
  assign id_6 = id_2;
  initial begin
    SystemTFIdentifier(1);
    if (~id_2)
      if (id_1)
        case (1)
          "": id_4[1'b0] <= id_3;
          1 'b0 ,  1  ,  1 'b0 ,  (  1  )  ,  id_3  [  1  :  1  +  id_4  ]  ==  id_4  ,  {  ~  id_4  ,  id_5  }  &  1  ,  id_5  ,  1  ,  1  ,  1  ,  id_5  ,  1  ,  1 'b0 ,  1 'b0 ,  1  ,  1  ,  1  ,  1  ,  1  :
          id_1[id_6 : 1] = id_6;
          id_6 / 1: id_1 = id_3[1];
          1'b0: id_5 = 1'b0;
        endcase
      else begin
        id_2 = id_5[(1'b0)==1];
        id_2[id_3[1] : (id_3)] = id_3;
        case (id_1)
          id_4:
          if (id_5) id_4 <= 1;
          else begin
            #1 id_4 = id_1;
          end
          id_6: begin
            id_1 = 1'b0;
          end
          ~id_2#(
              .id_5(id_4[1 : (1)])
          ) == id_4: begin
            id_3 <= {1{id_4}} * id_4;
            id_2 = id_5;
          end
        endcase
      end
    else begin
      id_3 = 1 == id_3;
    end
  end
endmodule
