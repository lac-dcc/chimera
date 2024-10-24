// Seed: 2522506144
`define pp_3 0
module module_0 (
    output id_0,
    output id_1,
    input  id_2
);
  logic id_3;
  logic id_4;
  always @(posedge id_3) begin
    id_0 <= {id_4{id_3}} - 1;
    if (id_2) id_1 <= 1;
    else id_0 <= 1 - 1'b0;
  end
endmodule
