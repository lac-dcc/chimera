// Seed: 78194577
module module_0 #(
    parameter id_1 = 32'd13,
    parameter id_7 = 32'd57
) (
    input _id_1,
    input id_2,
    input reg id_3,
    input reg id_4,
    output id_5,
    input id_6,
    output logic _id_7
);
  always @(posedge id_6[id_7]) begin
    id_5 <= #1 1'd0;
  end
  reg id_8 = id_6;
  initial begin
    id_3 = {id_3{id_3}};
    id_1 <= id_8;
    #1 id_7 = 1;
    wait ('b0);
    #1;
    SystemTFIdentifier(1);
    #1;
    id_2 <= 1;
    id_4 = 1;
    id_5 <= 1;
    id_6 <= id_3;
    id_2 = 1;
    id_5 = id_4;
    id_4 <= id_7;
    id_2 <= id_6;
    if (id_4) id_7 <= id_7;
    else begin
      if (1'b0) begin
        if (id_3) begin
          id_4 <= 1'b0 * id_1;
        end else SystemTFIdentifier(1, 1);
      end else begin
        id_8 <= (1 || 1) ? id_7 : 1;
      end
    end
  end
  defparam id_9.id_10 = id_4[id_1 : 1*1'b0];
endmodule
