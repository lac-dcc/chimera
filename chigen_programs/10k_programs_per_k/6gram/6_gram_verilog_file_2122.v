// Seed: 2524850426
module module_0 (
    input supply1 id_0,
    output tri1 id_1
);
endmodule
module module_1 (
    input  logic id_0,
    input  tri1  id_1,
    input  logic id_2,
    output tri   id_3,
    input  wand  id_4,
    input  logic id_5,
    output logic id_6
);
  assign id_6 = 1;
  module_0(
      id_4, id_3
  );
  reg   id_8 = 1;
  logic id_9;
  always @(id_9 or id_1 - 1) begin
    id_8 <= 1;
    casex (0)
      1: begin
        if (1'b0) #1 #1;
        else begin
          id_6 = 1;
          id_9 = 1;
          id_9 <= id_2;
        end
      end
      1: id_8 <= id_5;
      id_0: begin
        id_6 <= id_4 + 1;
        id_8 = 1'b0;
      end
      default: id_3 = 1;
    endcase
    id_6 = #(id_9) 1;
  end
endmodule
