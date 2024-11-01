// Seed: 3971316813
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  int id_3;
  always #1 begin
    if (id_1) begin
      id_2 <= 1;
      #1 id_2 <= 1'b0 & id_2;
    end else begin
      id_2 <= (id_2);
    end
    id_2 <= "";
  end
endmodule
module module_1;
  reg id_1;
  always @(posedge 1 or negedge 1) begin
    if (id_1) begin
      id_1 = 1;
      id_1 <= 1 - 1;
    end
    id_1 <= 1;
  end
  wire id_2 = id_2;
  wor  id_3;
  module_0(
      id_3, id_1
  );
  assign id_3 = 1;
endmodule
