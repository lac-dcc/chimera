// Seed: 1753786204
module module_0 #(
    parameter id_5 = 32'd67,
    parameter id_6 = 32'd29
) (
    output id_1,
    input  id_2,
    input  id_3,
    output id_4,
    input  _id_5
);
  assign id_3 = 1;
  logic _id_6;
  type_10(
      1, id_5[1], 1
  );
  assign id_1[1] = id_5;
  generate
    for (id_7 = 1'b0; 1; id_4 = id_5) begin : id_8
      always @(posedge id_7) begin
        if (1)
          if (id_3[id_6 : id_5]) id_6[1] <= id_5[id_5];
          else begin
            id_2 <= 1;
          end
        else begin
          id_4 = id_6;
          if (id_4) begin
            id_8 <= id_5;
            id_8 <= 1;
          end
        end
      end
    end
  endgenerate
endmodule
