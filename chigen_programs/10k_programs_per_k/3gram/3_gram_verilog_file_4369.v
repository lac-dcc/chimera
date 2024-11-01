// Seed: 4099476301
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_6 = (id_4);
  id_7 :
  assert property (@(posedge id_4) (id_6))
  else begin
    if (id_1)
      if (id_7) begin
        if (id_7) begin
          #1 id_3 <= id_5;
        end else if (id_1) id_3 = #(id_5) 1'd0;
        if (id_1) begin
          id_5 = 1;
          id_7 <= 1;
        end
      end else begin
        id_5 = id_6 === id_5;
      end
    id_5 <= "";
    #1 begin
      id_5 <= 1;
    end
    #(id_4) id_2 = id_7 & id_4;
    #1 id_5 <= 1;
    $display(id_7, 1);
  end
endmodule
module module_1 (
    input  wire  id_0,
    output tri0  id_1,
    output tri   id_2,
    output uwire id_3,
    output wor   id_4,
    output tri0  id_5,
    input  logic id_6
    , id_8
);
  always_comb @(negedge 1) id_8 <= id_6;
  assign id_3 = 1;
  wire id_9;
  module_0(
      id_9, id_9, id_8, id_8, id_8, id_8
  );
endmodule
