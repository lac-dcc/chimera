// Seed: 1444539051
module module_0 (
    input reg id_2,
    output reg id_3,
    output id_4
);
  reg id_5 (.id_0(id_3));
  generate
    for (id_6 = 1; id_6; id_4 = {id_5, 1}) begin : id_7
      always @(id_6 or posedge id_7) begin
        wait (id_1);
        if (1'b0) begin
          id_3 = id_5;
          id_6 = id_5;
          SystemTFIdentifier(id_1);
          id_2 <= id_6;
        end
        #1 id_6 = id_2 + id_1;
        #1;
        id_6 <= 1;
        id_3 <= 1'h0;
        id_7 <= 1;
      end
    end
  endgenerate
endmodule
module module_1 #(
    parameter id_2 = 32'd82,
    parameter id_4 = 32'd58
) (
    input id_1,
    input _id_2,
    input logic id_3,
    input _id_4
);
  always @(posedge id_3[id_2 : id_2] or posedge 1) begin
    SystemTFIdentifier(id_3 == 1, 1 * 1 + id_4[id_4[1] : 1]);
    id_4 <= id_2;
  end
  logic id_5;
  logic id_6;
  assign id_6[1] = 1;
  logic id_7, id_8;
  assign id_7[id_4] = 1;
  logic id_9;
  type_1 id_10 (
      .id_0(1),
      .id_1(~(1) == 1),
      .id_2(id_4),
      .id_3(1'd0)
  );
endmodule
