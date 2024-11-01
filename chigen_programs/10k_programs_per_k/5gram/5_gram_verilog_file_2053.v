// Seed: 409027103
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  id_6(
      .id_0(id_3), .id_1(1)
  );
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
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  reg id_8 = id_4, id_9;
  wire id_10;
  always
  fork
    $display;
    begin
      id_3 = 1;
      id_1 <= id_5;
    end
  join
  module_0(
      id_2, id_10, id_10, id_10, id_10
  );
  initial begin
    id_3 = id_1;
    id_6 = id_8;
  end
  always @(negedge id_10) begin
    if (1 == id_2) begin
      id_5 = 1 >= (1'b0);
      if (id_7) id_8 <= id_4;
      else disable id_11;
    end else if (id_9) id_4 <= id_8 - 1;
    else begin
      deassign id_5;
    end
  end
endmodule
