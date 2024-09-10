// Seed: 2345905389
module module_0 #(
    parameter id_2 = 32'd67,
    parameter id_5 = 32'd4
) (
    input  id_1,
    input  _id_2,
    output id_3,
    inout  id_4,
    output _id_5,
    output id_6
);
  always #0 begin
    id_4 = id_2[1];
  end
  logic id_7;
  assign id_5[id_2+:1] = 1 - id_6;
  always @(posedge id_6 or posedge 1) begin
    if (id_7[id_5==id_5 : 1'b0]) begin
      id_2 <= (1);
    end else begin
      #1 id_3 = "";
      id_4[1] <= id_5;
    end
  end
  logic id_8;
  assign id_3 = id_3;
endmodule
