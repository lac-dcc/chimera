// Seed: 1511608229
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    module_0,
    id_5,
    id_6,
    id_7
);
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_4;
  wire id_5;
  module_0(
      id_4, id_4, id_5, id_4, id_4, id_4, id_1, id_5
  );
endmodule
module module_2 (
    input  logic id_0,
    output logic id_1
);
  initial
    repeat ('b0) begin
      id_1 = #0 id_0;
    end
  logic id_3 = !{1{1}};
  wand  id_4;
  logic id_5;
  logic id_6 = 1;
  logic id_7;
  module_0(
      id_4, id_4, id_4, id_4, id_4, id_4, id_4, id_4
  );
  assign id_1 = 1 ? id_3 : id_4 - id_4;
  always @(posedge id_5 or posedge 1)
    if (1)
      if (id_6 ^ 1)
        if (1) begin
          id_6 = id_3;
          id_5 = {id_3, 1'd0};
        end else if (id_5 !== id_7++) begin
          $display(1, 1, 1'h0, id_7, 1, id_5, {1, 1, id_5});
        end else begin
          id_3 <= id_0;
          id_4 = id_6++ !=? id_0;
        end
endmodule
