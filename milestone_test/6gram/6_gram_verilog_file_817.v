// Seed: 3181494327
`timescale 1 ps / 1ps
module module_0 #(
    parameter id_2 = 32'd13,
    parameter id_7 = 32'd26
) (
    input _id_2,
    input id_3,
    output id_4,
    input id_5,
    output reg id_6,
    output _id_7
);
  always @(posedge id_4) begin
    id_5 = id_6;
    id_4 <= id_5;
    id_2 <= 1;
    #1;
    if (id_1) begin
      id_3 <= id_1;
    end
    SystemTFIdentifier(id_7, 1 + id_4);
    if (id_6) id_5 = 1;
    if (1) begin
      id_5 <= 1;
    end
    id_4[id_7] = id_2;
    if (id_5) begin
      id_5 <= id_2[id_2 : 1];
    end else begin
      if (1)
        if (1 && id_1) id_6 <= id_2[""];
        else if (id_2) id_7 <= id_4[1 : 1];
        else begin
          id_2 <= id_4;
        end
      else begin
        id_5 <= 1;
      end
    end
  end
  always @(id_6) begin
    if (id_7) id_5 <= id_5 - 1;
    id_6 <= id_3 * id_2 + 1'b0;
    #1;
    forever #1;
  end
  assign id_7 = id_1;
  logic id_8;
  assign id_5 = id_6;
endmodule
