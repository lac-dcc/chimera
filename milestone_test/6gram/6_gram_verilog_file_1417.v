// Seed: 3372810306
module module_0 #(
    parameter id_4 = 32'd84,
    parameter id_5 = 32'd93,
    parameter id_7 = 32'd5,
    parameter id_8 = 32'd21
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    _id_5,
    id_6
);
  input id_6;
  input _id_5;
  output _id_4;
  input id_3;
  output id_2;
  output id_1;
  logic _id_7;
  logic _id_8;
  assign id_4[id_7] = 1 ? id_1[id_5] : id_1;
  always @(id_7[id_8 : 1&id_5]) begin
    if (id_5) id_4[id_5(id_7) : id_4] = 1'b0;
    else begin
      wait (id_1) begin
        id_2 <= id_8;
        case (id_6)
          1: id_8 = 1'b0;
          1 << id_8: id_2 = id_3;
          id_4: id_7 = id_2;
          1'b0: begin
            if (id_4) begin
              #1 id_4 = id_4;
              id_8 = 1;
              SystemTFIdentifier((1 - id_6[1 : id_7[1<1-id_7]-1]));
              id_2 <= 'd0 - 1;
            end else SystemTFIdentifier(id_5);
          end
        endcase
      end
      id_8 = 1;
      id_6 <= 1;
      id_6 <= id_7;
      SystemTFIdentifier(1);
      for (id_6 = 1; 1; id_2 = id_4) begin
        id_2 = id_7;
        SystemTFIdentifier(1);
        id_3 <= 1 / 1'b0 & id_5 & 1'b0 & 1'h0;
        if (1) begin
          id_8 <= 1'd0 - id_4;
          if (1 && id_5[1]) begin
            id_6 <= id_4;
            id_5[1] <= (1 < 1);
            id_7 <= id_7 - id_8 + id_6[1];
            #id_9 #1;
          end
        end else begin
          id_1#(.id_4(1 & 1)) <= 1'b0 | 1;
        end
      end
      if (id_2) begin
        id_5 <= 1;
      end
    end
  end
endmodule
