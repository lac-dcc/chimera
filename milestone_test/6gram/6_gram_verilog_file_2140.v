// Seed: 1715221587
module module_0 #(
    parameter id_1 = 32'd68,
    parameter id_2 = 32'd67
);
  logic _id_2;
  always @(posedge id_1) begin
    id_2[1'd0 : id_1] = id_1;
    #1;
    id_1 <= id_1 && id_2.id_2[1][id_1];
    id_1 <= id_2;
    #1;
    id_1 = id_2;
  end
  always @(posedge "" - 1 or posedge id_1)
    if (1) id_1 <= 1;
    else id_2[1 : id_2[id_2[1'b0 : 1] : id_2]] <= id_2[id_1];
endmodule
