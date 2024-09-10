// Seed: 1766666984
module module_0 #(
    parameter id_1 = 32'd19,
    parameter id_2 = 32'd84,
    parameter id_3 = 32'd37,
    parameter id_4 = 32'd98
);
  logic _id_2;
  assign id_2 = id_1 ? id_1 : id_1 ? ~id_1 : id_2;
  assign id_2[id_1] = id_1[id_2];
  logic _id_3;
  assign id_2[id_1] = 1;
  logic _id_4;
  initial begin
    id_1 <= id_2;
    id_4[id_2[id_4]] <= id_4 == 1;
    if ({1, id_1[1|1]})
      if (id_4) begin
        id_1 <= 1'h0 == id_3[1];
      end else if (1) id_2[id_2 : 1'b0] <= id_2[1'b0];
      else id_1 <= 1;
  end
  assign id_1[id_1[id_3]] = 1;
  assign (pull1, pull0) #(id_2) id_2[1'b0] = id_2;
  pulldown (id_3[1'b0], ~id_1, id_3);
  logic id_5;
  assign id_4[id_4] = 1;
  logic id_6;
  always @(negedge id_2) begin
    id_3 <= 1;
  end
  always @(1) begin
    id_3 <= id_3;
  end
endmodule
