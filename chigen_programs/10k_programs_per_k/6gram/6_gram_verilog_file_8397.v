// Seed: 4226884686
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  reg id_9 = id_6 ? 1 : id_6 - 1;
  reg id_10;
  always id_9 = #(1  : 1'b0 + id_7 - id_3  : id_10) id_10;
  always @(1 or posedge 1) begin
    assume (1);
  end
  wire id_11;
  tri  id_12 = id_7;
  always #1 begin
    #1 $display(1'd0);
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  always @(posedge 1) begin
    id_4 = #1 1'b0;
    if (id_2) begin
      id_4 <= 1 === 1;
      $display;
    end
  end
  module_0(
      id_1, id_3, id_5, id_5, id_1, id_2, id_3, id_5
  );
endmodule
