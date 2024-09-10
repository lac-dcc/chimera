// Seed: 1681277627
module module_0 #(
    parameter id_1 = 32'd73,
    parameter id_2 = 32'd21,
    parameter id_4 = 32'd19
) ();
  logic _id_1;
  assign id_1[1] = id_1 ? 1 : 1;
  generate
    if (id_1)
      if (id_1 && id_1) assign id_1[1] = 1;
      else begin : _id_2
        assign id_1 = id_2[id_2];
        assign id_2 = 1;
        defparam id_3._id_4 = 1;
        always @(posedge 1 or posedge id_3) begin
          id_1 = id_3[id_4[id_1-1 : id_2]];
        end
      end
    else begin
      assign id_1 = 1;
    end
  endgenerate
endmodule
