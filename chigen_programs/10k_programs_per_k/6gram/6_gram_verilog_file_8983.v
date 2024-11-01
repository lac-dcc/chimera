// Seed: 1154059950
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
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  initial begin
    id_7(1);
    id_1 <= 1'h0 - id_7;
    id_4 <= 1;
    id_7 <= id_5;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2 = id_6;
  id_8(
      .id_0((1)), .id_1(id_2), .id_2(id_4), .id_3(id_6)
  );
  reg id_9;
  module_0(
      id_9, id_2, id_6, id_9, id_9, id_4
  );
  always @(posedge id_6 or 1) begin
    id_4 = 1 == id_6;
    if (1'b0) begin
      assign id_8 = 1;
      id_9 <= 1'h0;
      assert (1);
    end else begin
      if (id_6) assert (1);
    end
  end
endmodule
