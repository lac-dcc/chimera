// Seed: 3338189309
module module_0 (
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
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_7 = id_1;
  always @* id_9 <= id_7;
  always @(posedge 1'b0) begin
    $display;
  end
  wire id_10;
  wire id_11;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  initial begin
    if (id_2) begin
      $display(id_2, 1);
    end else id_2 <= 1;
    #1 begin
      id_2 <= #1 id_2;
      {1 != 1, id_2} <= 1;
      id_1 = 1;
    end
  end
  wire id_3;
  module_0(
      id_2, id_3, id_3, id_3, id_3, id_1, id_2, id_3, id_2
  );
endmodule
