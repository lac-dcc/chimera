// Seed: 2571668970
module module_0 #(
    parameter id_10 = 32'd95,
    parameter id_9  = 32'd99
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  id_7(
      id_2, 1, id_4
  );
  wor id_8;
  defparam id_9.id_10 = ~id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  reg id_5;
  initial begin
    id_5 <= id_2;
    assert (id_2 || 1);
  end
  always @(posedge 1'b0 or posedge 1) begin
    id_1 = id_4;
    if (1) id_5 <= 1;
    else begin
      assert (1);
    end
  end
  module_0(
      id_1, id_3, id_1, id_1, id_1, id_3
  );
endmodule
