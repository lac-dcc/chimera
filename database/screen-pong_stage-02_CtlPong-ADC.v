// Control game by simple ADC.

module CtlPongADC #(
parameter PULSE = 22
)
(
    input  wire clk,
    input  wire in_ply1,
    input  wire in_ply2,
    output reg [9:0] pos_ply1,
    output reg [9:0] pos_ply2 = 240,
    output wire out_ply1,
    output reg  out_ply2
);

// Constant pulse.
//localparam M = 12_000_000;
//localparam N = $clog2(M);
localparam N = 32;

// General counter.
reg [N-1:0] counter;

// Temporal positions.
reg [9:0] temp_ply1;
reg [9:0] temp_ply2;

// Generate positions with dynamic clock.
reg T;
reg count = 1'b0;

assign  out_ply1 = T;

always @(posedge clk)
begin
//    if (count)
//    begin
//        counter <= counter + 1;
//        temp_ply1 <= temp_ply1 + 1;
//    end
end

always @(posedge counter[PULSE])
begin
    T <= ~T;
//    if (T)
//    pos_ply2 <= pos_ply2 + 1;
end

always @(posedge T)
begin
    //temp_ply1 <= temp_ply1 + 1;
    //temp_ply1 <= 0;
end

always @(posedge in_ply1)
begin
//    if (~count)
//    begin
        temp_ply1 <= temp_ply1 + 1;
//        count <= 1'b1;
//    end
end

always @(negedge in_ply1)
begin
//        temp_ply1 <= temp_ply1 + 1;
end

always @(posedge in_ply2)
begin
    pos_ply1 <= temp_ply1;
    //count <= 1'b0;
    out_ply2 <= ~out_ply2;
end

endmodule