// Seed: 3753778370
module module_0 #(
    parameter id_1 = 32'd24,
    parameter id_2 = 32'd95,
    parameter id_4 = 32'd82,
    parameter id_6 = 32'd45
) (
    _id_1,
    _id_2,
    id_3
);
  input id_3;
  output _id_2;
  input _id_1;
  logic _id_4;
  initial
    if (1) begin
      id_3 = 1;
      if (1)
        case (id_1)
          id_2: id_4 = 1;
          id_3: id_3 = 1'h0;
          id_2: begin
            case (1)
              id_1 - 1: id_2 <= 1;
              1: begin
                id_1 <= id_1;
                id_2[1 : 1] = id_4[1'b0*id_2 : id_4];
                id_4 <= id_1;
                SystemTFIdentifier(id_4);
                #id_5 id_3 = id_1;
                if (1) begin
                  SystemTFIdentifier;
                end else begin
                  id_3 <= 1'h0;
                end
              end
              1: id_2 = id_2[1 : id_1] | 1;
              1'h0: begin
                id_1 = 1;
              end
            endcase
            id_1 <= id_3;
          end
          1'b0: id_2 = 1'b0;
          id_2: id_2 = 1;
          1 + id_3: id_1 = (1);
          id_3 == id_4[1]: id_1 <= 1;
          1'd0, 1, 1 & id_2, id_3, 1, 1: id_3 = {1{1 - 1}};
          !id_3: begin
            id_1 <= 1;
          end
          id_4 == 1: id_3 = 1;
        endcase
      repeat (1) begin
        id_2 <= id_4;
        id_1#(.id_2(id_3)) [1 : id_2] = id_1[id_4];
        id_4 = id_3[1] < 1;
        logic _id_6;
        id_3[id_6] <= 1;
        if (1'd0)
          if (id_4) id_4 <= 1;
          else id_6 <= id_6[1**id_1];
        else begin
          id_3[1 : 1+1] = id_4 - 1;
        end
      end
      id_3 = 1;
      id_2 <= !id_3;
      id_3 = id_3;
    end
endmodule
