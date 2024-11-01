// Seed: 394148579
module module_0;
  reg id_1;
  reg id_2 = 1;
  always @(1'd0 or id_2)
    #1 begin
      id_2 <= 1 == id_1;
      id_1 <= 1;
      id_1 <= id_1;
      wait (1'b0);
      disable id_3;
      id_3 <= 1 | 1;
      #1 id_3 = 1;
      if (1) begin
        id_3 <= id_1;
      end else begin
        id_3 = #1 1;
      end
    end
endmodule
module module_1 (
    output logic id_0,
    input  wire  id_1,
    input  wire  id_2
);
  always @(id_2) begin
    id_0 = #id_4 id_4;
  end
  module_0();
endmodule
