// Seed: 2658191288
`timescale 1ps / 1ps
module module_0 #(
    parameter id_1 = 32'd84
) (
    input _id_1,
    input id_2,
    input id_3
);
  always @(1 or posedge id_1)
    if (id_1) begin
      id_3[(1'b0)] = id_1[1 : (id_1)];
      if (id_2) begin
        id_2 = id_3;
        id_3 <= id_1;
        #1 SystemTFIdentifier(id_3);
        id_1 <= {1, id_1[1], 1, id_2};
        id_3 = id_2;
        id_1[{1{1}}] <= id_3;
        if (1'b0) begin
          {"", ""} <= 1;
        end
        id_3 <= 1 - id_3;
        #1;
        id_3 <= 1 !== id_1;
        wait (1);
        id_4;
      end
    end else id_3 = 1;
  type_6(
      id_1[id_1 : 1'b0&~id_1[1'd0]], (id_2), 1
  );
  assign id_3 = id_3 ? id_1 : 1;
  logic id_5;
  assign id_5 = 1;
endmodule
