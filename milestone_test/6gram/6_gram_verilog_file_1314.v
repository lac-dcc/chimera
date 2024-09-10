// Seed: 596474431
module module_0 #(
    parameter id_1 = 32'd57
) ();
  logic _id_1;
  assign id_1 = 1;
  always @(posedge id_1 or posedge {1,
    id_1 + 1'b0
  })
  begin
    id_1 <= id_1;
    id_1 = 1;
  end
  initial begin
    id_1 <= #1 id_1;
    id_1[id_1] = (id_1);
    assume (1);
    id_1 <= id_1;
  end
endmodule
