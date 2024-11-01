// Seed: 792634731
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3, id_4;
  initial begin
    id_2 <= 1'b0;
    $display;
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
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(posedge id_2) begin
    id_2 <= 1;
  end
  uwire id_8;
  always
    if (id_8) id_5 <= 1;
    else begin
      id_5 = id_7[1];
      id_3 = id_4;
      $display(id_4);
    end
  module_0(
      id_3, id_2
  );
endmodule
