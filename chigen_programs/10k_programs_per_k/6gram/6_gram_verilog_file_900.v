// Seed: 21040328
module module_0;
  wor id_1 = (1);
  integer id_3 = !id_1;
endmodule
module module_1;
  assign id_1 = 1 - id_1;
  module_0();
  initial begin
    release id_1;
    id_1 <= 1;
  end
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  always @(id_5 == id_5 + id_1 or posedge id_5) begin
    id_3 = id_1;
    begin : id_6
      assign id_3 = 1;
      id_6 <= 1;
      #1;
      id_3 <= id_5;
      id_4 <= id_5;
    end
    #0 id_4 <= 1'b0;
    id_3 <= 1 == 1;
    $display(id_2 == 1, id_2 >= id_5);
  end
  module_0();
endmodule
