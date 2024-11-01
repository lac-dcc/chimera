// Seed: 4040085695
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  for (id_7 = 1; id_7 - 1; id_7 = 1'b0 & 1) begin
    always_latch @(posedge id_7) begin
      if (1) begin
        disable id_8;
      end
    end
    if (id_5) begin : id_9
      wire id_10;
    end else tri id_11 = 1 == id_7;
  end
  generate
    assign id_2 = 1'h0;
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(id_3 or posedge 1) begin
    id_3 <= 1;
    id_2 <= id_6;
    if (id_3)
      if (1'b0 ^ 1'b0)
        forever
        if (1) id_6 <= id_7;
        else id_1 <= 1'd0;
      else if (id_2) begin
        id_5 <= id_7;
        assign id_6 = 0;
      end else id_3 <= id_8;
  end
  module_0(
      id_9, id_4, id_4, id_9, id_9, id_4
  );
endmodule
